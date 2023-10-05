+++
title =  "HTTP Versioning"
date = 2023-03-21T16:34:50+08:00
author = "zd"
tags = [ "async", "cli", "http", "python", "tools" ]
categories = [ "Posts" ]
summary = "HTTP/1 vs HTTP/1.1 vs HTTP/2 vs HTTP/3"
draft = false
+++


How many HTTP versions have you come across before?

## History

`HTTP/1.0` has been created since 1996~97 and we move to `HTTP/1.1` (since 1999) and using it for most of the time. And then HTTP working group has introduced `HTTP/2.0` (aka spdy) in 2015, and now `HTTP/3` (aka QUIC) in 2022.


### About HTTP/1.x
`HTTP/1.x` released since 1996, and it is a stateless protocol. The release of `HTTP/1.1` is to introduce the following features (lack in `HTTP/1.0`):
 - ***Keep-alive*** mechanism which reuse the same TCP connection for multiple requests.
 - ***Pipelining*** features which implies that user can send multiple requests before waiting for responses from servers.
 - ***Parallel TCP connection*** with client to keep the browser performance at an acceptable level.


Problems with HTTP/1.x:
 - ***Lack of prioritization*** which could lead to blocking of critical resources being download.
 - ***Head-of-line blocking*** led to inefficient use of network resources, because it can handle only one request within the same pipeline at a time. This means `HTTP/1.1` requires the responses to be sent in the order in which the requests were received.
 - ***Large size in header*** which impacting performance especially on modern web (like mobile 4G connection).

### About HTTP/2

`HTTP/2` or SPDY, has some new features and it is mainly to address the problems found at `HTTP/1.1`. It includes:
 - ***Multiplexing*** which effectively sending request and receiving response asynchronously.
 - ***Header compression*** to compress request/response headers for reducing the amount of data transmitted.
 - ***Server push*** which allow pushing of resources to client's cache (before being requested) for better user experience.
 - ***Stream prioritization*** allows critical resources to be fetched and rendered first, in clients' request.
 - ***Binary framing*** is used to encapsulate message to make protocol more efficient.

### About HTTP/3

`HTTP/3` or QUIC - is a UDP-based stream-multiplexing, encrypted transport protocol that documented under RFC9000. This also means that firewall rule update is needed for `HTTP/3` to work correctly because of new UDP transport protocol is introduced here. Thus it is aka ***Quick UDP Internet Connections*** (QUIC).

QUIC has the benefits:
 - ***Built-in encryption*** by incorporate TLS 1.3 by defaulti, and thus reduce the latency of establishing connection.
 - ***Connection migration*** which allow mobile client to change IP address without lossing connectivity. 
 - ***0-RTT*** or zero-round-trip-time is enabled for reducing latency of establishing connection.

As of today, a few web sites have migrated to HTTP/3, for example, www.facebook.com, blog.cloudflare.com and www.google.com. 

## Manual checking on HTTP version

Majority of the browsers are supporting HTTP/2 (enabled by default) but not all are supporting HTTP/3 yet. Below are the curl and (projectdiscovery) httpX commands to check HTTP version.

```shell
$ curl -sI https://www.google.com -o/dev/null -w '%{http_version}\n'
2

$ curl -sI https://www.isc2.org -o/dev/null -w '%{http_version}\n'
1.1

$ echo www.youtube.com | ./httpx -http2 -title -pipeline -vhost

    __    __  __       _  __
   / /_  / /_/ /_____ | |/ /
  / __ \/ __/ __/ __ \|   /
 / / / / /_/ /_/ /_/ /   |
/_/ /_/\__/\__/ .___/_/|_|
             /_/

                projectdiscovery.io

[INF] Current httpx version v1.3.0 (latest)

```

## Tools at MySeq: httpver_scan 

I have created cli tool, to perform quick scan on HTTP version. It is called [httpver_scan](https://githib.com/myseq/httpver_scan).

Below is the sample output where [301] redirection *is not followed*:

```shell
 [*] Scanning [7] sites...

           URLs                            Protocols           Server                    Time / Total      Content
==================================================================================================================
     [  1] https://requestbin.com/         r_0 [307] HTTP/2    s:CloudFront              [0.1506]/[0.1510] ~0.0kb
     [  2] https://nghttp2.org/            r_0 [200] HTTP/2    s:nghttpx                 [0.3011]/[0.3014] ~6.2kb
     [  3] http://www.isc2.org/            r_0 [301] HTTP/1.0  s:                        [0.0905]/[0.0908] ~0.0kb
     [  4] https://www.isc2.org/           r_0 [200] HTTP/1.1  s:                        [1.9348]/[1.9355] ~114.7kb
     [  5] https://facebook.com/           r_0 [301] HTTP/2    s:                        [0.3001]/[0.3006] ~0.0kb
     [  6] https://www.facebook.com/       r_0 [200] HTTP/2    s:                        [0.5904]/[0.5906] ~61.2kb
     [  7] https://httpbin.org/                        < Timeout               > [6.0867]


 [*] Completed 7/7 sites with 7 connections for 9.456673 sec. [ real: 6.10 sec].
```

Below is the sample output where [301] redirection *is followed*:

```shell
 [*] Scanning [7] sites...

           URLs                            Protocols           Server                    Time / Total      Content
==================================================================================================================
     [  1] https://requestbin.com/         r_1 [200] HTTP/2    s:                        [1.3965]/[1.6643] ~522.1kb
     [  2] https://nghttp2.org/            r_0 [200] HTTP/2    s:nghttpx                 [0.3163]/[0.3168] ~6.2kb
     [  3] http://www.isc2.org/            r_1 [200] HTTP/1.1  s:                        [2.0711]/[2.1660] ~114.7kb
     [  4] https://www.isc2.org/           r_0 [200] HTTP/1.1  s:                        [1.9245]/[1.9249] ~114.7kb
     [  5] https://facebook.com/           r_1 [200] HTTP/2    s:                        [0.3767]/[0.6940] ~61.2kb
     [  6] https://www.facebook.com/       r_0 [200] HTTP/2    s:                        [0.6108]/[0.6110] ~61.2kb
     [  7] https://httpbin.org/                        < Timeout               > [6.0383]


 [*] Completed 7/7 sites with 10 connections for 13.415142 sec. [ real: 6.05 sec].
```


## Links
 - [HTTP/3 check](https://http3check.net/) - by LiteSpeed
 - [HTTP/2](https://en.wikipedia.org/wiki/HTTP/2) - by Wikipedia
 - [HTTP/3](https://en.wikipedia.org/wiki/HTTP/3) - by Wikipedia
 - [httpX](https://github.com/projectdiscovery/httpx) - by Project Discovery
 - [http2 explained](https://daniel.haxx.se/http2/)
 - [HTTP/2 Explained](https://http2-explained.haxx.se/)
 - [HTTP/3 Explained](https://http3-explained.haxx.se/)
 - HTTP/1.1 Vs HTTP/2 [Akamai demo](https://http2.akamai.com/demo)
 - [HTTP Testing Tools](https://http.dev/tools)

