# Publishing and distribution kit for Markdown presentations (and regular documents)

- [Publishing and distribution kit for Markdown presentations (and regular documents)](#publishing-and-distribution-kit-for-markdown-presentations-and-regular-documents)
  - [Design](#design)
  - [Dependencies](#dependencies)
  - [Getting Started (workflow)](#getting-started-workflow)
    - [Setup](#setup)
    - [Write](#write)
    - [Layout and format](#layout-and-format)
    - [Print and publish](#print-and-publish)
  - [Cleaning prints](#cleaning-prints)
  - [Notes](#notes)
  - [Tips](#tips)
  - [Useful links](#useful-links)

<!-- 🇫🇷 [French version](README.fr.md) -->

This toolkit lets you produce Markdown-based presentation materials (*slides first*) optimized for printing and multi-format distribution:

- As a *HTML slide deck* for *live presentation* ;
- As a *HTML Single Page* version for online publishing and easy navigation ;
- As a *PDF* for a stable, portable format ;
- As an *epub* for e-readers and offline reading (and because it's the best format to read).

You can *also* print *standard Markdown documents* to HTML, PDF or epub.

Finally, the kit allows you to publish your prints to a remote FTP server.

## Design

<img src="./assets/dfd-print-publish.svg" width=700>

- It is *simple* ;
- It follows the *necessary* and beneficial *separation* of *content* and *presentation* ;
- It is *just* a shell script that wraps [marp](https://marp.app/) and [pandoc](https://pandoc.org/index.html), adding some *useful extra features* to solve real world use cases.

## Dependencies

- [Marp](https://marp.app/), a slide deck framework built on Markdown, based on [marpit](https://marpit.marp.app) ;
- [pandoc](https://pandoc.org/index.html), a universal document converter. Very powerful and easy to script (lovely) ;
- [lftp](https://github.com/lavv17/lftp), an FTP client. Can easily be replaced by another program.

## Getting Started (workflow)

> Adapt and improve as needed.

### Setup

0. **Verify** that `marp`, `pandoc`, and `lftp` are installed :

~~~bash
marp -v
pandoc -v
lftp -v
~~~

1. **Duplicate** the starter kit (Recommended: automate this step with a script);
2. **Create** a `.env` file to list the sources to be printed and your FTP credentials :

~~~bash
cp .env.dist .env
~~~

3. **List** the files you want to print and/or publish in your `.env` file :

~~~.env
#slide-decks
SOURCES_SLIDES=(
    slide-deck.md
    presentation.md
)
#standard documents
SOURCES_DOCS=(
    document.md
    exercices.md
)
~~~

### Write

1. **Start** the *watch* mode on the file you are working on:

~~~bash
marp --html --theme theme.css -w --allow-local-files slide-deck.md
~~~

> Create an alias: `alias marpw="marp --html --theme theme.css -w --allow-local-files"` then `marpw slide-deck.md`

2. **Open** the generated HTML version (`source.html`). As soon as the file is edited, the output updates (*hot reload*).
3. **Write and develop** your Markdown document ([Markdown Marpit flavor](https://marpit.marp.app/markdown)).

### Layout and format

For layout, **edit** the following CSS files (or create your owns) :

- `theme.css`: used by *HTML slide deck* and *PDF*,
- `style.css`: used by *HTML Single Page* and *epub*,
- `style-single.css`: used by *HTML Single Page* *standard* Markdown documents (*override* `style.css`).

> You can easily override CSS for epub with the [CSS media queries](https://developer.mozilla.org/fr/docs/Web/CSS/Guides/Media_queries/Using#types_de_m%C3%A9dia) : `@media print{...} query`, and for HTML Single Page with `@media screen{...}`.

### Print and publish

To **install** the program *globally* :

~~~bash
sudo cp publish /usr/local/bin/pp
sudo cp pp-h2-link.lua /usr/local/bin/
~~~

We will use **`pp` as an alias of the program** for the rest of the documentation.

~~~bash
# Show help
pp -h
# Print all formats (default)
pp
# Print only HTML deck
pp --no-html-single --no-pdf --epub --html-deck
# Or directly
pp --slides-only
# Print only HTML deck + PDF
pp --html-deck --pdf --no-html-single --no-epub
# Print only epub
pp --no-html-single --no-html-deck --no-pdf --epub
~~~

> Printed documents are placed in the `public/` directory by default.

To print **and** **publish** to an FTP(S) server:

~~~bash
# Print and publish to an FTP server (HTML Single Page and PDF by default)
pp --ftp
~~~

To control which formats are uploaded to the FTP server, set the following environment variables :

~~~bash
#Default values
do_publish_html_deck=false
do_publish_html_single=true
do_publish_pdf=true
do_publish_epub=false
~~~

> For standard Markdown documents, only `do_publish_html_single`, `do_publish_pdf` and `do_publish_epub` options are available.

## Cleaning prints

To clean local prints (in `public/`, not the sources !) :

~~~bash
pp --clean
~~~

## Notes

- Slides use [(Marpit) Markdown](https://marpit.marp.app/markdown). Marpit enables **minimalistic slide decks** in the positive sense (*content first* with *clear hierarchy*). **If you need transitions or sophisticated layouts, this may not be the ideal tool** ([though Marp can still do it](https://github.com/marp-team/marp-cli/blob/main/docs/bespoke-transitions/README.md))
- Published documents **do not include comments** from your source Markdown. Use comments freely to annotate your sources
- A table of contents is generated for *HTML Single Page* to **improve navigation** (can be disabled; generated by pandoc)
- The *HTML Single Page* print process uses a [LUA script](./h2-link.lua) to **generate anchors for each level-2 heading**, allowing **URLs pointing to each document section !**
- The *HTML Single Page* output is **self-contained**: it embeds the stylesheet and all images. Larger, but easier to distribute

## Tips

- Marp provides an option to set a slide background image. These images often break *HTML Single Page* and *epub* layouts (image size and caption). A `.marp-bg-img` class is automatically added when printing. Use `.marp-bg-img` in `style.css` to style/resize/change display of background images as needed;
- Adapt `style.css` and `theme.css` to your needs;
- **Markdown is not designed for advanced layout**. If you need image size constraints, classes, or IDs, prefer using the HTML `img` tag rather than Markdown image syntax;
- *Lots of room for improvement !* Maintaining *one single content source* and generating *multiple formats* raises interesting design challenges and small technical issues you can (learn to) solve

## Useful links

- [Marp](https://marp.app/), create slide decks in a full Markdown ecosystem. Easily reuse structured content from your presentations to publish in PDF or HTML, and vice versa. Based on [Marpit](https://marpit.marp.app/);
- [pandoc](https://pandoc.org/index.html): the universal document converter;
- [Marp : use cases](https://github.com/websealevel/poc-marp), a simple repository serving as a reference for using Marp.
