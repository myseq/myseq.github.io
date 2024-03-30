---
title: "Comprehension in Python"
date: 2024-02-16T12:12:26+08:00
tags: [ "101", "oneliner", "python" ]
categories: [ "Posts"  ]
summary: "List and Dict comprehension in Python."
draft: false
---
{{< lead >}}
Comprehension is a concise and powerful way to create lists or dictionaries in Python. 

*In short, it helps to combine multiple lines of code into one.*
{{< /lead >}}

## List Comprehension

It allows to create new list by applying an expression to each item in an existing iterable, such as list, tuple, or range and optionally filtering the items based on a condition.

```python
# Traditional approach
squares = []
for num in range (1,11):
    squares.append(num*num)
```

With **list comprehension**, we can achieve the same result in just one line of code below.

```python
# List Comprehension
squares = [ num*num for num in range(1,11) ]
```

List comprehsnsion contains 3 main componenets.

> [ *expression* **for item in iterable** ***if condition*** ]

Expression
: This is the operation to preform on each item in the iterable.
: It could be anything from simple arithmetric operation to a function call.

Iterable
: This is the collection of items over to iterate.
: It can be a list, tuple, range or any other iterable object.

Condition
: This is for filtering the items in the iterable based on a certain condition.
: Optional.

### Examples

```python
# Creating a list of squares of even numbers from 1 to 10
squares_evens = [ num**2 for num in range(1,11) if num%2 == 0 ] 
```

```python
#  Replaces by 'even' or 'odd'
results = [ 'even' if num%2 == 0 else 'odd' for num in range(1,11) ]
```

## Dictionary Comprehension

Like [list comprehension](#list-comprehension), Python allows dictionary comprehensions. 
We can create dictionaries using simple expressions.
A dictionary comprehension takes the form:

> { key: value for (key,value) in iterable }

```python
# Create dict using list comprehension
myDict = { x: x**2 for x in [1,2,3,4,5] }

# output: {1: 1, 2: 4, 3: 9, 4: 16, 5: 25}
```

### Examples

```python
# Create a dict with if condition statement
newdict = {x: x**3 for x in range(10) if x**3 % 4 == 0}

# output: {0: 0, 2: 8, 4: 64, 6: 216, 8: 512}
```


```python
# Create a nested dictionary
s = "ABA"
d = { x: {y: x + y for y in s } for x in s }

# output: {'A': {'A': 'AA', 'B': 'AB'}, 'B': {'A': 'BA', 'B': 'BB'}}
```


