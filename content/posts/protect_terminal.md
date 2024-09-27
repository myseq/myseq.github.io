---
title: "Protect Your Terminal"
date: 2024-09-13T06:10:10+08:00
tags: [ "cli", "shell", "tools" ]
categories: [ "Essential", "Posts"  ]
summary: "Protect our terminal shell login."
draft: false
---
{{< lead >}}
*As a security practitional, I can protect my shell login with auto-logout and auto-lock.*
{{< /lead >}}

The `Terminal Security Cycle`:

 - ***Autologout***: to protect system resources.
 - ***Terminal Lock***: to protect from unauthorized access.

![](/images/lock_terminal.png)

## BASH/KSH/ZSH

To setup auto-logout where after 10 min (7200 seconds) of inactivity at current login:

```console
$ export TMOUT=7200
```

To ***unset*** or ***disable*** the auto-logout feature for current login:

```console
$ export TMOUT=0
```

To setup and enforce the auto-logout:

```console
$ export TMOUT=7200
$ readonly TMOUT
$ export TMOUT
```

To bypass the enforcement (by starting another shell instance):

```console
$ export TMOUT=7200
$ readonly TMOUT
$ export TMOUT
$  
$ exec env TMOUT=0 zsh
$  
```

## CSH/TCSH

To setup auto-logout where after 10 min of inactivity at current login:

```console
$ set -r autologout 10
$
```

## ScreenRC

In Linux shell environment, `screen` is a terminal multiplexer.
It allows users to manage multiple terminal sessions within a single window or terminal.

There are 2 ways to protect your shell.

 1. `ctrl-a`+`X`: *To lock the `screen` session.* 
 1. Set `idle 900` in `.screenrc` file: *It will respect the idle timeout and lock the session.*

## Virtual Console Lock

`vlock` (Virtual Console Lock) is a command-line utility in Linux used to lock one or more virtual consoles (TTYs). 
This ensures that no one can access the console without providing the correct user password. 
It is especially useful in multi-user environments where multiple people may have access to the same machine.

To lock the current console: 

```console
$ vlock
```

Or, to lock all virtual consoles: 

```console
$ vlock -a 
```

This is can be useful to lock ther terminal securely when you step away, just like screen-saver.
The terminal remain locked until the cirrect user password is entered.




