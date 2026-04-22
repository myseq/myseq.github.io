---
title: "Understanding AsyncIO by Examples"
date: 2024-05-19T09:35:27+08:00
tags: [ "async", "http", "python" ]
categories: [ "Posts"  ]
series: [ "AsyncIO" ]
series_order: 2
summary: "Now, let's learn AsyncIO by examples."
draft: false
---
{{< lead >}}
*Learn AsyncIO by example, including `aiothttp` for concurrent network connections.*
{{< /lead >}}

In [learning AsyncIO by code](/posts/asyncio/learn_by_code/), we explain how to use `async`/`await` in `asyncio`.

Here, we will learn `AsyncIO` by 3 examples, from basic to more practical use (`aiohttp`).

## Example_1

In this example, task1 and task2 start almost the same time.
And you will see task1 completes after 2 sec, and task 2 completes after 5 sec.

```python
# Example 1 - Demo asyncio with 2 tasks.
import asyncio

async def fetch_data():
    print('# [t1] start fetching....')
    await asyncio.sleep(2)
    print('# [t1] done fetching.')
    return {'data': 1}

async def print_numbers():
    for i in range(10):
        print(f'# [t2] {i}')
        await asyncio.sleep(0.5)

async def main():
    task1 = asyncio.create_task(fetch_data())
    task2 = asyncio.create_task(print_numbers())

    value = await task1
    print(f'# [t1] {value}')
    await task2

asyncio.run(main())

# Output
# [t1] start fetching....
# [t2] 0
# [t2] 1
# [t2] 2
# [t2] 3
# [t1] done fetching.
# [t1] {'data': 1}
# [t2] 4
# [t2] 5
# [t2] 6
# [t2] 7
# [t2] 8
# [t2] 9
```

## Example_2

In this example, it demos the completion of 3 tasks.
Each task will calculate and find the highest prime number.
And we start the first task by 100000 and follow by 10000 and 1000.

```python
# Example 2 - Demo asyncio with 3 tasks.
import time
import asyncio

def is_prime(x):
    return not any(x//i == x/i for i in range(x-1, 1, -1))

async def highest_prime_below(x):
    print(f'Highest prime below {x}')
    for y in range(x-1, 0, -1):
        if is_prime(y):
            print(f'--> Highest prime below {x} is {y}.')
            return y
        await asyncio.sleep(0.01)
    return None

async def main():
    p = [100000, 10000, 1000]
    tasks = []
    t0 = time.time()

    for x in p:
        task = asyncio.create_task(highest_prime_below(x))
        tasks.append(task)

    await asyncio.gather(*tasks)

    t1 = time.time()
    print(f'Took {1000*(t1-t0):.2f} ms')

loop = asyncio.get_event_loop()
loop.run_until_complete(main())
#loop.close()

# Output
# Highest prime below 100000
# Highest prime below 10000
# Highest prime below 1000
# --> Highest prime below 1000 is 997.
# --> Highest prime below 100000 is 99991.
# --> Highest prime below 10000 is 9973.
# Took 311.18 ms
```

## Example_3 (aiohttp)

In this example, it demos the completion of 5 network connections (tasks). 
It will trace the elapsed time taken for individual URL. 
Some tasks complete faster and some are slower.

```python
# Example 3 - Demo asyncio with 5 tasks [network connections] .
import aiohttp
import asyncio
from datetime import datetime

async def fetch_with(client, url):
    async with client.get(url) as resp:
        await resp.text()
        return f'# [{datetime.now():%X}] - {url} [{resp.status}]'

async def fetch_all(client, urls):
    tasks = []
    for url in urls:
        task = asyncio.create_task(fetch_with(client,url))
        print(f'# [{datetime.now():%X}] : Added [{url}] into tasklist.')
        tasks.append(task)

    print(f'')
    results = await asyncio.gather(*tasks)
    return results

async def on_request_start(session, trace_config_ctx, params):
    trace_config_ctx.start = asyncio.get_event_loop().time()

async def on_request_end(session, trace_config_ctx, params):
    elapsed = asyncio.get_event_loop().time() - trace_config_ctx.start
    print(f'# [{elapsed:.5f}s] : {params.url}')

async def main(urls):
    trace_config = aiohttp.TraceConfig()
    trace_config.on_request_start.append(on_request_start)
    trace_config.on_request_end.append(on_request_end)
    async with aiohttp.ClientSession(trace_configs=[trace_config]) as client:
        data = await fetch_all(client, urls)
        return data

if __name__ == "__main__":
    urls = [
        'https://securityheaders.com/',
        'https://hstspreload.org/',
        'https://www.isc2.org/',
        'https://www.sans.org/',
        'https://scotthelme.co.uk/'
    ]

    results = asyncio.run(main(urls))
    print(f'')
    for r in results:
        print(r)

# Output
# [21:38:50] : Added [https://securityheaders.com/] into tasklist.
# [21:38:50] : Added [https://hstspreload.org/] into tasklist.
# [21:38:50] : Added [https://www.isc2.org/] into tasklist.
# [21:38:50] : Added [https://www.sans.org/] into tasklist.
# [21:38:50] : Added [https://scotthelme.co.uk/] into tasklist.

# [0.12875s] : https://scotthelme.co.uk/
# [0.93167s] : https://hstspreload.org/
# [1.08564s] : https://www.isc2.org/
# [1.39669s] : https://securityheaders.com/
# [2.20264s] : https://www.sans.org/apac/

# [21:38:51] - https://securityheaders.com/ [200]
# [21:38:50] - https://hstspreload.org/ [200]
# [21:38:51] - https://www.isc2.org/ [200]
# [21:38:53] - https://www.sans.org/ [200]
# [21:38:50] - https://scotthelme.co.uk/ [200]
```


