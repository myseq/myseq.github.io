---
title: "Executable == Image ? "
date: 2024-05-16T12:14:02+08:00
tags: [ "202e", "exe", "jpeg", "trick", "rtlo" ]
categories: [ "Posts"  ]
summary: "Make an executable app look like an image with RTLO char (202E)."
draft: false
---
{{< lead >}}
*Even with file extension being shown, an executable (exe) file can look like an image file (jpeg) with a trick called ***RTLO***.*
{{< /lead >}}

How can an executable app (.exe) look like an image file?

***Use the RTLO character as a trick in file extension.***

RTLO stands for Right-To-Left Override.
It is a Unicode non-printing character used to write languages read in the right-to-left manner. 
It takes the input and literally just flips the text the other way round.

{{< alert "skull-crossbones" "#7fff00" "#8080FF" "#FFBF00"  >}}
*A **right-to-left override (RTLO) attack** takes advantage of user trust in text files and changes the file extension to an “.exe” executable file.*
*An RTLO attack often used with phishing method that tricks users into thinking that they are opening a harmless text file, but they instead open a malicious executable.*
{{< /alert >}}

## RTLO Trick

Here's the steps to make a `cmd.exe` displayed as `cmd_exe.jpg` in Windows Explorer (with file extension being shown).

> An executable file could be `.exe`, `.bat`, `.cmd`, `.vbs`, `.ps1`, `.com`.

First, get ready with an executable file (exe).
You can convert a Python script to EXE (using PyInstaller) if you want.
Here, I'm using Windows built-in `cmd.exe` as my example. 

 1. Rename the file to `cmd_gpj.exe`.
 1. Open `Character Map`.
 1. Select `Advanced view`.
 1. At the `Go to Unicode` field, type in `202E`. (See the bottom bar showing as `U+202E: Right-To-Left Override`)
 1. Click `Copy` button.
 1. Back to Windows Explorer to select the file `cmd_gpj.exe`.
 1. Press F2 (rename), place cursor between `cmd_` and `gpj.exe`, press ctrl-v (paste). (The filename should be shown as `cmd_exe.jpg`)

![RTLO Sample](/posts/executable_image/rtlo_sample.png)

Notes:

 - See the `image.png` file has file extension being shown.
 - See the `cmd_exe.jpg` file has the type as `Application`.

However, at the cmdline, it will look like:

```powershell
C:\home\>dir

 Directory of C:\home

05/01/2024  11:45 PM    <DIR>          .
05/01/2024  11:26 PM    <DIR>          ..
01/20/2024  04:12 PM           323,584 cmd_ gpj.exe
05/01/2024  11:39 PM                 0 image.png
               2 File(s)        323,584 bytes

```

But when I highlight, copy and paste the filename `cmd_ gpj.exe` to vim editor in Linux terminal, it will display as `cmd_<202e>gpj.exe`.

## What's Next?

With the RTLO trick, we can build a trojon that looks like a image file. 
We need:

 - An image file (.jpg).
 - An executable file (.exe).
 - An icon image file (.ico).

First, goto [IcoConvert](https://icoconvert.com), and convert the image file to an icon file (.ico).

Second, use/open `WinRAR`:

 1. Select `Create SFX archive`.
 1. Click at `Advanced` tab.
 1. Click at `SFX options...` button.
 1. Click at `Setup` tab.
 1. At the `Setup program` and `Run after extraction` section, put in the filenames for the **image file** and the **executable file**. (This will make image file to be opened and follow by executing the executable file once the victim opens the IMAGE)
 1. Click on the `Mode` tab.
 1. Select `Unpack to temporary folder` option.
 1. At the `Silent mode`, select `Hide all` option.
 1. Click at `Text and icon` tab.
 1. At the `Load SFX icon from the file`, browse to previously created icon image file.
 1. Click at `Update` tab.
 1. At the `Overwrite mode`, select `overwrite all files` option.
 1. Click `OK` and `OK`.

A new ***SFX (.exe)*** should be created now.

Next, use the RTLO trick to rename the new SFX (.exe) filename, and make it looks like a JPG file. 

<!-- https://www.youtube.com/watch?v=-nsALpaFZ8U  -->

Here's the simplified flow:

{{< mermaid >}}
flowchart LR
    A1(fa:fa-image image.jpg)
    A2(fa:fa-gear executable.exe)
    A3(fa:fa-icons cover.ico)
    B1[fa:fa-screwdriver-wrench WinRAR]
    C1(fa:fa-layer-group new_sfx.exe)
    D1[fa:fa-gift new_sfx.jpg]

    A1 --> B1
    A2 --> B1
    A3 --> B1 
    B1 -->|Generate| C1
    C1 -->|RTLO| D1
{{< /mermaid >}}


## Links 

 - [PyInstaller Manual](https://pyinstaller.org/en/stable/)


