---
title: "Learn AsyncIO by Practices"
date: 2024-05-21T01:35:27+08:00
tags: [ "async", "http", "python" ]
categories: [ "Essential", "Posts"  ]
series: [ "AsyncIO" ]
series_order: 3
summary: "Next, let's practice AsyncIO with different models."
draft: false
---
{{< lead >}}
*Simply using `async` keyword doesn't make your app work asynchronously.*

*Let's practice AsyncIO with different models, including `aiohttp` for concurrent network connections.*
{{< /lead >}}

In [understanding AsyncIO by examples](/posts/asyncio/examples/), we demonstrate 3 examples including `aiohttp` to perform concurrent HTTP connections. 

There are multiple ways to use `asyncio`, and here I share a few models of using them. 

 1. Async for-loop with asynchronous iterator
 1. Sequential async for-loop (*Yes, using async wrongly may end up same as normal synchronous sequential*)
 1. Async for-loop with asyncio.gather()
 1. Async for-loop with asyncio.wait()
 1. Async for-loop with asyncio.as_completed()
 1. Async for-loop with list comprehension
 1. Async for-loop with asyncio.TaskGroup()

## AsyncIO Models

The following code demonstrates 7 ways of using `Async` to do the same thing (sleep 4 diff times).

![Demo on 7 AsyncIO Models](/posts/asyncio/practices/7_AsyncIO_Models.png)

```python
# AsyncIO models
import asyncio
from timeit import default_timer as timer
from rich import print as rprint

class CustomIterator():
    def __init__(self):
        self.counter = 0

    def __aiter__(self):
        return self

    async def __anext__(self):
        if self.counter >= 4:
            raise StopAsyncIteration
        await asyncio.sleep(self.counter)
        rprint(f'[i][#808080]> task done with [ {self.counter = } ] [/#808080][/i]')
        self.counter += 1
        #return self.counter

# async task
async def work(t):
    await asyncio.sleep(t)
    rprint(f'[i][#808080]> task done with [ {t = } ] [/#808080][/i]')

# main coroutine
async def main():

    print(f'')

    s = timer()
    async for w in CustomIterator():
        ...
    e = timer()
    rprint(f'\nUse async for-loop with Asynchronous Iterator : [{e-s:.6f} sec]\n')

    s = timer()
    for data in range(4):
        await work(data)
    e = timer()
    rprint(f'\nSequential Asyncio For-Loop : [{e-s:.6f} sec]\n')

    s = timer()
    coros = [ work(t) for t in range(4) ]
    await asyncio.gather(*coros)
    e = timer()
    rprint(f'\nAsync for-loop with asyncio.gather() : [{e-s:.6f} sec]\n')

    s = timer()
    tasks = [ asyncio.create_task(work(t)) for t in range(4) ]
    _ = await asyncio.wait(tasks)
    e = timer()
    rprint(f'\nAsync for-loop with asyncio.wait() : [{e-s:.6f} sec]\n')

    s = timer()
    tasks = [ asyncio.create_task(work(t)) for t in range(4) ]
    for task in asyncio.as_completed(tasks):
        result = await task
    e = timer()
    rprint(f'\nAsync for-loop with asyncio.as_completed() : [{e-s:.6f} sec]\n')

    s = timer()
    tasks = [ asyncio.create_task(work(t)) for t in range(4) ]
    for task in tasks:
        result = await task
    e = timer()
    rprint(f'\nAsync for-loop with list comprehension of Tasks : [{e-s:.6f} sec]\n')

    s = timer()
    async with asyncio.TaskGroup() as group:
        _ = [ group.create_task(work(t)) for t in range(4) ]
    e = timer()
    rprint(f'\nAsync for-loop with asyncio.TaskGroup() : [{e-s:.6f} sec]\n')

asyncio.run(main())
```

## AsyncIO Practices

Here, I practices the same way to perform 6 HTTP connections asynchronously by leveraging each model above. 

![AsyncIO_Practices](/posts/asyncio/practices/AsyncIO_Practices.png)

```python
# AsyncIO Practices
import aiohttp
import asyncio
from timeit import default_timer as timer
from rich import print as rprint

class CustomIterator():
    def __init__(self):
        self.counter = 0

    def __aiter__(self):
        return self

    async def __anext__(self):
        if self.counter >= 4:
            raise StopAsyncIteration
        await asyncio.sleep(self.counter)
        rprint(f'[i][#808080]> task done with [ {self.counter = } ] [/#808080][/i]')
        self.counter += 1
        #return self.counter

# async task
async def work(t):
    await asyncio.sleep(t)
    rprint(f'[i][#808080]> task done with [ {t = } ] [/#808080][/i]')

async def fetch(client, url):
    async with client.get(url) as resp:
        await resp.text()

async def on_request_start(session, trace_config_ctx, params):
    trace_config_ctx.start = asyncio.get_event_loop().time()

async def on_request_end(session, trace_config_ctx, params):
    elapsed = asyncio.get_event_loop().time() - trace_config_ctx.start
    rprint(f'[i][#808080]> [{params.response.status}] Completed {params.url}[/#808080][/i] [ {elapsed:.5f} s ]')

# main coroutine
async def main(urls):

    print(f'')
    trace_config = aiohttp.TraceConfig()
    trace_config.on_request_start.append(on_request_start)
    trace_config.on_request_end.append(on_request_end)

    s = timer()
    async for w in CustomIterator():
        ...
    e = timer()
    rprint(f'\nUse async for-loop with Asynchronous Iterator : [{e-s:.6f} sec]\n')

    s = timer()
    async with aiohttp.ClientSession(trace_configs=[trace_config]) as client:
        for url in urls:
            await fetch(client,url)
    e = timer()
    rprint(f'\nSequential Asyncio For-Loop : [{e-s:.6f} sec]\n')

    s = timer()
    async with aiohttp.ClientSession(trace_configs=[trace_config]) as client:
        coros = [ fetch(client,url) for url in urls ]
        await asyncio.gather(*coros)
    e = timer()
    rprint(f'\nAsync for-loop with asyncio.gather() : [{e-s:.6f} sec]\n')

    s = timer()
    async with aiohttp.ClientSession(trace_configs=[trace_config]) as client:
        tasks = [ asyncio.create_task(fetch(client,url)) for url in urls ]
        _ = await asyncio.wait(tasks)
    e = timer()
    rprint(f'\nAsync for-loop with asyncio.wait() : [{e-s:.6f} sec]\n')

    s = timer()
    async with aiohttp.ClientSession(trace_configs=[trace_config]) as client:
        tasks = [ asyncio.create_task(fetch(client,url)) for url in urls ]
        #for task in asyncio.as_completed(tasks):
        #    result = await task
        results = [ await task for task in asyncio.as_completed(tasks) ]
    e = timer()
    rprint(f'\nAsync for-loop with asyncio.as_completed() : [{e-s:.6f} sec]\n')

    s = timer()
    async with aiohttp.ClientSession(trace_configs=[trace_config]) as client:
        tasks = [ asyncio.create_task(fetch(client,url)) for url in urls ]
        for task in tasks:
            result = await task
    e = timer()
    rprint(f'\nAsync for-loop with list comprehension of Tasks : [{e-s:.6f} sec]\n')


    s = timer()
    async with aiohttp.ClientSession(trace_configs=[trace_config]) as client:
        async with asyncio.TaskGroup() as group:
            _ = [ group.create_task(fetch(client, url)) for url in urls ]
    e = timer()
    rprint(f'\nAsync for-loop with asyncio.TaskGroup() : [{e-s:.6f} sec]\n')


if __name__ == "__main__":
    urls = [
        'https://myseq.github.io/',
        'https://securityheaders.com/',
        'https://hstspreload.org/',
        'https://www.isc2.org/',
        'https://www.sans.org/',
        'https://scotthelme.co.uk/'
    ]

    asyncio.run(main(urls))
```


