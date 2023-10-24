# Template Symfony SmartAdmin (popur de BO) #

Le templating du BO utilise le template SmartAdmin.

Pour plus d'information sur l'intégration de smartadmin (type de blocs, html et classes css, etc...) vous pouvez vous reférez ici :
https://www.gotbootstrap.com/themes/smartadmin/4.5.1/intel_analytics_dashboard.html

Vous pouvez aussi vous baser sur les fichiers html d'exemple qui se trouvent dans le dossier `etc/smartadmin/dist`

L'intégration utilise les css et les js de smartadmin déjà compilé. (`vendors.bundle.css`, `app.bundle.css`, `vendors.bundle.js`, etc...)

NB : si nous avons besoin de modifier ces css/js (ex modification des couleurs primaires, suppression de js, etc...), il faut aller dans le dossier `etc/smartadmin` et suivre les instructions de build.

NB : si nous avons besoin d'ajouter des css/js (par exemple pour ajouter le pluging de lightgallery ou le calendrier, etc...), il faut aller dans le dossier `etc/smartadmin/dist` et copier les fichiers dont vous avez besoin dans le dossier `public`

Ce dernier ne doit pas contenir tous les fichiers de smartadmin, mais uniquement ceux qui sont utilisés. Merci de les ajouter au fur et à mesure uniquement quand vous en avez besoin afin de ne pas avoir 50 fichiers non utilisés dans le projet en production.


## Intégration symfony ##

L'ensemble des templates doivent se trouver dans le dossier `templates`


### Bonnes pratiques pour l'organisation des templates  : ### 

Pour l'organisation des templates, voici une proposition d'organisation des dossiers 
- un dossier `base` qui contient les templates qui n'ont pas de parents. Base full pour la plupart des templates, base light pour les pages de login, base error pour les pages d'erreurs, base emails pour les emails, etc...
- un dossier `layouts` qui contient les différents layouts. Ex `layout-2-colonnes.html.twig`, `layout-3-colonnes.html.twig`, `layout-list.html.twig`, `layout-edit.html.twig`, `layout-detail.html.twig`, etc...

Les templates du dossier `layout` héritent des templates de bases.

Les templates des dossiers ci après héritent des templates de layout bases (ou des templates de base quand ils sont simple [ex les emails et les pages d'erreurs]).
- un dossier `bundles/TwigBundle/Exception` qui contient les templates des pages 404/500, page de maintenance, etc...
- un dossier `emails` qui contient les templates d'emails
- un dossier `security` qui contient les templates de login
- un dossier `metier` qui contient le reste des templates. Les templates sont organisé par sous dossier par fonctionnalité. Ex : pour les pages utilisateurs : `domain/user/list.html.twig`, `domain/user/edit.html.twig`, `domain/user/detail.html.twig`, etc... Pour la nomenclature dans ce dossier, préférer les noms au singulier `user` et non `users`. 
- un dossier `common` qui contient les templates commun à plusieurs fonctionnalités. Il s'agit de petits templates ou de macro tel que bloc de recherche, filtres, popin de confirmation, etc...
- un dossier `include` qui contient les blocs principaux qui sont utilisé partout, ex : menu de gauche, header, footer, 
- un dossier `form` qui contient les templates utilisé dans les formulaires (ou des macro)

Ne pas mettre de js et de css directement dans les templates html.
Les js et css doivents être importé via des fichiers js et css venant du dossier public.

Les fichiers css / js sont inclus dans le template de base si ils sont utilisé partout (ex `js/vendors.bundle.js`, `css/app.bundle.css`, etc ...)
Ils peuvent à la rigueur être inclus uniquement dans un layout si ils sont spécifiques à une fonctionalité (ex : `layout-callendar.html.twig` peut inclure les js et css de fullcallendar)

#### Pour l'organisation des fichiers js / css / assets ####
Mettre les fichiers dans le dossier `public` dans les sous dossiers `js`, `css`, `img`, `media` et `webfonts`
dans les dossiers js et css le dossier eurelis contiendra tous les fichiers js et css spécifiques au projet.

Mettre les fichiers spécifiques au projet dans un sous dossier `eurelis` pour le js et le css :  `js/eurelis`, `css/eurelis`

#### Cachebusting #### 
Pour la gestion du cachebusting (https://www.keycdn.com/support/what-is-cache-busting) nous utilisons la méthode du param query.

Cette dernière s'applique via la function twig `taggedAsset`

Ex : `<link rel="stylesheet" media="screen, print" href="{{ taggedAsset('css/custom/override.css') }}">`

Cela génère automatiquement le lien avec le query param 

Ex : `<link rel="stylesheet" media="screen, print" href="/css/custom/override.css?tag=1.2.5">`

Attention, cela signifie qu'il ne faut pas oublier d'ajouter un tag lors de la livraison du code pour appliquer le cache busting.

Ainsi cette technique doit s'appliquer à tous les fichiers qui sont modifiables lors des développements et évolutions (les fichiers dans le dossier `js/eurelis`)
