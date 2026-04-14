---
title: "Oracle Cloud Free Tier"
date: 2024-03-18T14:00:47+08:00
tags: [ "cloud", "free", "oracle" ]
categories: [ "Posts"  ]
summary: "Build, test and deploy application on a Linux server in Oracle Cloud - for FREE."
draft: false
---
{{< lead >}}
*Just sign up into Oracle Cloud and get my FREE Linux server within 20 min*.
{{< /lead >}}

Today, I just come across this video from Gary.
And by following the instruction (and tips) from the video, I manage to have my Linux server up and running within 20 min.

## Oracle Cloud

**Oracle Cloud Free Tier** is an *Always Free* services.
This means we can use it with no time constraints (subject only to the capacity limits).

The free Linux server comes with full root access and public IP address. 

## Instruction

Follow the instruction from Gary's YouTube video, and get your free Linux server now.

{{< youtube id="zWeFD4NNF5o" title="How to Get a Free Linux Server in the Cloud" >}}

> Thanks Gary for the tips on choosing the OS image.

## My First Instance

In case you are interest, I have choose `Canonical-Ubuntu-22.04-Minimal` image for my first Linux server instance.

Below are the RAM and HD sizes.

![Oracle Cloud Free Tier](/images/oracle_cloud_free_tier.png)

I also setup the SSH access by upload my own public key.
And I just document it in `$HOME/.ssh/config` for easier access.

```
Host opf
    HostName 15x.17x.24x.14x
    User ubuntu
```

Finally, I can simply `ssh opf` and login without password.

## Final Thought

I strongly suggest to enable `Secure Verification` while signing up at Oracle Cloud. 
Because to sign up in free tier, I still have to leave my credit card info at Oracle Cloud (even it will never be charged).

Lastly is about my plan on using the free Linux server.

At this time, I'm planning to:
 - Run dockers for vulnerability scanning.
 - Run dockers for OSINT research.
 - Develop scripts in Python.

## Links

 - [Oracle Cloud Free Tier](https://www.oracle.com/cloud/free/)


