# Bonnes pratiques

Ce document décrit l'ensemble des bonnes pratiques à suivre pour le projet.
Il reprend les bonnes pratiques standard dans le domaine et décrit des bonnes pratiques spécifique au projet.


## Bonnes pratiques de développement

### Bonnes pratiques PHP et Symfony 

Afin, que tous les développeurs PHP utilisent les mêmes pratiques des standards de développement reconnus, ce projet doit suivre les 
recommandations indiqué dans ce lien des [normes de codages PHPs](https://eurelis.atlassian.net/wiki/spaces/EURKNOW/pages/17367101/PHP+-+Normes+de+codage+PSRs)

De plus, comme il s'agit d'un projet Symfony, nous devons suivre les [standards de codage de Symfony](https://symfony.com/doc/current/contributing/code/standards.html)

Dans la mesure du possible, avoir de petites fonctions. Si une fonction est trop grande, la diviser en plusieurs plus petites fonctions.

Dans la mesure du possible, avoir de petites Class. Si une classe est trop grande, créer des classes utilitaire ou de service pour contenir une partie de la logique.

Les petites fonctions et les petites classes permettent de simplifier la lecture du code et sa compréhension. De plus elle facilite la refactorisation et diminue la dette technique.

Commenter le code au maximum.

Pour s'assurer qu'une partie des bonnes pratiques soient bien implémenter, veuiller installer dans le container php le projet [PHP Coding Standards Fixer](https://cs.symfony.com/) dans un dossier annexe au projet
Lancer la commande prévu pour analyser le code
(TODO_STARTERKICK @flanson, pour plus tard ajouter le projet directement dans l'image PHP eurelis et ajouter la commande dans le makefile.)

### Bonnes pratiques gestion des erreurs

Merci de lire les liens suivant : 
- http://bestpractices.thecodingmachine.com/php/error_handling.html
- https://blog.eleven-labs.com/en/php_handle-exception-gracefully/

### Bonnes pratiques gestion des logs

Bonnes pratiques standards : 
- Ne pas mettre de données sensibles dans les logs (login/password/numéro card banquaire/...)
- Chaque message d'erreur doit être unique. Ex : le message "Une erreur est survenue lors de l'enregistrement" risque de ne pas vous donner beaucoup d'information pour régler le problème (sauf si vous ajoute suffisamment d'éléments dans le context du log)
- Dans la partie message du log, ne pas mettre de message dynamique. Laisser la partie dynamique dans le context du log. Cela permet de simplifier les recherches dans les fichiers de logs (ou ELK).
- Mettre des logs `info` régulièrement surtout quand plusieurs logiques se suivent avec des conditions. En production, ils ne seront logué que si une erreur est détecté et vous donnerons beaucoup plus d'information sur le contexte d'execution.
- Mettre les logs `warning` quand un évènement non attendu se produit mais que ce dernier se pose pas de problème pour l'application. Ex : une commande déjà validé est validé une seconde fois. Le cas est non prévu, mais vous avez quand même géré le cas (message d'erreur utilisateur)
- Mettre les logs `erreur` quand l'évènement ne devrait pas arriver.
- Le message du log doit être claire et bien décrire ce qui se passe. 


Pour les projets symfony nous appliqueront la logique suivant dans les logs symfony :  
Toujours ajouter pour chaque log dans le context un code de log unique. Ce dernier permettra de retrouver le plus rapidement possible où se trouve l'erreur.
 
Ex : 
```php
$this->logger->info("Mon message le plus explicite possible de l'erreur", [
    "context1" => "informations de contextualisation du log",
    "context2" => "informations de contextualisation du log",
    "code" => "MON_CODE_LOG_UNIQUE",
]);
```

Lors de l'initialization du projet se définir une convention de nommage pour le code de log.
Ex : `CLASS_ACTION_ETAPE`

Vous pouvez aussi réfléchir à une convention minimal pour la partie contexte.
Ex : 
```php
$this->logger->info("Mon message le plus explicite possible de l'erreur", [
    "service" => "voiture",
    "subService" => "roues",
    "code" => "RouesHandler_Ajout_Serre_Boullons",
    "context1" => "informations de contextualisation du log",
    "context2" => "informations de contextualisation du log",
    ...
]);
```


## Bonnes pratiques nommenclatures 

Dans la mesure du possible, le nommage des variables doit être en anglais et les commentaires seront fait en Anglais.
Cependant, si le projet contient des règles métier avec des termes métiers Français, il est possible de garder ces termes spécifique en français.

Nommenclatures des variables : 
- Les noms des variables et des fonctions doivent être en camelCase (pas de snake_case) 
- Les noms des classes sont en StudlyCaps.
- Les paramètres de configuration sont en snake_case (services.yml, twig.yml, ...)

## Bonnes pratiques des formulaires

Cadrage des projets lors de l'initialisation (liste des todos pour les formulaires)

TODO_STARTERKICK @??? Ajouter le lien vers la liste des TODO


## Bonnes pratiques API

Si le projet implémente une API, il convient d'ajouter une documentation de l'API de type swagger.
Le module API plateforme permet de générer la page swagger à partir d'annotions dans le code.
De plus, au niveau du nommage des attributs json, il faut avoir des clef d'attribut en camelCase.

OK : 
```json
{
    "nbInAPI": 3451,
    "nbInError": 1033
}
```

KO :
```json
{
    "nb_in_api": 3451,
    "nb_in_error": 1033
}
```

## Bonnes pratiques du projet

### Organisation des dossiers

Pour l'organisation des dossiers voici une prosition d'organistation.
Si cette organisation ne vous convient pas et que vous utilisez d'autre conventions, merci de mettre à jours les règles ci-dessous.

#### Dossier `src`

Suivre l'organisation classique des dossiers symfony décrite [ici](https://symfony.com/doc/current/best_practices.html). 

De plus, si il y a suffisamment de logique métier, vous pourrez ajouter un dossier `metier` (ou `services` au choix) dans lequel sera subdivisé les différents parties du métier.

Ex : 
```
src/metier/voiture/ChassiHandler.php
src/metier/voiture/CarcasseHandler.php
src/metier/voiture/RouesHandler.php
src/metier/moto/RouesHandler.php
src/metier/moto/ChassiHandler.php
src/metier/camion/ChassiHandler.php
src/metier/camion/CarcasseHandler.php
src/metier/camion/RouesHandler.php
scr/metier/common/PharesHandler.php
```

#### Dossier `templating`

Appliquer les consignes du paragraphe `Bonnes pratiques pour l'organisation des templates` du fichier `doc/TEMPLATING_SYMFONY.md`

#### Dossier `js`

Appliquer les consignes du paragraphe `Bonnes pratiques pour l'organisation des templates` du fichier `doc/TEMPLATING_SYMFONY.md`


### Bonne pratiques des commentaires

Il faut au maximum ajouter des commentaires dans le code.
Le but est d'expliciter les éléments suivant : 
- Les règles métiers
- Expliquer les manipulations d'array / d'objet et leur donner un context
- Pourquoi on utilise un algo plutôt qu'un autre. (ex : si jamais on rencontre un problème, indiquez : "Nous faisont comme ça, car lorsque l'on fait de X manière, on rencontre le problème Y")

## Bonnes pratiques supplémentaires

Mettez ici vos bonnes pratiques spécifique à votre projet.


