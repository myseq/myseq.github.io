+++
title = "Creating TCP/UDP Socket with /bin/bash"
date = "2023-02-28T22:40:11+08:00"
author = "zd"
tags = [ "bash", "cli", "tcpip" ]
categories = [ "Posts" ]
summary = "Using /bin/bash to create TCP/UDP socket for troubleshooting"
draft = false
+++

## Background

We can't expect tools is always available when we troubleshoot a network issue, like checking if firewall ports are open. Tools like `netcat`, `nmap`, `curl` / `wget`, are always removed in an enterprise *production environment*. 

Here, we can use one of the built-in feature of `bash`, to open TCP/UDP sockets via `/dev/tcp` and `/dev/udp` device file, and perform read/write from the socket in `bash`.

## TCP/UDP Socket in `bash`
To open a TCP/UDP socket with a `file descriptor`:

> `exec {file-descriptor}<>/dev/{protocol}/{host}/{port}`
>
> `file-descriptor` is a unique non-negative integer associated with each socket, where file descriptor 0, 1 and 2 are reserved for `stdin`, `stdout` and `stderr`, respectively. 
>
> `<>` implies that the socket is open for read and write.
> `<` means `read` and `>` means `write`
>
> `protocol` can be either tcp or udp. 
>
> `host` and `port` are for  IP address (or hostname) and port number.
>

For example, to open a bi-directional TCP socket for `www.google.com` with `HTTP` port, with file descriptor `3`:
```console
$ exec 3<>/dev/tcp/www.google.com/80
```

To close the socket, file-descriptor `3`, use the 2 cmd below, the 1st for closing `stdin`, and 2nd for `stdout`:
```console
$ exec 3<&-
$ exec 3>&-
```

To read a message from a socket: 
```console
$ read -r -u -n $MESSAGE <&3
$ MESSAGE=$(dd bs=$NUM_BYTES count=$COUNT <&3 2>/dev/null)
```

To write a message to a socket:
```console
$ echo -ne $MESSAGE >&3
$ printf $MESSAGE >&3 
```

## Usages

### To get SSH version.
```bash
#!/bin/bash
exec 3</dev/tcp/127.0.0.1/22
timeout 1 cat <&3
```

```console
$ bash ssh_version.sh
SSH-2.0-OpenSSH_8.9p1 Ubuntu-3ubuntu0.1

```


### To get time from NIST.gov.
```bash
#!/bin/bash
cat </dev/tcp/time.nist.gov/13
```

```shell
$ bash nist_time.sh
60068 23-02-28 10:39:01 50 0 0 424.8 UTC(NIST) *

```


### To get HTTP server header.
```bash
#!/bin/bash
exec 3<>/dev/tcp/www.google.com/80
echo -e "HEAD / HTTP/1.1\r\nhost: www.google.com\r\nConnection: close\r\n\r\n" >&3
cat <&3
```

```console
HTTP/1.1 200 OK
Content-Type: text/html; charset=ISO-8859-1
Content-Security-Policy-Report-Only: object-src 'none';base-uri 'self';script-src 'nonce-rfjZ0lOELcoZRvMge28doQ' 'strict-dynamic' 'report-sample' 'unsafe-eval' 'unsafe-inline' https: http:;report-uri https://csp.withgoogle.com/csp/gws/other-hp
P3P: CP="This is not a P3P policy! See g.co/p3phelp for more info."
Date: Thu, 04 May 2023 10:34:09 GMT
Server: gws
X-XSS-Protection: 0
X-Frame-Options: SAMEORIGIN
Transfer-Encoding: chunked
Expires: Thu, 04 May 2023 10:34:09 GMT
Cache-Control: private
Set-Cookie: 1P_JAR=2023-05-04-10; expires=Sat, 03-Jun-2023 10:34:09 GMT; path=/; domain=.google.com; Secure
Set-Cookie: AEC=AUEFqZcECrlEggoQ15r5NcMZIwD0C5o3G5LFdqDWcgVEYwtsaAblLoxpQA4; expires=Tue, 31-Oct-2023 10:34:09 GMT; path=/; domain=.google.com; Secure; HttpOnly; SameSite=lax
Set-Cookie: NID=511=h7zvs4z2hLAL2QkLxwVZys3AVoIoDi7LIEmuJNnRLwcKshharsm4yUVNjgJA48jhuwWJJCBV3llvMvXrDNoS-kyNt7uCZxjJfWsnBhS6Wi7KUPYxZKNWmt1KLAJs3Jnl4L0mxSYhrGpUmOJpxnyyzHGSSsCK6L43AY9Is4DBNa0; expires=Fri, 03-Nov-2023 10:34:09 GMT; path=/; domain=.google.com; HttpOnly
Connection: close
```

### To check if Internet is connected 
```bash
#!/bin/bash

HOST=www.google.com
PORT=80

(echo >/dev/tcp/${HOST}/${PORT}) &>/dev/null
if [ $? -eq 0 ]; then
    echo "Connection to $HOST : 😄 successful"
else
    echo "Connection to $HOST : 😟 unsuccessful"
fi
```

```shell
$ bash online_google.sh 
Connection to www.google.com : 😄 successful

```


