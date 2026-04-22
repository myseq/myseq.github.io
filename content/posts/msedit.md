---
title: "Microsoft Edit (Remake)"
date: 2025-06-16T16:16:16+08:00
tags: [ "cli", "opensource", "tools" ]
categories: [ "Posts"  ]
summary: "From 16-bit to 64-bit cli-app."
draft: false
---
{{< lead >}}
*In 2025, Microsoft has released a free and opensource editor called* ***Microsoft Edit***.
{{< /lead >}}

**MS-DOS Editor**, or `edit.com`, is a standard command prompt editor found in earlier versions of MS-DOS.
It was a 16-bit executable file that shipped with MS-DOS 5.0. 
It also been included as part of all the 32-bit Windows OS.

This 16-bit app has been removed since the released of 64-bit OS due to incampatibility.

> Have you ever used [MS-DOS Editor](https://en.wikipedia.org/wiki/MS-DOS_Editor) before?

## Installation

I just install the latest vesion (1.2.0) today with WinGet.

```pwsh
C:\> winget install Microsoft.Edit
```

Then, simply type `edit.exe`, you will get a full screen editor.

This new console text editor is 100% built with `rust` and released as opensource at GitHub.


> There is another execellent line editor called `edln` which has a unique feature that no other can match.

## Links

 - Line Editor: [Edln](https://en.wikipedia.org/wiki/Edlin)
 - GitHub: [Microsoft Edit](https://github.com/microsoft/edit)

{{< github repo="microsoft/edit" >}}

