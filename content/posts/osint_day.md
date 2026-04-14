---
title: "OSINT Day"
date: 2023-02-26T18:16:31+08:00
tags: [ "anniversary", "framework", "osint", "social", "tools", "waf" ]
categories: [ "Posts"  ]
summary: "Hey, today is OSINT Day!"
draft: false
---
{{< lead >}}
Open Source Intelligence (OSINT) is the collection, analysis, and dissemination of information that is publicly available and legally accessible.
{{< /lead >}}

## National OSINT Day

OSINT Day is celebrated on **February 26th** each year. 
It was established by the OSINT Foundation, a professional association of U.S. Intelligence Community open-source intelligence (OSINT) practitioners, in recognition of the contributions made to the national security of the United States by OSINT practitioners and the OSINT discipline.

> I didn't know there is OSINT Day has been established until today. 

Thus, with OSINT Day, it is an opportunity to raise awareness of the importance of OSINT and to celebrate the work of OSINT practitioners. 
It is also a time to learn more about OSINT techniques and tools, and to share knowledge with others.

## OSINT Tools

Here are the 3 common tools that I used for OSINT.
 - **WAFW00F**: A WAF Fingerprinting Tool.
 - **SherLock**: A tool to hunt down social media accounts by username.
 - **OSINT-Frameowrk**: A OSINT framework that help to find free OSINT resources.

### WAF Fingerprinting

Web application firewall, or known as WAF, is a security device that protect websites from attacks.

`WAFW00f` is a WAF fingerprinting tool. 
It is used to identify the specific type of WAF that is protecting a website.

This information can be useful for attackers, as it can help them to develop targeted attacks against the WAF. 
However, it can also be useful for security professionals, as it can help them to identify and mitigate vulnerabilities in WAFs.

```shell
$ git clone https://github.com/EnableSecurity/wafw00f
$ cd wafw00f
$ sudo python setup.py install
```

To start fingerprinting a website, like **bbc.com**, just do:

```shell
$ wafw00f bbc.com

                   ______
                  /      \
                 (  Woof! )
                  \  ____/                      )
                  ,,                           ) (_
             .-. -    _______                 ( |__|
            ()``; |==|_______)                .)|__|
            / ('        /|\                  (  |__|
        (  /  )        / | \                  . |__|
         \(_)_))      /  |  \                   |__|

                    ~ WAFW00F : v2.2.0 ~
    The Web Application Firewall Fingerprinting Toolkit

[*] Checking https://bbc.com
[+] The site https://bbc.com is behind Cloudfront (Amazon) WAF.
[~] Number of requests: 2

```

This is is created in Python by EnableSecurity and can be downloaded at:

{{< github repo="EnableSecurity/wafw00f" >}}

### Social Media

To hunt down a targetted user across social networks, we can use a tool called `sherlock`.

> Same as `wafw00f`, `sherlock` can run as container too.

```shell
$ git clone https://github.com/sherlock-project/sherlock.git
$ cd sherlock
$ python3 -m pip install -r requirements.txt
```

To start hunting a user, **hackerman1337**:

```shell
$ python3 sherlock hackerman1337
```

To hunt for more users:

```shell
$ python3 sherlock elonmusk billgates 
```

`sherlock` is hosting at:

{{< github repo="sherlock-project/sherlock" >}}

### OSINT Framework

OSINT is the collection, analysis and dissemination of publicly accessible information using open source tools.
And [OSINT Framework](https://osintframework.com/) is a tool focusing providing the free resources/tools for OSINT.

The tool is available at [https://osintframework.com/](https://osintframework.com), and the project is hosting at:

{{< github repo="lockfale/osint-framework" >}}

## Links

 - National [OSINT Day](https://www.osintfoundation.com/NewsBot.asp?MODE=VIEW&ID=29814).
 - SANS [What is Open-Source Intelligence](https://www.sans.org/blog/what-is-open-source-intelligence/)?




