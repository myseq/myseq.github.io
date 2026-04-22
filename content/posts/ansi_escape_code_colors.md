---
title: "Colors with ANSI Escape Code"
date: 2023-10-09T02:00:53+08:00
tags: [ "ansi", "cli", "color", "console", "shell" ]
categories: [ "Posts"  ]
summary: "Notes about ANSI escape code for colors."
draft: false
---

## ANSI Escape Code

ANSI Escape Code is a technique used to control cussor location, color, font styling on a text terminals, aka "command line" or "cmdline" or "cli". 

In HTML world, all these can be done easily.
In other environment, it may not be as simple as in HTML world.

Below are the examples, from Wikipedia, how it can be used to change the display on the terminal emulator.

## ANSI Color Code

| Foreground | Background | Color Name | VGA |
| :--------: | :--------: | ---------- | :-: |
| 30 | 40 | <mark style="background:#000000;color:#BDBDBD">Black</mark> | 0,0,0 |
| 31 | 41 | <mark style="background:#AA0000;color:#BDBDBD">Red</mark> | 170,0,0 |
| 32 | 42 | <mark style="background:#00AA00;color:#BDBDBD">Green</mark> | 0,170,0 |
| 33 | 43 | <mark style="background:#AA5500;color:#BDBDBD">Yellow</mark> | 170,85,0 |
| 34 | 44 | <mark style="background:#0000AA;color:#BDBDBD">Blue</mark> | 0,0,170 |
| 35 | 45 | <mark style="background:#AA00AA;color:#BDBDBD">Magenta</mark> | 170,0,170 |
| 36 | 46 | <mark style="background:#00AAAA;color:#BDBDBD">Cyan</mark> | 0,170,170 |
| 37 | 47 | <mark style="background:#AAAAAA;color:#303030">White</mark> | 170,170,170 |
| 90 | 100 | <mark style="background:#555555;color:#BDBDBD">Bright Black</mark> | 85,85,85 |
| 91 | 101 | <mark style="background:#FF5555;color:#303030">Bright Red</mark> | 255,85,85 |
| 92 | 102 | <mark style="background:#55FF55;color:#303030">Bright Green</mark> | 85,255,85 |
| 93 | 103 | <mark style="background:#FFFF55;color:#303030">Bright Yellow</mark> | 255,255,85 |
| 94 | 104 | <mark style="background:#5555FF;color:#303030">Bright Blue</mark> | 85,85,255 |
| 95 | 105 | <mark style="background:#FF55FF;color:#303030">Bright Magenta</mark> | 255,85,255 |
| 96 | 106 | <mark style="background:#55FFFF;color:#303030">Bright Cyan</mark> | 85,255,255 |
| 97 | 107 | <mark style="background:#FFFFFF;color:#303030">Bright White</mark> | 255,255,255 |


### Bash (color codes)

Use the following template to print color text.

```bash
echo -e "\e[COLORmSample Text\e[0m"
echo -e "\e[COLOR1;COLOR2mSample Text\e[0m"
echo -e "\e[MODE;COLOR1;COLOR2mSample Text\e[0m"
```

| Options | Description |
| ------- | ----------- |
| echo -e | Interpre blackslash escape |
| \e[ | Begin escape color change |
| MODE | Color mode |
| COLOR1m | Color code + 'm' |
| COLOR2m | Color code + 'm' |
| \e[0m | Reset |


| Mode | Description |
| ---- | ----------- |
| 0 | Normal character |
| 1 | Bold character |
| 4 | Underlined character |
| 5 | Blink character |
| 7 | Reverse video character |

#### Example

Simple test.

```bash
$ echo -e "\e[37m White_Text \e[0m"
 White_Text
$ echo -e "\e[1;34m Light_Blue_Text \e[0m"
 Light_Blue_Text
$ echo -e "\e[1;33;4;44m Underlined Yellow on Blue \e[0m"
 Underlined Tellow on Blue
```

Test all colors with a for-loop.

```bash
for code in {0..255}
    do echo -e "\e[38;5;${code}m"'\\e[38;5;'"$code"m"\e[0m"
done
```

### Bash (flasher)

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
 - Wikipedia [ANSI escape code](https://en.wikipedia.org/wiki/ANSI_escape_code)
 - [VT100 User Guide](https://vt100.net/docs/vt100-ug/)
 - Tool: [ANSI](https://github.com/fidian/ansi)


