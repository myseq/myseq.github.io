---
title: "HTTP Versions"
date: 2024-08-30T18:35:58+08:00
tags: [ "http" ]
categories: [ "YT" ]
summary: "HTTP 1 Vs HTTP 2 Vs HTTP 3!"
draft: false
---
{{< lead >}}
*Amazing animation in explaining the differences among HTTP versions, 1, 1.1, 2.0 and 3.0.*
{{< /lead >}}

## HTTP Version Evolution

![HTTP Version Evolution](/images/http_version_evolution.png)

In case you haven't know, I've posted about [HTTP Versioning](/posts/http_version/) last year.

{{< article link="/posts/http_version/" >}}

Below is the video at [Youtube](https://www.youtube.com/watch?v=UMwQjFzTQXw), shared by [ByteByteGo](https://www.youtube.com/@ByteByteGo).

{{< youtube id="UMwQjFzTQXw" title="HTTP 1 Vs HTTP 2 Vs HTTP 3!" >}}

### Transcript

Here, I also include the full transcript for reference.

----

Today we're diving into the fascinating world of HTTP. 
It's the backbone of the web. 

We explore how it evolved from HTTP 1, to 2 and then to 3. 
Get ready for an interesting ride.

HTTP stands for hypertext transfer protocol.
It is how browsers talk to web servers.
They ask for web pages and get them back.

At first, HTTP was for hypertext documents. 
These are documents with links to other documents but developers soon found HTTP could send imag and videos too.

Now it's also used for APIs, file transfers and a wide range of web-based services. 

Let's go back to 1996.

That's when HTTP 1 was introduced but before that, there was `HTTP 0.9`. 

It was simple. 
It only supported GET and had no headers.
It only sent HTML files there where no HTTP headers or status codes. 

`HTTP 1.0` added headers status codes and new methods that POST and HEAD.
It was straightforward the browser would ask for a web page the server would send it.

Each request needed its own connection. 
This means a lot of back and forth. 

It wasn't very efficient.
This is why. 
First there's a TCP handshake which is a 3-way process to start a connection. 
Then for HTTPS there's a TLS handshake for security.

This all happens before any data is sent with HTTP 1.

This happened for every resource. 
Every image, CSS file, or JavaScript file. 
Not ideal right? 

In 1997, `HTTP 1.1` came out.
It fixed problems with http 1. 

It's still used a lot today even after 25 years. 

Why? 
It has some great new features.

HTTP 1.1 introduced persistent connections. 
The connections stay open unless to close.

This meant no more closing after every request.
No more multiple TCP handshakes.

It got rid of the extra work of constantly opening and closing connections. 

It also introduced pipelining. 
This allows clients send multiple requests over one TCP connection. 
They didn't have to wait for responses.

For example, when a browser needs two images, he can request them one after the other.
This made things faster by reduced the wait time for each response. 

Another key feature was chunk transfer encoding.

Servers could send responses in smaller chunks. 
They didn't have to wait for the whole response to be ready. 

This may initial page rendering faster. 
It improved user experience especially for large or dynamic content. 

HTTP 1.1 also brought better caching and conditional requests. 
It added headers like cache control and ETag.
These help manage cache content and reduce unnecessary data transfers. 

Conditional request using headers like If-Modify-Since, let clients request resources only if they changed.
This save bandwidth and improved performance. 

But websites grew bigger and more complex, the this showed a big problem with HTTP 1.1 had a line blocking.

If the first request in the pipeline was delayed, all the others had to wait. 
Because of this and other issues, many browsers didn't use pipelining.

Developers found ways around these limits.

One was domain Sharding. 
Websites would serve static asset from subdomains.
Each new subdomain got 6 more connections.

Another trick was to make fewer requests by bundling assess. 
Images would be combined using Sprites CSS and JavaScript files would be concatenated.

In 2015, `HTTP 2` arrived.

It was designed to fix HTTP 1's performance problems.
It brought major improvements. 

HTTP 2 introduced a binary framing layer. 
Unlike HTTP 1's plain text messages, HTTP 2 uses binary format.

Messages are divided into smaller units called frames.
These are sent over the TCP connection.
The binary framing layer handles all these.

HTTP 2 also brought full request and response multiplexing.
Clients and servers can break down HTTP messages into independent frames.
These can be mixed during transmission and put back together on the other side. 
This fixed the Head-of-line Blocking problem from HTTP 1.

Stream prioritization was another key in HTTP 2 feature. 
The order of loading assets matters for web pages. 

Stream prioritization lets developers set the importance of requests.
The browser can tell the server which asset of high priority. 
The server then sends more frames for these important requests.

HTTP 2 also supports server PUSH. 
HTTP 2 allows multiple responses to client's request.

A server can send extra resources along with the requested HTML page.
It is like giving the client a resource before they even ask for it.

Lastly, HTTP 2 introduces header compression.
In HTTP 1, only the main data was compressed. 
Headers were sent as plain text. 

HTTP 2 uses HPack to make headers smaller. 
HPack compresses headers and remembers past headers.
It uses this info to compress future headers even more.
But as web apps got more complex and mobile, Internet became common, HTTP 2 shows some limits. 

TCP's nature is handling of packet loss.
And head outline blocking caused lower page lows. 
This was especially true on high latency or lossy networks. 

This led to `HTTP 3` standardizing in 2022.

HTTP 3 used QUIC instead of TCP.
QUIC was developed by Google.
It was built on UDP, a connectionless protocol. 

UDP doesn't need to set up a connection before sending data. 
QUIC and HTTP 3 have some big advantages. 
They reduce latency.
They improve multiplexing without TCP head outline blocking. 
They handle packet loss better. 
They perform better on mobile networks with seamless connection changes.

When a client connects to a server with HTTP 3, it starts a QUIC handshake.
QUIC combines with TLS 1.3 for security.

The TLS handshake happens during the QUIC connection setup.
This reduces the overall latency. 

HTTP 3 sets up connections faster than TCP. 
If the client and server have talked before, QUIC can secure the connection in 1 round trip.
Sometimes it can do it in 0-round-trip. 

In 0-RT, the client sends a request right away. 
The server process it without a full handshake.

HTTP 3 also handles network changes well.
If you switch from Wi-Fi to cellular on your phone, HTTP 3 can keep the connection going. 
This is thanks to QUIC connection IDs.
These don't depend on IP addresses.

As of 2023 HTTP 1.1 is still widely used especially for simple websites.

HTTP 2 has been adopted a lot. 
It handles over 60% of web requests according to some estimates.

HTTP 3 is still new but gaining ground. 
Big companies like Google and Cloud flare are leadings its adoption.

That's a journey through HTTP evolution we've seen how it changed from HTTP 1's simple model, to http 2's multiplexing, and HTTP 3's QUIC connections. 

The web's foundational protocols have adapted to our growing need for fast reliable online experiences.

....

----
(End)

## Links 

 - [HTTP 1 Vs HTTP 2 Vs HTTP 3!](https://www.youtube.com/watch?v=UMwQjFzTQXw) by [ByteByteGo](https://www.youtube.com/@ByteByteGo).
