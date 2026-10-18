---
title: "Security Text File"
date: 2026-10-05T05:22:47+08:00
tags: [ "rfc", "wellknown" ]
categories: [ "Essential", "Posts"  ]
summary: "Website security information."
draft: false
---
{{< lead >}}
*A standard which allows website to define security policies.*
{{< /lead >}}

Today, I just found a way to add the `security.txt` to this blog.

## TL;DR

`/.well-known/security.txt` is an accepted standard (RFC 9116) for website security information that allows security researchers to report security vulnerabilities.

## Hugo Web

To add `security.txt` to Hugo website, go create `.well-known` folder in the root of `static` folder.
Create a `security.txt` file as below.

```
HUGO_SITE/
└── static/
    └── .well-known/
        └── security.txt
```

And, it can be accessed directly at: <https://myseq.github.io/.well-known/security.txt>


## Links

 - [security.txt](https://securitytxt.org/) / GH: [security.txt](https://github.com/securitytxt/security-txt)
 - Wikipedia [security.txt](https://en.wikipedia.org/wiki/Security.txt) / [Sample security.txt](https://en.wikipedia.org/.well-known/security.txt)
 - IANA [security.txt Fields](https://www.iana.org/assignments/security-txt-fields) / [RFC 9116](https://www.rfc-editor.org/info/rfc9116/)
 - GH: [Python Client for /security.txt](https://github.com/Lookyloo/pysecuritytxt)


