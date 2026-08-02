---
title: "SSH ProxyJump"
date: 2026-08-02T05:55:40+08:00
tags: [ "ssh", "tunnel" ]
categories: [ "Posts"  ]
series: [ "SSH" ]
series_order: 7
summary: "One single seamless command to eliminate the risk in SSH port forwarding."
draft: false
---
{{< lead >}}
*ProxyJump is actually a specialized form of automated tunneling.*
{{< /lead >}}

While *port forwarding* (tunneling) is the broad/manual mechanism of routing network traffic through an SSH connection,
**ProxyJump** is a native OpenSSH shortcut, like invisible highway, designed specifically to chain SSH sessions together without exposing local ports.

> In short, `ProxyJump` handles the entire multi-hop process automatically inside a single command.

## ProxyJump

**ProxyJump** creates a single end-to-end SSH session through the specified jump hosts. 
It was introduced in *OpenSSH 7.5* to simplify access to servers that sit behind firewalls or live in private networks.

In fact, it is a specialized form of automated [SSH tunnelling](/posts.ssh/tunnelling/) or [SSH port forwarding](/posts/ssh/port_forwarding/).

## Why ProxyJump?

 1. **Enhanced security** by keeping target environment off the public Internet.
 1. **Eliminate agent forwarding risks** where a compromised jump host that hijacks local SSH key.
 1. Provide **native tool integration** such as `scp`, `rsync`, `sftp`.

## Comparison

| Feature | ProxyJump (`-J`) | Port Forwarding (`-L`/`-R`) |
| :------ | :--------------- | :-------------------------- | 
| Purpose | Connecting SSH client to an SSH server through an intermediary SSH server | Routes any TCP traffic (HTTP,VNC,DB) from a local port to a remote destination |
| Config. | Zero-config (automatic) | Requires choosing local/remote ports |
| Cleanliness | Leaves no dangling local ports | Keeps a local port occupied while open |
| Security | End-to-end SSH session only | Encrypted only between SSH client and gateway |

Here's a mechanical comparison to achieve the same goal using both methods.

**Goal**: accessing a private database server (`10.0.0.5:3306`).

***The Port Forwarding Method (Tunnelling)***

```bash
# Step 1: Create the tunnel 
# (maps local port 5555 to remote database via bastion)
ssh -L 5555:10.0.0.5:3306 user@bastion.com

# Step 2: Open a new terminal and connect your database client locally
mysql -h 127.0.0.1 -P 5555 -u db_user -p
```

***The ProxyJump Method***

```bash
ssh -J user@bastion.com user@10.0.0.5
```

{{< alert >}}
*If there is a case of having a complex network topology that requires multiple transitions,*
*we can chain multiple jump hosts together by separating with commas:*
```bash
ssh -J user@jump1,user@jump2 user@target
```
{{< /alert >}}

## Common Use Cases

 1. **Accessing Cloud VMs** by automating the chain movement from bastion to the private server.
 1. Allow **remote administration** to servers which not accessible on the public Internet.
 1. **Accessing development environments** that locating at different network zone.
 1. **Emergency troubleshooting** without VPN access.
 1. Provide **compliance and audit-ready access controls** by monitoring and logging the accesses that funneled through a single entry point (bastion host). 


