---
title: "Why TLS 1.3?"
date: 2024-09-19T00:08:21+08:00
tags: [ "101", "tls" ]
categories: [ "Posts"  ]
summary: "What is TLS 1.3?"
draft: false
---
{{< lead >}}
*In a nutshell, TLS 1.3 is faster and more secure than TLS 1.2.*
{{< /lead >}}

TLS 1.3 was published by 2018.
Since then, it starts replacing the TLS 1.2 (since 2008) and others as the latest standard.

## Why TLS 1.3?

TLS 1.3 has a faster at TLS handshaking than TLS 1.2.
It only requires one round trip (or even zero) instead of two.
This will shortening the entire TLS handshaking process.

In some cases where client has connected to a website before, the TLS handshake will have zero round trips.
This makes the entire HTTPS connection faster by cutting down latency.

Another major improvement with TLS 1.3 is stop supporting for those older cryptographic algorithms.
As a result, it is more secure than TLS 1.2.

## History 

{{< timeline >}}

{{< timelineItem icon="lock" header="2018" subheader="TLS 1.3" >}}
RFC 8446: The Transport Layer Security (TLS) Protocol Version 1.3
{{< /timelineItem >}}

{{< timelineItem icon="lock" header="2008" subheader="TLS 1.2" >}}
RFC 5246: The Transport Layer Security (TLS) Protocol Version 1.2
{{< /timelineItem >}}

{{< timelineItem icon="lock" header="2006" subheader="TLS 1.1" >}}
RFC 4346: The Transport Layer Security (TLS) Protocol Version 1.1
{{< /timelineItem >}}

{{< timelineItem icon="lock" header="1999" subheader="TLS 1.0" >}}
RFC 2246: The Transport Layer Security (TLS) Protocol Version 1.0
{{< /timelineItem >}}

{{< timelineItem icon="lock" header="1996" subheader="SSLv3" >}}
RFC 6101: The Secure Sockets Layer (SSL) Protocol Version 3.0 (posthumously standardized)
{{< /timelineItem >}}

{{< timelineItem icon="lock" header="1995" subheader="SSLv2" >}}
No official RFC.
Proprietary protocol developed by Netscape.
It was later deprecated due to security flaws.
{{< /timelineItem >}}

{{< timelineItem icon="lock" header="-" subheader="SSLv1" >}}
Proprietary protocol developed by Netscape.
It was never made public due to significant security issues.
{{< /timelineItem >}}

{{< /timeline >}}

