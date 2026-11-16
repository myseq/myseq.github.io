---
title: "Cascadia Code"
date: 2026-11-16T16:09:17+08:00
tags: [ "cascadia", "cursive", "font", "vim" ]
categories: [ "Posts"  ]
summary: "Customizing font setting: Cursive in Cascadia Code"
draft: false
---
{{< lead >}}
*One of the font, Cascadia Code, catches my eyes.*
{{< /lead >}}

Today I've been reading an article: **An analysis of 5 monospaced fonts with coding ligatures** [^1].

[^1]: https://betterwebtype.com/5-monospaced-fonts-with-coding-ligatures/

It is interesting.
It compares 5 monospace fonts in term of: **Coding Ligatures, X-height, Legibility** and *extra features*.

One of the font, **Cascadia Code**, catches my eyes.
And I'm going to share some tips on applying the extra features at `Windows Terminal` and my favorite `Vim` editor.

## Cursive Style

Here's the quick recap and comparison.

| Font | Coding Ligatures | X-height | Legibility | Extra |
| :--- | :--------------- | :------- | :--------- | :---- |
| Fira Code | Widest range | Regular | High | / |
| Commit Mono | Basic range | Regular | High | Smart kerning |
| Cascadia | Wide range | Regular | High | **Cursive** style |
| Victor Mono | Wide range | Slightly larger | OK | / | 
| SF Mono | Widest range | Slightly smaller | Some concerns  | / | 
| Recursive | Basic range | Regular | Some concerns  | Variable cursive style | 

For more cursirve style settings, please refer to **Adding free Cursive (Italic) font to visual studio code** [^2] and **How to enable stylistic sets** [^3].

[^2]: https://dev.to/jalpeshvadgama/adding-free-cursiveitalic-font-to-visual-studio-code-fl1
[^3]: https://github.com/tonsky/FiraCode/wiki/How-to-enable-stylistic-sets

## Windows Terminal

In Microsoft Windows Terminal, **font features** are profile appearance settings for toggle specific features—such as programming ligatures, slashed zeros, or stylistic character sets.

We can configure these either through the graphical settings UI or directly in `settings.json` file.

**Method A:**

 1. Open Windows Terminal and press `ctrl + ,` to open **Settings**.

 1. Select a specific profile or choose **Defaults**.

 1. Go to the **Appearance** tab and expand the **Font** section.

 1. Scroll to **Font Features** to add or toggle OpenType tags (such as `ss01` or `calt`).

**Method B:**

 1. Open Settings and click **Open JSON file** (or press `ctrl + shift + ,`)

 1. Inside profile's `"font"` object, add a `"features"` dictionary mapping each 4-character OpenType tag to `1` (enabled) or `0` (disabled):

```json
"profiles": {
  "defaults": {
     "font": {
        "face": "Cascadia Code",
        "size": 12,
        "features": {
           "ss01": 1,  // Enables cursive italics in Cascadia Code
           "zero": 1,  // Enables slashed zero (if supported by the font)
           "calt": 0   // Disables contextual alternates / programming ligatures
        }
     }
  }
}
```

Below is the screenshot showing cursive within a Terminal login session.

![](/images/terminal_cursive.png "Windows Terminal")

### Common OpenType Features Tags


| Feature Tag |	Name | Common Effect in Terminal Fonts |
| :---------- | :--- | :------------------------------ |
| `calt` |	Contextual Alternates |	Controls most multi-character programming ligatures (e.g., `=>`, `!=`, `===`). Set to `0` to turn ligatures off. |
| `liga` |	Standard Ligatures | Controls standard character ligatures. Set to `0` alongside `calt` to ensure all ligatures are disabled. | 
| `zero` |	Slashed Zero | Replaces the standard `0` glyph with a slashed or dotted zero for better distinction from `O`. |
| `ss01` – `ss20` |	Stylistic Sets 1–20 | Activates alternate character designs. For example, in **Cascadia Code**, `ss01` turns standard italics into cursive script. |
| `cv01` – `cv99` |	Character Variants | Swaps individual characters (like a single-story `a` or `g`, or a tailed `l`) in fonts like **JetBrains Mono** or **Fira Code**. |


## VIM Editor

Here's the steps to customize `vim` to display all comments in *italics*.

 1. Add the highlight rule to `.vimrc`. Add the following line after `colorscheme` declaration.

```{title=".vimrc"}
highlight Comment cterm=italic gui=italic
```

Below is the screenshot showing cursive within a `vim` editor.

![](/images/vim_cursive.png "Vim editor")


## Links 

 - [An analysis of 5 monospaced fonts with coding ligatures](https://betterwebtype.com/5-monospaced-fonts-with-coding-ligatures/)
 - GitHub: [Cascadia Code](https://github.com/microsoft/cascadia-code)
 - Microsoft: Windows Terminal [Profile Appearance](https://learn.microsoft.com/en-us/windows/terminal/customize-settings/profile-appearance)

