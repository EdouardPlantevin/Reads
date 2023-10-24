# Installation et lancement de SonarQube #

# Installation #

Pour la génération du rapport des tests unitaire et du rapport du coverage, l'installation de Xdebug est nécessaire.

Dans le container du projet exécuter :
```apt-get update```
```apt-get install php8.1-xdebug```

# Lancement #

A l'extérieur du container du projet lancer la commande :
```make run-sonar```

L'analyse du code est envoyée sur SonarQube.
