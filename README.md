# Kit de publication et de diffusion


<!-- 
Activation des modules de pandoc (math)
 -->


- [Kit de publication et de diffusion](#kit-de-publication-et-de-diffusion)
  - [Dépendances](#dépendances)
  - [Design](#design)
  - [Usage (*workflow*)](#usage-workflow)
    - [Configuration](#configuration)
    - [Écriture (dev)](#écriture-dev)
    - [Mise en page](#mise-en-page)
    - [Publication et diffusion (prod)](#publication-et-diffusion-prod)
  - [Commentaires](#commentaires)
  - [Conseils](#conseils)
  - [Liens utiles](#liens-utiles)


Ce kit permet d'écrire des supports de présentation (*slides* *first*) afin de les *imprimer* :

- Au format *HTML slide deck*, pour la présentation ;
- Au format *HTML Single Page* pour diffuser une version web autonome sur une URL. Idéal pour *diffuser une mise à jour* du support et pour *naviguer* dans le document ;
- Au format *PDF*, pour diffuser une version fixe et portable ;
- Au format *epub*.

> On suit **la nécessaire et salutaire séparation du contenu et de la forme**.

- Le kit permet également de publier les différents supports sur un serveur ftp ;
- Les supports de formation sont écrits en **Markdown**. Le document Markdown supporte :
  -  Le code ;
  -  Les expressions mathématiques (teX) ;
  -  Les images.

## Dépendances

- [Marp](https://marp.app/), framework de création de *slides deck* à partir de fichiers Markdown, basé sur [marpit](https://marpit.marp.app/) ;
- [pandoc](https://pandoc.org/index.html), convertisseur de document universel (par exemple Markdown vers PDF). Très puissant et facile à scripter ;
- [lftp](https://github.com/lavv17/lftp), client ftp. Peut être remplacé par un autre programme facilement

Rendre le script `publish` exécutable : 

~~~bash
chmod +x publish
~~~

## Design


## Usage (*workflow*)

> À adapter, améliorer en fonction des besoins.

### Configuration

Vérifier que `marp`, `pandoc` et `lftp` sont bien installés :

~~~bash
marp -v
pandoc -v
lftp -v
~~~

1. **Dupliquer** le kit de départ (Recommandé : automatiser cette tâche avec un script) ;
2. **Créer** un fichier `.env` pour y renseigner la liste des sources à imprimer et vos *credentials* FTP pour publication :

~~~bash
cp .env.dist .env
~~~

### Écriture (dev)

2. Lancer le *watch* du support sur lequel vous travaillez :

~~~bash
marp --html -w --allow-local-files source.md
~~~

> Se créer un alias : `alias marpw="marp --html -w --allow-local-files"` puis `marpw source.md`

Ouvrir la version HTML (`source.html`). Dès que le fichier sera édité, le support sera mis à jour (*hot reload*).

3. **Écrire** et développer vos supports au format Markdown ([Markdown Marpit flavor](https://marpit.marp.app/markdown)) ;

### Mise en page

Pour la mise en page, utiliser/éditer les fichiers CSS suivants :

- `theme.css` : utilisé par *HTML slide deck* et *PDF*;
- `style.css` : utiliser par *HTML Single Page* et *epub*

> On pourra facilement surcharger le CSS pour le format *epub* avec [la *media query* `@media print{...}`](https://developer.mozilla.org/fr/docs/Web/CSS/Guides/Media_queries/Using#types_de_m%C3%A9dia) et pour le format *HTML Single Page* avec la *media query* `@media screen{...}` ;

### Publication et diffusion (prod)

4. **Imprimer (et publier)** : 

~~~bash
./publish
#Publier et diffuser via ftp
./publish --ftp
~~~

Les documents imprimés sont placés par défaut dans le dossier `public`.

## Commentaires

- Les slides sont au format [(Marpit) Markdown](https://marpit.marp.app/markdown). Le framework Marpit permet donc de créer des **_slides decks_ assez minimalistes**, dans le sens *positif* du terme (*content first* : contenu et hiérarchie claire). **Si vous voulez créer des transitions ou des mises en page sophistiquées, ce n'est peut-être pas l'outil recommandé pour vous** ;
- La procédure pour transformer le *slides deck* Markdown en *HTML Single Page* utilise [un script LUA](./h2-link.lua) pour générer des ancres pour chaque titre de niveau 2. Cela permet de **créer des URL et partager des URL vers chaque section du document** !
- Le document imprimé au format *HTML Single Page* est **autonome** : il contient la feuille de style et toutes les images. Il est donc assez lourd mais peut être diffusé facilement ;
- Pandoc génère une table des matières pour le format *HTML Single Page*, pour faciliter la navigabilité (désactivable)
- Marp propose une option pratique pour [mettre une image en background d'une slide](https://marpit.marp.app/image-syntax?id=slide-backgrounds). Ces images ont tendance à casser les formats de document *HTML Single Page* et epub (taille image et caption). Pour cela, une classe `.marp-bg-img` leur est automatiquement ajouté à l'impression. Utilisez cette classe dans votre `style.css` pour redimensionner l'image à votre convenance ;

## Conseils

- Adapter les fichiers `style.css` et `theme.css` à vos besoins ;
- **Le Markdown n'est pas conçu pour la mise en forme**. Aussi, si vous avez besoin de définir des contraintes de dimension sur vos images, des classes ou id, préférer **utiliser directement [le tag HTML `img`](https://developer.mozilla.org/fr/docs/Web/HTML/Reference/Elements/img)** plutôt que la syntaxe Markdown.
- *Lots of room for improvement !* Il y a encore *beaucoup* de choses à améliorer. Disposer d'*une seule source pour le contenu* que l'on publie vers *différents formats* soulève pas mal de questions intéressantes, fait réfléchir au *design* du système et pose des petites difficultés que l'on peut (apprendre à) résoudre.

## Liens utiles

- [Marp](https://marp.app/), créer ses diapos dans un écosystème full Markdown. Réutiliser ainsi facilement le contenu structuré de vos présentations pour les publier en PDF ou HTML, ou inversement. Basé sur [Marpit](https://marpit.marp.app/), 
- [pandoc](https://pandoc.org/index.html) : convertisseur de document universel
- [poc Marp](https://github.com/websealevel/poc-marp), un dépôt simple qui sert de référence sur l'usage de Marp