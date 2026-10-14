---
title: "Display Unicode in Command Prompt"
date: 2026-09-30T20:22:47+08:00
tags: [ "cmdline", "unicode" ]
categories: [ "Posts"  ]
summary: "Make Windows Command Prompt (cmd.exe) display Unicode characters correctly."
draft: false
---
{{< lead >}}
*Enter cmdline `chcp` to show the current loaded codepage.*
{{< /lead >}}

By default, Command Prompt uses and older OEM (1252) codepage that doesn't support complex Unicode symbols.

## Temporary Change

In order to make `cmd.exe` supports Unicode, we need 2 things.

 1. Switch to a Unicode-compatible font. Such as **Lucida Console, Consolas**, or **Courier New**.
 1. Set the Code page to UTF-8: `chcp 65001`

 ## Permanent Change

The `chcp` command resets as soon as you close the window. 
To always launch with Unicode support, we need to adjust it in Windows Registry.

```
HKEY_CURRENT_USER\Console
    CodePage (REG_DWORD) = 65001 (Decimal)
```


