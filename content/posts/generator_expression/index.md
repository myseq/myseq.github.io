---
title: "Generator Expression in Python"
date: 2024-04-16T12:01:00+08:00
tags: [ "101", "python" ]
categories: [ "Posts"  ]
summary: "Python: List comprehension vs Generator expression."
draft: true
---
{{< lead >}}
*In general, `list comprehension` is faster while `generator` is more memory efficient*.
{{< /lead >}}

## List Comprehension

List Comprehension allows us to create a list using `for loop` with a single line. 
This makes it an elegant way of defining and creating a list.

See [Comprehension in Python](https://myseq.github.io/posts/python_comprehension/) for more examples.

## Generator Expression

Generator Expression is similar to list comprehension, with the only difference is, it never construct the list object. 

Instead of creating a list (and keeping it in the memory), the generator simply generates the next element in demand.

> In normal situation, a function terminates whenever it gets a `return` statement.
> But, a function with a `yield` statement is called, it saves the state of the function and can be picked up from the same state, next time the function is called.

> And the Generator Expression allows us to create a generator without the `yield` keyword.

## The Difference

For generator expression, **parenthesis are used in place of square brackets**.

```python
# List comprehension
list_comp = [x*2 for x in range(256)]

# Generator expression
gene_expr = (x*2 for x in range(256))
```

Iterating over the `generator expression` or the `list comprehension` will do the same thing. 

However, the `list comprehension` will create the entire list in **memory** first while the `generator expression` will create the items on the fly. 
And we use `generator expression` for very large (and also infinite!) sequences.

## Usage

Use `list comprehension` when:

 - we need to iterate multiple times.
 - we need to use `list` built-in methods.

Use `generator expression` when:

 - we need to iterate only ***once***.
 - we need our code to be ***more memory efficiency***. (See in [PEP289](https://peps.python.org/pep-0289/))

## Links 

 - [Comprehension in Python](https://myseq.github.io/posts/python_comprehension/)

