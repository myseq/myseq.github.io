---
title: "Fetching with Retries" 
date: 2024-09-09T18:35:27+08:00
tags: [ "async", "http", "python" ]
categories: [ "Posts"  ]
series: [ "AsyncIO" ]
series_order: 7
summary: "A practical example to fetch multiple pages with retries (using recursive)."
draft: false
---
{{< lead >}}
*Here's a practical example to show how to fetch multiple pages of JSON from an API.*

*It can retries if there is HTTP request (network) error or hitting rate limitation.*
{{< /lead >}}

## Pseudo Code

The code snippets here combine the following:

 - Fetches pages **asynchronously** with `asyncio`.
 - Uses HTTP/2 instead of HTTP/1.1 with `httpx` module.
 - Uses HTTP connection pooling (with `client()`) for better efficiency in using of network resources. It will **reuse the underlying TCP connection** instead of recreating one for every request.
 - Uses `semaphore` to limit the **conncurrent connections** at a time.
 - Retries the fetching (via recursive call) if there is **network error** (HTTPRequestError).
 - Delay and retries the fetching (via recursive call) if there is **rate limit error** (HTTPStatusError 429).
 - Track the **progress and %** of successful fetched pages.
 - Once completed, it will check status code (in the HTTP response) to ensure all pages are return correctly (**HTTP 200**). 


## Code Snippets

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from rich import print as rprint
import httpx
import asyncio

http200 = 0
retries = 0
pages = 0

def try_again(headers):
    try:
        return int(headers.get('Retry-After',0))
    except ValueError:
        return None

async def fetching(client,url,sem):
    global http200
    global retries
    global pages
    backoff = 0.2
    total = pages

    try:
        async with sem:
            resp = await client.get(url)
            resp.raise_for_status()

    except httpx.RequestError:
        await asyncio.sleep(backoff)
        return await fetching(client,url,sem) # Return the result of the retry

    except httpx.HTTPStatusError as err:
        if err.response.status_code == 429:
            retry_after = try_again(err.response.headers)
            if retry_after:
                rprint(f' [-] Rate limit reached for {url}. Waiting {retry_after} before retry...')
                await asyncio.sleep(retry_after + backoff)
            else:
                rprint(f' [-] Waiting {backoff} before retry...')
                await asyncio.sleep(backoff)
            retries += 1
            backoff *= 2
            return await fetching(client,url,sem) # Return the result of the retry
        else:
            rprint(f' [!] [{resp.status_code}] {url}')

    else:
        if resp and resp.status_code == 200:
            http200 += 1
            rprint(f' [[green]{resp.status_code}[/green]]  [ [magenta]{http200}/{total}[/magenta] ({http200/total*100:.2f}%) ]')
            return resp


async def main(links):
    limit = 5
    sem = asyncio.Semaphore(limit)
    hdrs = { 'accept': 'application/json', 'content-type': 'application/json' }

    async with httpx.AsyncClient(headers=hdrs, http2=True) as client:
        tasks = [ fetching(client,link,sem) for link in links ]
        responses = await asyncio.gather(*tasks)

    print(f'')
    fail = 1 if any(r is None or r.status_code != 200 for r in responses) else 0

    if not fail:
        print(f'All [{len(responses)} responses] are OK.')
        print(responses)
    else:
        print(f'Errors: Not all {responses} are OK.')



links = [] # A list that contains long list of URL to be fetched.
asyncio.run(main(links))

```

