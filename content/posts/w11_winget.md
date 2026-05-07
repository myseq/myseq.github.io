---
title: "Installation with Winget"
date: 2026-04-23T12:34:12+08:00
tags: [ "cli", "git", "python", "tools", "win11" ]
categories: [ "Essential", "Posts"  ]
summary: "Installing essential tools with Winget in Windows 11 OS."
authors:
  - "xx"
draft: false
---
{{< lead >}}
*Essential tools: Python, Git, GitHub.*
{{< /lead >}}

Here's how I install some essential tools in Windows 11 OS using *cmdline*.

```cmd
PS > winget install Python.Python.3.13
PS > winget install Git.Git
PS > winget install GitHub.cli
PS > winget install -e --id Microsoft.WindowsTerminal
```



