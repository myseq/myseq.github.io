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

A typical use of `generator expression` is, to use generator as iterators. 
For example, we can use `generator comprehension` to count the total lines a big CSV file.

```python
# Read a big CSV file
count = 0
filename = 'big_file.csv'
csv_gen = (row for row in open(filename))

for row in csv_gen:
    count += 1

print(f' Row count is : {count}')
```


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

In contrast, it is faster to create a `generator expression`, but it is faster to iterate a `list comprehension` because Python reserves memory for the whole list. 

## Usage

Use `list comprehension` when:

 - we need to iterate multiple times.
 - we need to use `list` built-in methods, like *len()* or *sum()*, or index or slice.

Use `generator expression` when:

 - we need to iterate only ***once***.
 - we need to iterate it ***in order***.
 - we need our code to be ***more memory efficiency***. (See in [PEP289](https://peps.python.org/pep-0289/))

## Advanced Generator Methods

In addition to `yield`, generator objects can make use of the following methods:

 - Use `.send()` to send data to generator.
 - Use `.throw()` to raise generator exception.
 - Use `.close()` to stop a generator's iteration.


Below is an example of generator using `yield`.

```python
def is_palindrome(n):
    # Check if the number is a palindrome
    return str(n) == str(n)[::-1]

def next_palindrome(start):
    # Start generating palindrome numbers from the next number
    num = start + 1
    while True:
        if is_palindrome(num):
            yield num
        num += 1

# Accept input from the user
n = int(input("Input a number: "))

# Create the palindrome generator
palindrome_gen = next_palindrome(n)

# Find and print the next palindrome number
next_palindrome_num = next(palindrome_gen)
print("Next palindrome number after", n, "is:", next_palindrome_num)
```

Below is an example of generator to list all the palindrome numbers (between 2 inputs).

```python
def is_palindrome(n):
    return str(n) == str(n)[::-1]

# Take 2 inputs: Start and End
n = int(input("Input a START number: "))
m = int(input("Input an END number: "))

# Create the range generator
range_gen = (x for x in range(n, m+1))

for r in range_gen:
    if is_palindrome(r):
        print(f'Palindrome: {r}')
```

## Links 

 - [Comprehension in Python](https://myseq.github.io/posts/python_comprehension/)
 - Introduction to [Python generator](https://realpython.com/introduction-to-python-generators/)

