---
title: "Understanding AsyncIO by Code"
date: 2024-05-14T06:35:27+08:00
tags: [ "101", "code", "async", "python" ]
categories: [ "Posts"  ]
series: [ "AsyncIO" ]
series_order: 1
summary: "Let's learn AsyncIO by code."
draft: false
---
{{< lead >}}
*Once you understand what is `coroutine` and `task`, you will understand `asyncio`.*
{{< /lead >}}

 
First thing first, `asyncio` cannot improve the execution speed.
It is more for handling those tasks that need some waiting (I/O), such as network connection.

Imagine `asyncio` like brain with an `event loop`.
And there is a list of tasks to be executed. 
The brain will pick the tasks from the list for execution.

> Note that, in Python `asyncio`, ***only one(1) task can be executed at any one time***. 

## Coroutine

There are 2 types of coroutine: **coroutine function** and **coroutine object**.

A function that start with `async def function()` is a **coroutine function**.
Anything that start with `async def` is called *coroutine function*.

A **coroutine object** is what returned from a *coroutine function*.

```python
# coroutine function and coroutine object in Python
async def coro_func():
    await asyncio.sleep(1)

coro_obj = coro_func()
```

## Executing Coroutine

In Python, we can't execute the coroutine directly.
To execute coroutine, we need to:

 1. Enter `async` mode (start the `event loop`).
 1. Convert `coroutine` into `task`.

Basically, we use `asyncio.run()` to switch from synchronous mode to *asynchronous mode*, to start the `event loop`.
Again, `asyncio.run()` will perform 2 things here:

 1. Start an `event.loop`.
 1. Then make the coroutine as the `first task` for `event loop` (brain).

Here is a simple but complete Python script to switch from synchronous to *asynchronous mode*.

```python
import asyncio

# first task for event loop
async def main():
    print(f'hello')
    await asyncio.sleep(2) # second task for event loop
    print(f'world')

coro_obj = main() # create coroutine object and start the coroutine/first_task
asyncio.run(coro_obj) # create event loop
```

> To execute multiple tasks, we need to build a list of coroutines.

Note that, an `event loop`:
 - Can execute tasks that converted from `coroutine`.
 - Cannot execute a `coroutine` directly.

## Multiple Tasks

After we switch to asynchronous mode, we need to create more tasks for the `event loop`. 
There is a model we can follow to build and create tasks.

Normally, we use `await` method to build a *simple* task.
And here is what happening:
 
 - The coroutine will be converted to a task, and inform `event loop` about the new task.
 - Inform `event loop` to complete the new task before the existing task can continue.
 - The existing task will `yield` (pause execution) and inform `event loop` to focus on other tasks.
 - Anyting return from the new task will be stored to a new variable before continue (resume) on existing task.

Here are 2 snippet of codes to run multiple tasks in ***synchronous mode***, where *3 seconds delay are completed within 2 seconds*.

```python
# Synchronous Mode 1
import asyncio
import time

async def go(delay, what):
    await asyncio.sleep(delay)
    return f'{what}({delay})'

async def main():
    """ first task for event loop """
    time1 = time.time()
    print(f'Start: {time.strftime("%X")}')

    task1 = asyncio.create_task(go(2, 'hello'))
    task2 = asyncio.create_task(go(1, 'world'))
    await task1
    await task2

    time2 = time.time()
    print(f'End: {time.strftime("%X")} ({time2-time1:.4f} sec)')

asyncio.run(main())

# Output below
# Start: 17:19:30
# End: 17:19:32 (2.0017 sec)
```

In `synchronous mode 1` example, we use `create_task()` to get a return `task` (instead of a `coroutine`).
Then we use `await` with the `task` to inform `event loop` about:

 - skip the process to convert `coroutine` to `task`. 
 - take over the control to complete the `task` for me.

```python
# Synchronous Mode 2
import asyncio
import time

async def go(delay, what):
    await asyncio.sleep(delay)
    return f'{what}({delay})'

async def main():
    time1 = time.time()
    print(time.strftime('%X'))

    ret = await asyncio.gather(
            go(2, 'hello'),
            go(1, 'world')
            )
    print(ret)

    time2 = time.time()
    print(f'{time.strftime("%X")} ({time2-time1:.4f} sec)')

asyncio.run(main())

# Output below
# 17:10:30
# ['hello(2)', 'world(1)']
# 17:10:32 (2.0018 sec)
```

Note that, `gather()` is not a `coroutine`. 
In `synchronous mode 2` example, `gather()` will return a `future`.
And we can use `await` with the `future` later.

Using this method, `await` will
 - skip the process to convert `coroutine` to `task`. 
 - take over the control to complete the `task` for me.

> To execute multiple tasks asynchronously, we can to build a list of coroutines and with `create_task()` and `gather()`.

## Conclusion

`AsyncIO` is suitable for handling those network connections issue, where ***waiting is required***.
We always call them ***IO-bound*** task.
This is because network connections (or IO-bound task) spend most time on **waiting** and very little on CPU computation.


