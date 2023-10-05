---
title: "Colors with ANSI Escape Code"
date: 2023-10-02T20:42:53+08:00
tags: [ "ansi", "cli", "color", "console", "shell" ]
categories: [ "Posts"  ]
summary: "Notes about ANSI escape code for colors."
draft: true
---

## ANSI Escape Code

ANSI Escape Code is a technique used to control cussor location, color, font styling on a text terminals, aka "command line" or "cmdline" or "cli". 

Below are the examples, from Wikipedia, how it can be used to change the display on the terminal emulator.

![Python](/images/python_rich_1.png)

### Bash

The following Bash function flashes the terminal until the user presses a key.

`flasher () { while true; do printf \\e[?5h; sleep 0.1; printf \\e[?5l; read -s -n1 -t1 && break; done; }`

Or, you can add it to shell script file.

```bash
#!/bin/bash

flasher () { 
  while true 
    do 
      printf \\e[?5h 
      sleep 0.1 
      printf \\e[?5l 
      read -s -n1 -t1 && break 
    done 
  }
```

### PowerShell

Testing color with ANSI Escape code in PowerShell.

```pwsh
PS> $esc = [char]27
PS> write-host "$esc[32m Green $esc[0m"
 Green
PS> 
```

## Links
 - [ANSI escape code](https://en.wikipedia.org/wiki/ANSI_escape_code)
 - [VT100 User Guide](https://vt100.net/docs/vt100-ug/)

 - https://blog.darkthread.net/blog/ansi-escape-code/
 - https://blog.darkthread.net/blog/ps-set-win-networking/
 - https://blog.darkthread.net/blog/ps-x86/
 - https://blog.darkthread.net/blog/python-for-beginners/



