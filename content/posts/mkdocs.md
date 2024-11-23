---
title: "MkDocs (Python)"
date: 2024-11-23T16:57:32+08:00
tags: [ "101", "documentation", "markdown", "python", "tools" ]
categories: [ "Posts" ]
summary: "Documenting project with MkDocs."
authors:
  - "zd"
draft: false
---
{{< lead >}}
*MkDocs is static site generator designed for building project documentation. It is fast and lightweight and written in Python.*
{{< /lead >}}

Today I encounter a tool called **MkDocs** while studying *diagram-as-code*. 

Just like [Hugo](/tags/hugo/), `mkdocs` is also a *static site generator* that designed for building project documentation. 
It converts my `markdown` (.md) files into HTML pages. 

## Tutorial

To get start, follow the video (by James).
Or simply check out the his blog post at [Getting Started with Material for MkDocs](https://jameswillett.dev/getting-started-with-material-for-mkdocs/).

{{< youtube id="xlABhbnNrfI" title="Full Tutorial To Build And Deploy Your Docs Portal" >}}

By following the video and blog post, I manage to complete a project:

 - Create all the contents as `markdown` files (.md).
 - Setup dynamic colour scheme.
 - Customizing icons, logos, custom code blocks, content tabs, and more.
 - Finally, upload the GitHub repo.

From now on, I can use `markdown` to quickly create a beautiful documentation page for my projects.

***MkDocs*** is easy to use and simple to learn.
Here are the commands needed to build my first documentation project. 

```console
$ mkdocs new .
$ mkdocs serve -a 0.0.0.0:8000
$ mkdocs build
```

## Links

 - James blog post: [Getting Started with Material for MkDocs](https://jameswillett.dev/getting-started-with-material-for-mkdocs/)
 - [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)

