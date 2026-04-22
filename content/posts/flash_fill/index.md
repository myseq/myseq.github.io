---
title: "CTRL+e in Excel"
date: 2024-06-01T09:24:30+08:00
tags: [ "excel", "tips" ]
categories: [ "Posts"  ]
summary: "Don't use formulas in Excel! Use ctrl+e instead."
draft: false
---
{{< lead >}}
*I've been working with Excel for more than 20 years, and I didn't know this until today.*
{{< /lead >}}

`ctrl + e` is a powerful keyboard shortcut that activates **Flash Fill**.
This is a tool that can significantly speed up data entry and manipulate in Excel.

## Flash Fill

> Flash fill is only available in Excel 2013 and later.

Using **Flash Fill**, it automatic fills data when it senses a pattern.

Here's the step:

 1. Open the Excel file.
 1. Manually put in the desired pattern at the first row (column Email).
 1. Goto second row (column Email), press `ctrl+e`, and see the magic happen.

| First_Name | Last_Name | Email | 
| :--------- | :-------- | :-------- |
| John | Smith | john_smith@example.org | 
| Mary | Lee | <ctrl+e> |
| ffff | nnnnn | ... |

> If **Flash Fill** doesn't generate the preview, it might not be turned on. 
> You can go to ***Data > Flash Fill*** to run it manually, or press `ctrl+e`. 
> To turn **Flash Fill** on, go to ***Tools*** > ***Options*** > ***Advanced*** > ***Editing Options*** > check the ***Automatically Flash Fill*** box.

## Links

 - [Using Flash Fill in Excel](https://support.microsoft.com/en-us/office/using-flash-fill-in-excel-3f9bcf1e-db93-4890-94a0-1578341f73f7).
