---
title: "SSH Tunnelling"
date: 2026-05-28T11:55:40+08:00
tags: [ "ssh", "tunnel" ]
categories: [ "Posts"  ]
series: [ "SSH" ]
series_order: 3
summary: "Bypass firewall and safely access hidden services by wrapping network traffic inside a secured SSH tunnel."
draft: false
---
{{< lead >}}
*SSH tunnelling securely routes traffic between two points that normally can't talk to each other.*

*It can provide the access to private database that blocked by firewall, or open up a local web server to Internet.*
{{< /lead >}}

In the past, I had posted a quick notes on SSH tunnelling.
It shares the details on different SSH port forwarding methods to create an encrypted tunnel.
It also provides tips on running port forwarding in background **without shell access**.
And how an organization firewall can identify and **block tunneled traffic**.

More details about SSH port forwarding at: 
{{< article link="/posts/ssh/port_forwarding/" >}}

This article here will only focus on the 2 main tunneling methods: **Local** and **Remote**.

## Local Tunnelling

In short, tunnelling with **Local port forwarding** (`-L`) brings the remote service close to us.

**Local port forwarding** takes a service running far away on a remote network (like a private database in DC) and maps it so it feels like it's running right on localhost.

{{< alert >}}
**Local** (`-L`): *Pulls the Remote --> Near (to me)*
{{< /alert >}}

**Goal:** We want to access something on the remote side that is hidden or blocked from the outside world.

### Examples

 - **Database access**: Forward local port `3306` to remote database via SSH. And `localhost:3306` is available on our laptop now.
 - **Admin dashboard**: Use local port forwarding through an SSH jump server to view `http://localhost:8080` instead of `192.168.100.20` (DC admin panel)
 - **Secure unencrypted traffic**: Wrap VNC or HTTP traffic inside an encrypted SSH tunnel to keep it safe.

## Remote Tunnelling 

Tunneling with **Remote port forwarding** (`-R`) does the opposite:
it opens up local server out to the remote world.

**Remote port forwarding** takes a service running at localhost (like a local web app) and projects it onto the remote server, so people out there can acces it through that server.

{{< alert >}}
**Remote** (`-R`): *Pushes the Local --> Far (from me)*
{{< /alert >}}

**Goal:** We want to let someone on the remote side access a service running locally on my localhost.

### Examples

 - **Quick demo**: Forward port `8080` on a public VPS back to localhost port `3000`. This will open up at `http://vps.public.org:8080/` for others to access.
 - **Webhook testing**: Use remote port forwarding so incoming webhooks to public server get redirected straight into localhost.
 - **Accessing home machine from work**: Have home LXC establish an SSH connection with remote port forwarding to a VPS. This will allow remote connection all the way back to home from remote site.


## Simple Decision Rule

Here's a simple decision rule:

```
WHERE DOES THE SERVICE LIVE?
 ├── On the remote host?  ──> Use LOCAL (-L)  (Bring remote service TO me)
 └── On your localhost? ──> Use REMOTE (-R) (Send local service TO others)
```

With **Local port forwarding**, we would only ever be able to access remote resources from local machine.
**Remote port forwarding** flips the tunnel's purpose, by allowing us to punch through our restrictive firewall and expose the resources outward, without having to change any router or firewall settings.

 - **Local Forwarding** brings a *distant+hidden service* to us.
 - **Remote Forwarding** pushes *hidden+local service* to the world.

**Analogy**: Use *Local Port Forwarding* when we are acting as the consumer trying to pull data in. 
Use *Remote Port Forwarding* when we are acting as the host trying to push data out.


