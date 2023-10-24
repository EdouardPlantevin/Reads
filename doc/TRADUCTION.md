# Traduction

La page home contient des exemples pour chaque type de traductions (PHP, Twig, JS, PHP Global et Mois).

## Introduction

Le Translator (`App\Translation\Translator`) se charge de préfixer automatiquement les clés de traduction lors de l'appel à la fonction `Translator::trans()` dans les classes PHP et les templates Twig. Il détecte également le "domaine", qui correspond au fichier YAML de traduction à appeler.
Ces préfixes, grâce au séparateur `.`, correspondent à une une arborescence particulière qui a pour but :

* de structurer de manière claire les fichiers YAML afin d'en faciliter la lecture
* de permettre d'utiliser les mêmes clés de traduction à différents endroits du code, puisqu'elles seront différenciées par leur préfixe

La structure des différents fichiers YAML est détaillée ci-dessous.


## Traductions PHP

Le préfixe est construit à partir de la fonction qui appelle `Translator::trans()` et de sa classe. Il a la forme suivante : `Namespace.Class.function.`.
Structure correspondante dans `php.fr.yaml` et `php.en.yaml` :

```
Namespace:
    Class:
        function:
            key: "label"
```


## Traductions Twig

Le préfixe est construit à partir du template qui appelle le filtre `|trans()`. Il a la forme suivante : `folder.filename.`.
Structure correspondante dans `twig.fr.yaml` et `twig.en.yaml` :

```
folder:
    filename:
        key: "label"
```


## Traductions globales

Il s'agit généralement des traductions utilisées à plusieurs endroits du code. Il n'y a pas de préfixe de clés de traduction automatisé pour ce domaine, ni de structure particulière, dans `global.fr.yaml` et `global.en.yaml`. Des préfixes sont parfois ajoutés manuellement dans le code.


## Traductions JS

Ces traductions sont destinées à être injectées en data-attribute puis récupérées en variable globale dans le JS. Il n'y a pas non plus de structure particulière, étant donné le faible nombre de clés, dans `js.fr.yaml` et `js.en.yaml`. Des préfixes sont parfois ajoutés manuellement dans le code.


## Traductions des mois

Ces traductions sont destinées à être injectées en data-attribute puis récupérées dans les calendriers JS, mais également utilisées pour les dropdown de mois dans les FormType Symfony. Les clés correspondent aux numéros des mois dans `months.fr.yaml` et `months.en.yaml`.


### Conseils pour les traductions dans les langues 
Ne pas hésitez à ajouter des conseils supplémentaires en fonctions de vos connaissances et des cas que vous rencontrer

##### Pour le français : 
- inclure les ` :` dans la traduction Fr (espace insécable avant).
  ex : `traduction_key` : `Exemple : ` et non `Exemple`   

##### Pour l'anglais : 
- inclure les `:` dans la traduction En (pas d'espace avant).
  ex : `traduction_key` : `Example: ` et non `Example` 

##### Pour le portugais :  
- Les points d'intérrogation et exclamation sont au début de phrase et fin de phrase. 
  Il faut donc que la partie traduisible contienne toute la phrase ) traduire

##### Dates
-Gerer les dates avec des librairies
