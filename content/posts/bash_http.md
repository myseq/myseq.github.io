---
title: "HTTP Request with Bash"
date: 2024-08-24T07:26:29+08:00
tags: [ "bash", "cli", "http" ]
categories: [ "Posts"  ]
summary: "HTTP request without `curl`."
draft: false
---
{{< lead >}}
*This is an augment on writing BASH script to perform HTTP request (without using `curl`).*
{{< /lead >}}

In the last posts, "[Creating TCP/UDP Socket with /bin/bash](/posts/tcp_socket_in_bash/)", I've shown `4` usages on creating TCP socket using `/bin/bash`.

{{< article link="/posts/tcp_socket_in_bash/" >}}

Here, I'll be showing a more comprehensive way to perform HTTP request with Bash script, including return HTTP headers.

```bash
#!/usr/bin/env bash

PORT=80
HOST="httpbin.org"

exec 3<>/dev/tcp/$HOST/$PORT

HDRS=(
    'GET /ip HTTP/1.1'
    'Host: $HOST'
    'Connection: close'
    ''
)

printf '%s\r\n' "${HDRS[@]}" >&3

while read -r data <&3; do
    echo "recv: $data"
done

exec 3>&-

```

And here is the output.

```shell
$ ./bash_curl.sh

recv: HTTP/1.1 200 OK
recv: Date: Thu, 22 Aug 2024 15:14:54 GMT
recv: Content-Type: application/json
recv: Content-Length: 33
recv: Connection: close
recv: Server: gunicorn/19.9.0
recv: Access-Control-Allow-Origin: *
recv: Access-Control-Allow-Credentials: true
recv:
recv: {
recv: "origin": "115.164.33.158"
recv: }

$
```

## Links

 - [More options on sending HTTP request using BASH](https://www.haikel-fazzani.eu.org/blog/post/bash-send-http-request)


