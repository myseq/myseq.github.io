---
title: "Chained Comparison"
date: 2023-07-12T15:27:47+08:00
tags: [ "101", "python" ]
categories: [ "Posts"  ]
summary: "Chained comparison in Python."
draft: false
---
{{< lead >}}
*Just leant that Python does support chained comparison.*
{{< /lead >}}

In Python, using chained comparison operators is a way to simplify multiple comparison and thus more efficient.

## Comparisons

```python
# comparison operators
comparisons = [ 
    '<', '>', '<=', '>=', '==', '!=',
    'is', 'is not', 'in', 'not in' 
    ]
```

## Chained_Comparison

I didn't know that Python does support chained comparison until today.

I used to do this in the past:

```python 
def main():
    x, y, z = 0, 1, 2
    if x < y and y < z:
        print(True)
    else:
        print(False)
```

By using chained comparison, I can simply do this way:

```python 
def main():
    x, y, z = 0, 1, 2

    if x < y < z:
        print(True)
    else:
        print(False)
```

The difference between the two methods above is, the `y` is evaluated only once (in method 2).

