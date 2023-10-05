+++
title = "Python-httpx Vs Python-requests"
date = 2022-12-11T22:43:48+08:00
author = "zd"
tags = [ "async", "python" ]
categories = [ "Blogger" ]
summary = "Quick comparison between httpx and requests."
draft = false
+++

```python
#!/usr/bin/evn python3
# -*- coding: utf-8 -*-

import asyncio
import httpx
import requests
```

## Requests vs HTTPX

In general, both the module are similar, Here, I just make a simple comparison on what are the differences between Python HTTPX and Requests module.

|     | Requests  | HTTPX  |
| --- | --------- | ------ |
| Sessions       | requests.Session()  | httpx.Client()  |
| Async support  | not supported  | httpx.AsyncClient()  |
| HTTP/2 support | not supported  | httpx.Client(http2=True) <br/> httpx.AsyncClient(http2=True) |

## Links
 * [Python HTTPX](https://www.python-httpx.org/)
 * [Python Requests](https://requests.readthedocs.io/en/latest/)
 * [Introduction to HTTP/2](https://web.dev/performance-http2/)

