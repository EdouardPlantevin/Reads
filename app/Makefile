SHELL := /bin/bash

var_set_perms:
	@echo "***** $@"
	chmod 775 -R var/

sudo_var_set_perms:
	@echo "***** $@"
	sudo chmod 775 -R var/

cache_clear:
	@echo "***** $@"
	php bin/console cache:clear

doctrine_db_create:
	@echo "***** $@"
	php bin/console doctrine:database:create

doctrine_db_drop:
	@echo "***** $@"
	php bin/console doctrine:database:drop --force

doctrine_schema_update:
	@echo "***** $@"
	@echo "***** Doctrine Migration update"
    php bin/console doctrine:migration:migrate -n

doctrine_fixtures_load:
	@echo "***** $@"
	php bin/console doctrine:fixtures:load

app_create_admin:
	@echo "***** $@"
	php bin/console eurelis:starterkit:create-admin

app_create_folder:
	@echo "***** $@"
	mkdir -p public/upload/

maintenance_on:
	@echo "***** $@"
	mkdir -p public/upload/
	sed -i -e 's#^MAINTENANCE_MODE=.*$#MAINTENANCE_MODE=true#' .env.local

maintenance_off:
	@echo "***** $@"
	mkdir -p public/upload/
	sed -i -e 's#^MAINTENANCE_MODE=.*$#MAINTENANCE_MODE=false#' .env.local

varm_up_eurelis: sudo_var_set_perms

varm_up_prod: var_set_perms

update: app_create_folder doctrine_schema_update

cache: cache_clear

db_reset: doctrine_db_drop doctrine_db_create doctrine_schema_update

install: doctrine_db_create doctrine_schema_update app_create_admin app_create_folder

create_admin: app_create_admin

db_drop: doctrine_db_drop

db_create: doctrine_db_create

db_update: doctrine_schema_update

maintenance_on: maintenance_on cache

maintenance_off: maintenance_off cache
