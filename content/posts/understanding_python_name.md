---
title: "Why __name__ == '__main__'?"
date: 2023-12-14T22:17:49+08:00
tags: [ "101", "python" ]
categories: [ "Posts", "Essential"  ]
summary: "Wonder why we always start with `if __name__ == '__main__':` in Python? "
draft: false
---
{{< lead >}}
There is a situation why we need to start our Python script with `if __name__ == '__main__':`.
{{< /lead >}}

So, what does `if __name__ == '__main__':` mean?

## Why it Matters?

It is a way to ensure that a specific block of code runs only when the Python script is executed directly, and not when it's imported as a module.

## What is `__name__`? 

The `__name__` is a built in variable in Python. It represents the current module's name. 

When we run a Python script, Python will assign `__main__` to the `__name__` variable if the script is the main program being executed.

## Example 

Here, we have a Python script `display_name.py` with a define function called `display` to output the parameter `name`.

```python
# display_name.py
def display(name):
  print(f'Hello, {name}')

if __name__ == '__main__':
  user_name = input('Enter name: ')
  display(user_name)
```

In this script (above), the following block will execute only if we run the script directly. 

```python
if __name__ == '__main__':
  user_name = input('Enter name: ')
  display(user_name)
```

> This has been enforced by `if __name__ == '__main__':`.

> What if we have another script, which we need to ***reuse*** the function `display` but we do not want to execute the block of code above?

Here is another Python script which like to ***reuse*** the `display` function.

```python
# another_script.py
from display_name import display
name = 'Foo'
display(name)
```

It is all about making our code reusable. 
With `if __name__ == '__main__':`, it allows us to create Python script that can be imported as module, and reuse the function within.

> When the first script `display_name.py` is imported as a module, the code inside the `if __name__ == '__main__':` will not be executed.

## Summary

 With `if __name__ == '__main__':`:

  - It is handy way to reuse function within a large Python project.
  - It allows reuse of functions and classes from one script into another without running the whole script every time.
  - It helps keeping things clean and organized.
  - It helps creating versatile Python module.

