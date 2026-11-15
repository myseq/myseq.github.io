---
title: "Password Recommendation"
date: 2022-03-31T23:05:10+08:00
tags: [ "darkhumor", "hashing", "passwordless" ]
categories: [ "Posts", "Essential"  ]
summary: "What is the best password?"
authors:
  - "zd"
draft: false
---
{{< lead >}}
*The best password is the one you never have to type.*
{{< /lead >}}


Recommendations:

 1. Always include a comma-space `, ` in your password. If they ever end up in a data leak, it will break the CSV.

 1. Always include a quotation-space `" ` in your password. If they ever end up in a leaded JSON file, the whole thing breaks.

 1. The best password is "incorrect". So if you forget it, most webapp will remind you "Your password is incorrect".

 1. Secure your password by setting it as ******** so they think it was masked.

 1. For Linux OS, start your password with `$y$` or similar. If they ever leaked, they still think it is encrypted.

Encrypted password format: `$id$salt$hash`

 | Format | Hashing |
 | :----: | :------ |
 | `$1$` | MD5 (legacy/broken) |
 | `$5$` | SHA-256 |
 | `$6$` | SHA-512 |
 | `$y$` | yescrypt |
 | `!` or `!!` | Account locked or password never set (login disabled) |
 | `*` | Password login disabled (invalid hash) |



