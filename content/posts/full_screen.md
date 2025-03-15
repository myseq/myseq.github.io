---
title: "Full Screen"
date: 2025-03-15T11:48:04+08:00
tags: [ "dota", "regedit", "warcraft3" ]
categories: [ "Others"  ]
summary: "Full screen configuration for Warcraft III: The Frozen Throne."
authors:
  - "zd"
draft: true
---
{{< lead >}}
*Removing Black Bars for my full screen WarCraft3.*
{{< /lead >}}

## Warcraft III

Yes, it is still my favourite computer game ***Warcraft III: The Frozen Throne***.
Today, I still play the computer game during my free time.

> It is a standalone/portable copy that shared to me back in 2006.

Sometime, we will get *black bars*, either left-right or top-bottom, in our full-screen game.

## Game Display Ratio

The most typical reason for this **black bars**, is the game and computer display have different aspect ratio.

For example, 16:9 game format on a 4:3 screen format, or 4:3 game-format on a 16:9 screen-format.

This also found in the case where an old monitor is used for modern game.

## Full Screen

Here is how we can fix it.

> This works for Windows 7, 8, 10, 11.

 1. Start `regedit.exe`.
 1. Browse to `HKLM\SYSTEM\ControlSet001\Control\GraphicsDrivers\Configuration`.
 1. For each of the key (long letters and numbers as 32-bit value):
    - Expand each key to the end: `\00\00`
    - Change `Scaling` value from **4** (or whatever) to `3`.
 1. Restart computer. (must) 

And everything is good to go. 
Just start the game !!

## Links

 - [Warcraft III: The Frozen Throne](https://en.wikipedia.org/wiki/Warcraft_III:_The_Frozen_Throne)


