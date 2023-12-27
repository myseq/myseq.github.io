---
title: "Python Package"
date: 2023-12-26T09:55:00+08:00
tags: [ "101", "python" ]
categories: [ "Posts", "Essential" ]
summary: "Fundamental building block for Python package."
draft: false
---
{{< lead >}}
Let's dive into a Python fundamental concept called `__init__.py`.
{{< /lead >}}

## Fundamental Concept

Using `__init__.py`, allows you to organiza your code into modular chunks, making it easier to manage and reuse.

This is like a blueprint for your package, where you can define common functions, variables or even import other modules.

## How It Works

Creating `my_package`:

```
$ mkdir my_package
$ cd my_package
$ touch __init__.py
$ touch testing.py
```

Creating the function:

```python
# testing.py
def greeting():
  print(f'Hello World')
```

Now, let's import the package.

```
$ cd ..
$ touch main_test.py
```

```python
# main_test.py
from my_package import testing
testing.greeting()
```

> *Should get the output 'Hello World'.*

This shows that the `__init__.py` makes the `testing` module accessible from within the `my_package` namespace.

## Conclusion

`__init__.py` is a fundamental building block for creating structured and organized Python packages.

It helps to manage, organize and maintain your Python package code in much easier format. By providing a foundation for structured code, it facilitates the resue of components within the package.

It can enhances the clarity of the package structure, and mkeing it easier to share with others.

We can combine `__init__.py` and `__main__.py`, to allow us execute Python package as project (like `python my_package`). See the Python Project post.

{{< article link="/posts/python_project/" >}}

## Links

 - [Python Project](https://myseq.github.io/posts/python_project/) [MySeq]


