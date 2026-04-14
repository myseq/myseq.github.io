---
title: "Local Web"
date: 2024-11-26T22:22:10+08:00
tags: [ "mkdocs", "nginx", "pandoc" ]
categories: [ "Posts"  ]
summary: "A local/online indexing web server."
authors:
  - "xx"
draft: false
---
{{< lead >}}
*`nginx` + `mkdocs` == `localweb`*
{{< /lead >}}

Finished setup a `localweb` repo by installing `nginx` and `mkdocs` today. 

```console
localweb
├── config
├── docs
│   └── assets
├── site
│   ├── assets
│   │   ├── images
│   │   ├── javascripts
│   │   │   ├── lunr
│   │   │   │   └── min
│   │   │   └── workers
│   │   └── stylesheets
│   ├── mkdocs
│   ├── nginx
│   └── search
└── webroot
    └── site -> ../site

```


