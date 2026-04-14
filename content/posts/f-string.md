+++
title =  "Use of f-string format() in Python"
date = 2023-08-02T10:59:26+08:00
author = "zd"
tags = [ "101", "python" ]
categories = [ "Posts" ]
summary = "Using f-string in Python."
draft = false
+++

Python 3.6 introduced, formatted string literals, often referred to as **f-strings** as another method to help format strings. It is simpler to prepend an `f` to the string then append `.format()`.

## Format String (f-string)

These are the basic f-string formatting that I use commonly in Python scripting. 

```bash

## Basic:  Formatting/Value/Output
## https://github.com/myseq/notes/blob/main/Python/f-string.md

  Formatting          |  Value        |  Output
================================================
  {num:0>2d}          |  5            |  num = 05
  {num:,}             |  5000000      |  num = 5,000,000
  {num:.2e}           |  5000000      |  num = 5.00e+06

  ("%.2f" % pi)       |  3.141592654  |  pi = 3.14
  "{:.2f}".format(pi) |  3.141592654  |  pi = 3.14
  {:.2f}              |  3.141592654  |  pi = 3.14
  {:+.2f}             |  3.141592654  |  pi = +3.14
  {:.0f}              |  3.141592654  |  pi = 3

  {num:.2%}           |  0.25         |  num = 25.00%
  {num:>10}           |  0.25         |  num =       0.25
  {num:<10}           |  0.25         |  num = 0.25
  {num:^10}           |  0.25         |  num =    0.25
  {num:0>9}           |  0.25         |  num = 000000.25

  '{0} >= {1}'.format('A','B')        |  A >= B
  '{1} <= {0}'.format('A','B')        |  B <= A

  '%s loves %s'% ('cats','dogs')      |  cats loves dogs
  '{} hates {}'.format('cats','dogs') |  cats hates dogs

  {now:%Y-%m-%d %H:%M}                |  now()    = 2023-07-21 17:20
  {today:%Y-%m-%d %H:%M}              |  today()  = 2023-07-21 17:20
  {utcnow:%Y-%m-%d %H:%M}             |  utcnow() = 2023-07-21 09:20

  email_f = "Your email address is {email}".format
  email_address = "_user@example.com_"
  "Your email address is _user@example.com_"

```

## Debugging

To print the variable name togather with the result.

```python
var = 'text'

print(f'{var =}')
```

## Links
 - [Python f-string formatting cheat sheet](https://cheatography.com/brianallan/cheat-sheets/python-f-strings-number-formatting/)
 - [source code](https://github.com/myseq/notes/blob/main/Python/f-string.md)


