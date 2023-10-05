+++
title =  "Diagramming with Mermaid"
date = 2023-07-24T06:09:14+08:00
author = "zd"
tags = [ "diagram", "mermaid" ]
categories = [ "Posts" ]
summary = "Create diagrams and visualizations using text and code."
draft = false
+++


## About Mermaid

Mermaid allow us to create diagrams and visualizations using merely text and code.

It is a JavaScript-based diagramming tool that renders **Markdown**-inspired text definitions to create diagram easily.

> If you are familiar with Markdown you should have no problem learning Mermaid.

### Mermaid Themes

Mermaid supports different themes at site-wide or individual diagram. 

> For site-wide theme customization, the `initialize` call is used. For diagram specific customization, the `init` directive is used.

Here are the available themes:
  1. `default` - default theme.
  2. `neutral` - black/white theme that suitable for printing.
  3. `dark` - dark-colored that suit for blog or web site.
  4. `forest` - green-shared theme if you like it.
  5. `base` - the only theme that can be modified and customization.

#### Site-wide Theme

```javascript
mermaidAPI.initialize({
  securityLevel: 'loose',
  theme: 'base',
});
```

#### Diagram-specific Theme

```javascript
%%{init: {'theme':'forest'}}%%
  graph LR
    a --> b
    b --> a

    linkStyle 0 stroke:white
    linkStyle 1 stroke:yellow

```

{{< mermaid >}}
%%{init: {'theme':'forest'}}%%
  graph LR
    a --> b
    b --> a

    linkStyle 0 stroke:white
    linkStyle 1 stroke:yellow
{{< /mermaid >}}

### Hugo + Mermaid

Simply follow the instruction at Hugo's [Diagram](https://gohugo.io/content-management/diagrams/).

  - Upgrade to Hugo v0.93.0 and above.
  - It supports `GoAT` and `Mermaid` diagrams.

~~Make sure to turn on `Mermaid` at the front matter.~~

~~```toml mermaid = true ```~~

***Update***:
 - Since I migrated to `blowfish` theme, to insert `Mermaid` diagram, use the shortcodei as below. 

```md
{{</* mermaid */>}}
 graph LR;
 A[Lemons]-->B[Lemonade];
 B-->C[Profit]
{{</* /mermaid */>}}
```

## Links

  - [About Mermaid](https://mermaid.js.org/intro/)
  - Mermaid [Tutorial](https://mermaid.js.org/config/Tutorials.html)
  - Mermaid [Theme Configuration](https://mermaid.js.org/config/theming.html)
  - Mermaid [Live Editor](https://mermaid.live/)
  - Mermaid [online Live Editor](https://mermaid-js.github.io/mermaid-live-editor)

