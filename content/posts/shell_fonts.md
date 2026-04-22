+++
title =  "Linux Shell Fonts"
date = 2023-07-10T19:05:34+08:00
author = "zd"
tags = [ "font", "shell" ]
categories = [ "Posts" ]
summary = "Deploy new fonts for Linux shell."
draft = false
+++

Here is the step how I customize my shell font in Linux.

## Download fonts 

Download `Noto Sans Mono` font from [Google Fonts](https://fonts.google.com/noto/specimen/Noto+Sans+Mono?selection.family=Noto&query=noto+sans+mono)

Then, download `Cascadia Code` font from Microsoft.
```shell
$ wget https://github.com/microsoft/cascadia-code/releases/download/v2111.01/CascadiaCode-2111.01.zip
```

## Installing Fonts 

```shell
$ cd /usr/share/fonts 
$ sudo mkdir microsoftfonts
$ cd microsoftfonts
$ sudo unzip -d . ~/CascadiaCode-2111.01.zip
$ sudo chmod -R --reference=/usr/share/fonts/opentype /usr/share/fonts/microsoftfonts 
```

```shell
$ cd /usr/share/fonts 
$ sudo mkdir googlefonts
$ cd googlefonts
$ sudo unzip -d . ~/Noto_Sans_Mono.zip
$ sudo chmod -R --reference=/usr/share/fonts/opentype /usr/share/fonts/googlefonts 
```

## Register Fonts 

```shell
$ sudo fc-cache -fv
```

### Check Fonts Installed 

```shell 
$ fc-match NonoSansMono
NotoSansMono-VariableFont_wdth,wght.ttf: "Noto Sans Mono" "Regular"
$ fc-match CascadiaCode 
CascadiaCode.ttf: "Cascadia Code" "Regular"
```

## Change Fonts

### Debian/Ubuntu 

```shell
$ sudo dpkg-reconfigure console-setup
```

### Linux Console

Edit the file `/etc/default/console-setup`:

```console
# CONFIGURATION FILE FOR SETUPCON

# Consult the console-setup(5) manual page.

ACTIVE_CONSOLES="/dev/tty[1-6]"

CHARMAP="UTF-8"

CODESET="Uni2"
#FONTFACE="Fixed"
FONTFACE="Noto Sans Mono"
FONTSIZE="8x16"

VIDEOMODE=

# The following is an example how to use a braille font
# FONT='lat9w-08.psf.gz brl-8x8.psf'

```

