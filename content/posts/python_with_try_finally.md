---
title: "Python with Context Manager"
date: 2024-03-15T06:43:02+08:00
tags: [ "101", "python" ]
categories: [ "Posts", "YT", "Essential"  ]
summary: "Using Context Manager as an essential coding practice in Python."
draft: false
---
{{< lead >}}
*Always prefer `with` over `try-finally`.*
{{< /lead >}}

An essential practices on cleaning up your code using Context Manager in Python. 

Using a context manager, `with`, and let the object handle its own cleanup, is an essential coding practices in Python.

## Why Context Manager?

There are 4 common use cases where we need to manage the cleanup of codes to free up system resources. 
The worst case of not doing so will lead to memory leaks, slowing down the entire system or even crash.

 1. Open a file for writing.
 2. Open a socket for connection.
 3. Open a temporary files.
 4. Open a lock.

To make things more complex, an exception could be raised during the 4 use cases above. 
Using a Context Manager can make Python to ensure all the cleanup will happen *automagically*.

```python
def main():
    with open('test1.txt') as fp1, open('test2.txt', 'w') as fp2:
        fp2.write(fp1.read())
```

## YouTube Tutorial

In this video, [mCoding](https://www.youtube.com/@mCoding) has demonstrated on using `with` as context manager.
He also compare it with the use of `try-finally` method to ensure code cleanup.

{{< youtube id="LBJlGwJ899Y" title="mCoding: The ins and outs of content managers" >}}

