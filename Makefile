all: load_env run-sonar

SHELL := /bin/bash
CHDIR_SHELL := $(SHELL)
PHP_CONTAINER_DIR := /var/www/html
CONTAINER_NAME := starterkit_symfony

define chdir
	$(eval _D=$(firstword $(1) $(@D)))
	$(info $(MAKE): cd $(_D)) $(eval SHELL = cd $(_D); $(CHDIR_SHELL))
endef

# Définis les commandes pour charger le fichier .env.local (avec le token Sonarqube)
define load_dotenv
	$(eval include app/.env.local)
	$(eval export sed 's/=.*//' app/.env.local)
endef

# Charge le fichier .env.local
load_env: 
	@echo "***** $@"
	$(call load_dotenv)

run-sonar: load_env
	@echo "***** $@"

	@echo "Génération des tests"
	-docker exec --workdir $(PHP_CONTAINER_DIR)/app $(CONTAINER_NAME)  php bin/phpunit --log-junit report.xml > /dev/null

	@echo "Génération du test coverage"
	-docker exec --workdir $(PHP_CONTAINER_DIR)/app $(CONTAINER_NAME)  php -dxdebug.mode=coverage bin/phpunit --coverage-clover coverage.xml
	
	@echo "Fin Génération des tests et coverage"
	
	@sudo chmod 777 app/coverage.xml

	@echo "Modification des path du fichier coverage"
	@sed -i -e 's|$(PHP_CONTAINER_DIR)/||' app/coverage.xml
	@echo "Fin de la modification des path du fichier coverage"
	
	@echo "Envoi du rapport a Sonarqube"
	docker run --user 501:500 -e SONAR_LOGIN=$(SONAR_LOGIN) -v $(shell pwd):/usr/src sonarsource/sonar-scanner-cli