---
title: "Python Ternary Operation"
date: 2024-04-23T17:51:57+08:00
tags: [ "oneliner", "python" ]
categories: [ "Posts"  ]
summary: "Ternary operations in Python."
draft: false
---
{{< lead >}}
Use `ternary operation` as another [oneliner](/tags/oneliner/).
{{< /lead >}}

## Simple Ternary Operation

Many may not know that Python does support `ternary operation`.
Let's see the function below.

```python
def func(x):
    if x >= 0:
        return x
    else:
        return -x
```

We can simplify the function above with `ternary operation`, as below:

```python
def func(x):
    return ( x if x >= 0 else -x )
```

## Ternary Operator

The ternary operator in Python is simply a shorter way of writing an if and if…else statement.

Here's the syntax:

> ***Syntax***: *[on_true] if [expression] else [on_false]*

## Ternary Usages

Below are the examples to use Ternary Operator in Python `if-else`.

```python
# Similar to abs() 
x = 1 
y = x if x >= 0 else -x
```

```python
# Print whichever is smaller 
a, b = 10, 20
min = a if a < b else b
print(min)
```

```python
# Advanced nested ternary operator
a, b = 10, 20
print ("Both a and b are equal" if a == b else "a is greater than b"
		if a > b else "b is greater than a")
# output: b is greater than a
```

### Ternary with Tuples

***Explanation***: In this example, we use a `tuple` for selecting an item. 
And if `[x >= 0]` is `True`, it will return `1`. Otherwise it will return `0` as `False`.
Basically, the condition `[x>=0]` has become the **index** for the `tuple`.

```python
# Similar to abs() 
x = 1
y = (-x, x)[x >= 0]
# y is 1
```

```python
# Print whichever is smaller
a, b = 10, 20
print((b, a)[a < b])
# output: 10
```

> Some argue that this isn't a proper ternary operator.
> See [extra notes](#extra-notes) on why this method is less efficient and not recommended.

### Ternary with Dictionary

Similar to `ternary with tuple()`.

```python
# Get the smaller value
a, b = 10, 20
print({True: a, False: b} [a < b])
# output: 10
```

### Ternary with Lambda

Similar to `ternary with tuple()`.

```python
# Get the smaller value
a, b = 10, 20
print((lambda: b, lambda: a)[a < b]())
# output: 10
```

### Ternary with Print-if

```python
# Get the greater value
a=5
b=7
# [statement_on_True] if [condition] else [statement_on_false]
print(a,"is greater") if (a>b) else print(b,"is Greater")
# output: 7 is Greater
```

## Extra Notes

OK. 
The extra notes here is about the argument on the usage of `ternary with tuple()` method.

Let's dive into the situation below where we need to get the average (mean) value from a list of numbers.

At first, we have a function `getAverage()` as below.

```python
def getAverage(nlist):
    return sum(nlist) / len(nlist)
```

But, what if there is an empty list been passed to the function?
So, here is the enhanced version.

```python
def getAverage(nlist):
    return sum(nlist) / len(nlist) if nlist else 0
```

Now, let's try to apply ternary operator with `tuple()` like how we did above.

```python
def getAverage(nlist):
    return (0, sum(nlist)/len(nlist))[len(nlist) >= 0]
```

Now, problem starts to arise. 
Because Python will create the `tuple()` without evaluate the **condition** (*in this case [len(nlist)>=0]*) first.
This will cause `ZeroDivisionError` when an empty list is passed to the function. 

From the efficiency perspective, this method is less efficient than `if-else` method.
This method has to first create the tuple, including the `sum(nlist)/len(nlist)`, then follow by evaluating the condition or subscribe.
And this method relies on the conversion from `True`/`False` to index for a `tuple()`.


