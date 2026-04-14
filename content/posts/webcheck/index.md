---
title: "OSINT Tool: WebCheck"
date: 2024-02-26T14:46:24+08:00
tags: [ "osint", "tools" ]
categories: [ "Posts"  ]
summary: "WebCheck: Open-source intelligence for any website."
draft: false
---
{{< lead >}}
***WebCheck*** is completely free. 
There is no signup, tracking, logging, or ads.
{{< /lead >}}

I learn about OSINT Day one year ago. 
Thus, I'm sharing another handy OSINT for any website today.

## WebCheck

WebCheck is another handy OSINT that I encounter recently.
It offers open-source intelligence and allows understanding of a website's infrastructure and security posture.

Unlike similar tools, WebCheck is free with no requirement for signup or ads. 
It even offer an online version for quick test.

The dashboard shows a number of information including:

 - IP info
 - SSL chain
 - DNS records
 - cookies and headers
 - domain info
 - server location
 - open ports and traceroute info
 - etc

### Deployment

There are a number of options to deploy WebCheck.

 1. Netlify
 2. Vercel
 3. Docker 
 4. Source

For the details, please refer to the WebCheck at GitHub.
See the link below.

## My Test

First, I like the interface.
It is simple and straight forward.

Second, the tool is fast. In my test, it completes 25 jobs within 6400 ms. 

Third, I found that the "Show Details" is handy and provide me an insight into the inner-workings of what were found.
It also provides the option to view and download the raw data (JSON).

Below is the screenshot taken from WebCheck.
![ _image_:bug: ](/images/webcheck.jpg)

Last, as the API documentation is not yet evailable, once it is available, I'll definitely explore more into the it. 

> Great job and thanks to [Alicia Sykes](https://aliciasykes.com/)!!

## Update 

Today (Mar 3),  I come across this YouTube video that talks about WebCheck, ***Unleash Your Cyber Investigation Powers: Master Web Check's OSINT Capabilities!***.

{{< youtube id="T2Yws6kUJtc" title="Unleash Your Cyber Investigation Powers: Master Web Check's OSINT Capabilities!" >}}

*Watched: Mar 3, 2024, 14:44*

## Links

 - Online [WebCheck](https://web-check.xyz/).
 - WebCheck on [GitHub](https://github.com/lissy93/web-check/).
 - [OSINT Day](https://myseq.github.io/posts/osint_day/).

