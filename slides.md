---
title: Slides (Single Page HTML, standalone format)
description: An example slide deck created by Marp CLI
author: Paul Schuhmacher
keywords: kit, marp, design, workflow
paginate: true
headingDivider: 2
header: 'Header content'
footer: 'Footer content'
theme: theme
---

# Demo

<!-- _backgroundColor: black -->
<!-- _color: gold -->

A *dummy demo* showcasing the kit for editing, printing, and publishing presentation materials in Markdown format.

> Une présentation présentant le kit d'édition, d'impression et de publication de supports de présentation au format Markdown.

## Design

![bg right contain](./assets/dfd-print-publish.svg){.marp-bg-img}

- **A single source of truth**: the Markdown sources;
- **Separation of content and presentation**: dedicated CSS stylesheets;
- **Print**: generate documents in multiple formats;
- **Publish**: distribute documents to a server (FTP by default).

## Prints

- *HTML Single Page* : a self-contained HTML document easy to distribute, update and navigate;
- *HTML Slide deck* : html slide deck for live presentation (thanks Marp) ;
- *PDF* : juste because it's easily *uploadable* and portable;
- *Epub* : better than PDF

## Workflow

- [Check the README](https://github.com/paul-schuhm/kit-presentation-impression-publication?tab=readme-ov-file#usage-workflow)
- [🇫🇷 Consulter le README](https://github.com/paul-schuhm/kit-presentation-impression-publication/blob/main/README.fr.md)

## Slide deck with Marp

[Some possibilities](https://marpit.marp.app/markdown).

Open the presenter view of your slide deck.

<!-- 
This is a comment section.
It will appears on your presentation notes on HTML Slide deck, useful for live presentations.
It will be stripped out when published, useful for personal notes/comments/info.
 -->

## Background images

![bg right:63%](./assets/blackbird.jpg){.marp-bg-img}

> [See all available options](https://marpit.marp.app/image-syntax)

## Background images with overlay

<!-- _color: gold -->
<!-- _class: lead -->

![bg cover grayscale:1](./assets/blackbird.jpg){.marp-bg-img}

## Bullet points

- First shalt thou take out the Holy Pin
- Then shalt thou count to three, no more, no less
- Three shall be the number thou shalt count, and the number of the counting shall be three
- Four shalt thou not count, neither count thou two, excepting that thou then proceed to three
- Five is right out
- Once the number three, being the third number, be reached, then lobbest thou thy Holy Hand Grenade of Antioch towards thy foe, who, being naughty in My sight, shall snuff it

## Some code

<!-- _backgroundColor: rgba(237, 237, 237, 1) -->
<!-- _color: blue -->

~~~PHP
function quicksort(array $items): array
{

    if (empty($items)) {
        return $items;
    }

    $pivot = array_shift($items);
    $greater = array_filter($items, fn($item) => $item > $pivot);
    $smaller = array_filter($items, fn($item) => $item <= $pivot);

    return array_merge(quicksort($smaller), [$pivot], quicksort($greater));
}
~~~

## Some code

<!-- backgroundImage: "linear-gradient(to bottom, #ffffffff, #edededff)" -->

Some `main.c` program with a gradient background :

~~~C
#include <stdio.h>
main()
{
    int c;
    c = getchar();
    while (c != EOF)
    {
        putchar(c);
        c = getchar();
    }
}
~~~

## Maths

Some **useful equations** :

$$
\vec{F} = m\,\vec{a}
$$

$$
i\hbar\,\frac{\partial}{\partial t}\,\Psi(\mathbf{r},t)
= \left[-\frac{\hbar^{2}}{2m}\nabla^{2} + V(\mathbf{r},t)\right]\Psi(\mathbf{r},t)
$$
