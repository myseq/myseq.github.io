+++
title =  "Open New Tab in Hugo"
date = 2023-02-22T19:43:48+08:00
author = "zd"
tags = [ "hugo" ]
categories = [ "Posts" ]
summary = "Open external links in a New Tab in your browser."
draft = false
+++

## Hugo Config

When a link goes to an external website, I prefer to have them open in a new browser tab. 

To accomplish this goal, I need to override the `Hugo` default behavior for rendering links, by creating a new file called `<hugo>/layouts/_default/_markup/render-link.html`.

And copy-paste the following code into the `render-link.html` file. 

```html

<a href="{{ .Destination | safeURL }}"{{ with .Title}} title="{{ . }}"{{ end }}{{ if or (strings.HasPrefix .Destination "http") (strings.HasPrefix .Destination "https") }} target="_blank"{{ end }} >{{ .Text | safeHTML }}</a>

```

With this, any link with http or https, will now open in new tab for external link while within the website, it will open at the same tab. :smile:


