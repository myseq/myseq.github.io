---
title: "DNS Over HTTPS"
date: 2026-10-01T01:23:53+08:00
tags: [ "dns", "dnssec", "doh"  ]
categories: [ "Posts"  ]
summary: "Popular public DoH server URLs."
draft: false
---
{{< lead >}}
***DNSSEC*** *is not a DNS transport method to protect the DNS query from unauthorized observing the network.*
{{< /lead >}}

Today, I decided to document my DNS resolver configuration.

Since 2 years ago, I've been moving to DNS over HTTPS configuation as my resolver whenever possible.
This including my handphone.

I'll also compare DoH with <mark>DNSSEC</mark>, as there is many misunderstanding about it.

## My DoH Config 

This is the list of DNS providers that I use normally. 

| DNS Provider | URL / Address | 
| :----------- | :------------ |
| Cloudflare | `https://1.1.1.1/dns-query` </br> `https://1.0.0.1/dns-query` </br> 1.1.1.1 | 
| Google | `https://dns.google/dns-query` </br> `https://8.8.8.8/dns-query` </br> 8.8.8.8 |
| Quad9 | `https://dns.quad9.net/dns-query` </br> 9.9.9.9 |

## Public DoH

Here are the popular public DoH Server URLs:

 * **Cloudflare**: `https://1.1.1.1/dns-query` (Backup: `https://1.0.0.1/dns-query`)
 * **Google Public DNS**: `https://dns.google/dns-query`
 * **Quad9**: `https://dns.quad9.net/dns-query`
 * **AdGuard**: `https://dns.adguard.com/dns-query` (Family protection: `https://dns-family.adguard.com/dns-query`)
 * **OpenDNS**: `https://dns.opendns.com/dns-query`


## DNS Resolver

There are several methods we can setup DNS resolver.

 1. DNS over UDP: Using `53/udp`.
 1. DNS over TCP: Using `53/tcp`. Fallback mode when UDP response is too large. 
 1. DNS over TLS/SSL (DoT): `853/tcp`
 1. DNS over HTTPS (DoH): `443/tcp`
 1. DNS over HTTP/3: `443/udp`. DoH carried over **HTTP/3/QUIC**.
 1. DNS over QUIC (DoQ): `853/udp`. DNS directly over QUIC.

## DNSSEC

DNSSEC is not a DNS transport method like others.

DNSSEC uses cryptographic signatures for validation.
This allows a resolver to determine whether a DNS response is authentic and has not been modified. 
It does not hide the DNS query from someone observing the network.

Here's the quick comparison.

| Technology | Purpose | Encrypts DNS | Validates DNS answer |
| :--------- | :------ | :----------: | :------------------: |
| DNS UDP/TCP 53 | Transport DNS | x | x | 
| DoH | Transport DNS securely over HTTPS | o | x |
| DoT | Transport DNS securely over TLS | o | x |
| DoQ | Transport DNS securely over QUIC | o | x |
| DNSSEC | Verify the integrity of DNS records | x | o |

{{< alert >}}
Instead of **confidentiality**, DNSSEC only ensure **integrity** to all our DNS query and response.
{{< /alert >}}

## Links 

 - Public [DoH Servers](https://dns-over-https.org/en/servers/public-doh-servers/)


