# A single document <!-- omit from toc -->

This document is a regular document, not a slide-deck. Could be anything, for example an exercices sheet.

You can previzualise directly this document in any editor supporting Markdown syntax ([Visual Studio Code](https://code.visualstudio.com/docs/languages/markdown), [Retext](https://github.com/retext-project/retext), [Ghostwriter](https://ghostwriter.kde.org/), etc.)

## Table of contents <!-- omit from toc -->

- [Useful things to work on Markdown files in Visual Studio Code](#useful-things-to-work-on-markdown-files-in-visual-studio-code)
- [Adding style in preview](#adding-style-in-preview)
- [Three useful Markdown extensions in Visual Studio Code](#three-useful-markdown-extensions-in-visual-studio-code)
- [Tables](#tables)
- [Bullet points](#bullet-points)
- [Some PHP code](#some-php-code)
- [Some C code](#some-c-code)
- [Maths](#maths)

Add this comment to remove a heading from the toc :

~~~markdown
## Table of contents <!-- omit from toc -->
~~~

## Useful things to work on Markdown files in Visual Studio Code

- `Ctr + Space` : markdown snippets
- `Ctr + Shift + o` : navigate through headers
- Link to heading in another markdown file : type `##`. [A link to an heading in another markdown file](slide-deck.md#design)
- `Ctr + k v` : open side by side preview. Ctr+w to close preview

## Adding style in preview

For example, to load a stylesheet called `style.css` at the root of your current workspace, create a `.vscode/settings.json` file at the root of your projet :

~~~json
// Place your settings in this file to overwrite default and user settings.
{
  "markdown.styles": ["style.css"],
  "[markdown]": {
    "files.trimTrailingWhitespace": false,
  },
}
~~~

The stylesheet will be applied in the preview.

## Three useful Markdown extensions in Visual Studio Code

- [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one), the most useful extension
- [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint), lint your Markdown files for consistency
- [Markdown Table](https://marketplace.visualstudio.com/items?itemName=TakumiI.markdowntable), to work more effectively with the terrible markdown table syntax and **use more tables** (which is a useful content structure !)

## Tables

| bar  | foo  | baz  |
| :--- | :--- | :--- |
| 2    | 1    | 3    |
| 5    | 4    | 3    |

## Bullet points

- First shalt thou take out the Holy Pin
- Then shalt thou count to three, no more, no less
- Three shall be the number thou shalt count, and the number of the counting shall be three
- Four shalt thou not count, neither count thou two, excepting that thou then proceed to three
- Five is right out
- Once the number three, being the third number, be reached, then lobbest thou thy Holy Hand Grenade of Antioch towards thy foe, who, being naughty in My sight, shall snuff it

## Some PHP code

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

## Some C code

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

- Some **useful equations** :

$$
\vec{F} = m\,\vec{a}
$$

$$
i\hbar\,\frac{\partial}{\partial t}\,\Psi(\mathbf{r},t)
= \left[-\frac{\hbar^{2}}{2m}\nabla^{2} + V(\mathbf{r},t)\right]\Psi(\mathbf{r},t)
$$

- Some inline math : $x^2$
- Another math block

$$
\displaystyle
\left( \sum_{k=1}^n a_k b_k \right)^2
\leq
\left( \sum_{k=1}^n a_k^2 \right)
\left( \sum_{k=1}^n b_k^2 \right)
$$
