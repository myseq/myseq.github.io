---
title: "More Python Comprehensions"
date: 2024-04-01T19:37:40+08:00
tags: [ "oneliner", "python" ]
categories: [ "Posts"  ]
summary: "More Python comprehension examples."
draft: false
---
{{< lead >}}
*Python comprehension == ***one_liner***.*
{{< /lead >}}

## Basic L1

```python
values = []
for x in range(1,11):
    values.append(x)
```


The block of code above can be simplified as:  
  `values = [ x for x in range(1,11) ]`

```python
evens = []
for n in range(1,11):
    is_even = n % 2 == 0
    if is_even:
        evens.append(number)
```


The block of code above can be simplified as:  
  `evens = [ n for n in range(1,11) if n % 2 == 0 ]`


## Level 2

```python
names = [ 'jane', 'jenny', 'jim', 'jimmy', 'jimny', 'jone', 'june' ]
valid = []

for name in names:
    if len(name) <= 1:
        continue

    if name[0] != 'j':
        continue

    if name[-1] != 'j':
        continue

    valid.append(name)
```


The block of code above can be simplified as:  
  `valid = [ name for name in names if len(name) >= 2 if name[0] =='j' if name[-1] == 'y' ]`


```python
matrix = [['a','b','c'],['d','e','f'],['g','h','i']]
flat = []

for y in matrix:
    for x in y:
        flat.append(x)
```


The block of code above can be simplified as:  
  `flat = [ x for y in matrix for x in y ]`

```python
types = []

for n in range(2,12):
    if n % 2 ==0:
        types.append('E')
    else:
        types.append('O')
```


The block of code above can be simplified as:  
  `types = [ "E" if n % 2 == 0 else "O" for n in range(2,12) ]`


## 3D-Matrix

```python
>>> mm = []
>>>
>>> for a in range(5):
...     m1 = []
...     for b in range(4):
...         m2 = []
...         for c in range(3):
...             m2.append(c)
...         m1.append(m2)
...     mm.append(m1)
...
>>> mm
[
    [[0, 1, 2], [0, 1, 2], [0, 1, 2], [0, 1, 2]],
    [[0, 1, 2], [0, 1, 2], [0, 1, 2], [0, 1, 2]],
    [[0, 1, 2], [0, 1, 2], [0, 1, 2], [0, 1, 2]],
    [[0, 1, 2], [0, 1, 2], [0, 1, 2], [0, 1, 2]],
    [[0, 1, 2], [0, 1, 2], [0, 1, 2], [0, 1, 2]]
]
```

The block of code above can be simplified as:  
  `mmm = [[[x for x in range(3)] for _ in range(4)] for _ in range(5) ]`

## Function

```python
def square(x):
    return x**2

square_num = []
for x in range(1,11):
    square_num.append(square(x))
```


The block of code above can be simplified as:  
  `square_num = [ square(x) for x in range(1,11) ]`

## Dictionary

```python
pairs = [ ('a', 1), ('b', 2), ('c', 3) ]

my_dict = { k:v*2 for k,v in pairs }
```

## Set

Python `set()` uses the same `{}` as `dict()` as long as there is no key.

Below here is a typical example where many will use it to remove duplicate values in a `list()`.

```python
nums = [1,1,2,2,2,3,4,4,5,6,6]

uniqsqs = { x**2 for x in nums }
```

## Generator

```python
sum_of_sqs = sum(x**2 for x in range(1_000_000))
```

The above code block will generate a sum of all the squares from the number 0 to 1 millioni, and just give me the end result (without storing all the different values). 

This means it is ***different*** than `sum([x**2 for x in range(1_000_000)])`. This will generate a list of 1 million values before sum them up.

Using a generator, it is more efficient in term of memory. 

## Summary

Thanks to Tim with the excellent tutorial on [10 Python Comprehensions](https://www.youtube.com/watch?v=twxE0dEp3qQ).

I've modified some codes to suit my own study. Below are the quick summary.

```python
# Basic L1
values = [ x for x in range(1,11) ]

evens = [ n for n in range(1,11) if n % 2 == 0 ]

# Level L2
names = [ 'jane', 'jenny', 'jim', 'jimmy', 'jimny', 'jone', 'june' ]
valid = [ name for name in names if len(name) >= 2 if name[0] =='j' if name[-1] == 'y' ]

matrix = [['a','b','c'],['d','e','f'],['g','h','i']]
flat = [ x for y in matrix for x in y ]

types = [ "E" if n % 2 == 0 else "O" for n in range(2,12) ]

# 3D-Matrix
mmm = [[[x for x in range(3)] for _ in range(4)] for _ in range(5) ]

# Function
square_num = [ square(x) for x in range(1,11) ]

# Dictionary
pairs = [ ('a', 1), ('b', 2), ('c', 3) ]
my_dict = { k:v*2 for k,v in pairs }

# Set
nums = [1,1,2,2,2,3,4,4,5,6,6]
uniqsqs = { x**2 for x in nums }

# Generator
sum_of_sqs = sum(x**2 for x in range(1_000_000))

```

## Links

 - MySeq: [Comprehension in Python](ihttps://myseq.github.io/posts/python_comprehension/)

