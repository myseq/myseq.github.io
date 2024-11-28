---
title: "Get ANSI Code with Euclidean Distant"
date: 2024-11-28T18:18:07+08:00
tags: [ "ansi", "color", "python", "tools" ]
categories: [ "Posts"  ]
summary: "To get the closest ANSI code based on color code in hexidecimal (for fun)."
authors:
  - "xx"
draft: false
---
{{< lead >}}

{{< /lead >}}

> *We all love [cli](/tags/cli/) and <c2>colorful</c2> [console](/tags/console) for our terminal.*

Initially, I was customizing my *zsh shell* prompt for different color combination.
And I learnt about ANSI code in more details.

## ANSI/RGB

There are 3 types of ANSI color codes. 
And here's the breakdown:

 1. 16-color Palette:

    - ANSI codes 30-37 and 90-97 represent a 16-color palette.
    - Each color has a specific RGB value.

 1. 256-color Palette:

    - ANSI codes `38;5;0-255` represent a 256-color palette.
    - This includes the 16-color palette, 216 colors formed by combining 6 levels of red, green, and blue, and 24 greyscale colors.
    - Total **256** possible colors *(`16x` Basic + `216x` RGB + `24x` Grayscale)*.
    - *`print(f'\033[38;5;{0~255}m256-color ANSI code\033[0m')`*

 1. Truecolor ANSI code

    - ANSI codes `38;2;R;G;B` represents true color (R,G,B are int from 0 to 255).
    - HTML Hex code color is represented in truecolor, such as `#a1e335`.
    - Total of **16,777,216** possible colors *(256x256x256)*.
    - *`print(f'\033[38;2;{0~255};{0~255};{0~255}m16M-color ANSI code\033[0m')`*

## Euclidean Distant

In math, [Euclidean distance](https://en.wikipedia.org/wiki/Euclidean_distance) is the method to calculate the distant between two points.
The 2 points can be one-dimension, two-dimension or more.
In this case, we are calculating the RGB which is three-dimension. 

There is no direct 1x1 mapping between all ANSI codes and true RGB colors.
But there is direct mapping between RGB and true RGB. 

Thus, our goal is to find the **approximate** ANSI code by go with the ***closest*** RGB code.

## Pseudocode 

Here's the pseudocode:

 1. Generate a `dict` to store mapping between ANSI code (256-color palette) and corresponding RGB values.
 1. Based on the input value (hex_code), calculate the ***closest*** distant (using Euclidean).
 1. Print the output with sample color/code.

Finally, I put everything in *Python script* called `find_closest_ansi.py`.
It is at the following repo at GitHub.

{{< github repo="myseq/utils" >}}

