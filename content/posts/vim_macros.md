---
title: "Macro in VIM"
date: 2024-03-08T08:16:27+08:00
tags: [ "vim", "macro", "cli" ]
categories: [ "Posts"  ]
summary: "Repeating commands in vim editor with macro."
draft: false
---
{{< lead >}}
*Macro is like a magic.*
{{< /lead >}}

All the while, I'm a fan of Vim editor. 
In fact, this whole blog is edited with Vim editor (manually).

## Macros in VIM

Today I learn my first macro in Vim editor.

Here are the steps to create a macro, to repeat on editing the line, and apply it.

### Creating Macro

To record a macro (from command mode):

 1. Press `q` to start a macro.
 2. Press `h` to register for macro.
 3. Goto insert mode and edit a line as usual.
    - (Goto position of the first line)
    - press `i` to switch to ***insert mode***
    - press `"` for open quote
    - press `ESC` to switch back to ***command mode***
    - press `a` to append to the end of line position and switch to ***insert mode***
    - press `"` and `,` for closing quote with comma
    - press `ESC` to switch back to ***command mode***
    - press`ENTER` to goto next line (at first position)

 4. Press `q` to stop the macro.

### Apply The Macro

To simply apply the recorded macro to a line, press `@h`.

To apply the macro to multiple lines, press `5@h`.

## Demo (YT Shorts)

{{< youtube id="vEToFNSuqrk" title="Macros: Vim Commands" >}}

> Thank you [typecraft](https://www.youtube.com/@typecraft_dev) for the excellent tip!


