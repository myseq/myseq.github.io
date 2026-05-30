---
title: "SSH Key Generation"
date: 2026-04-24T20:24:40+08:00
tags: [ "cli", "ssh", "ubuntu" ]
categories: [ "Posts"  ]
series: [ "SSH" ]
series_order: 1
summary: "Securing OpenSSH with key-based authentication."
draft: false
---
{{< lead >}}
*Use the ed25519 algorithm for extra security, or use rsa -b 4096 for compatibility.*
{{< /lead >}}

The first step to implement core hardening on `Ubuntu` server, is to start with local machine -- **OpenSSH client**.

Because passwords are ssuceptible to brute-force attacks, it is **strongly** recommend to *switch* to **public key-based authentication**.


## Enforce Key-based Authentication

At local machine, generate a secure key pair: 

```console
% ssh-keygen -t ed25519 -C "username@local_machine"
```

The cmdline above use `ed25519` algorithm to generate key pair.
Curretnly it is the most recommended choice for SSH keys due to its superior security, performance, and efficiency.

However, *compatibility* with older systems remains the primary reason for choosing `RSA`.

```console
% ssh-keygen -t rsa -b 4096 -C "username@local_machine"
```

The cmdline above use `RSA` algorithm with **4096** bits to generate the key pair.

> Older version of OpenSSH (pre-version 6.5, released in 2014) do not support `ed25519`.

## Why Ed25519?

 - **Higher security with shorter keys.** A 256-bit `ed25519` key is roughly the same level as 4096-bit RSA key.
 - **Superior performance** (generating keys, signing, verifying authentiction).
 - **Resistance to attacks** (side-channel) and robust against PRNG failure (comparing to RSA)
 - **Compact size** (shorter public key at ~ 68 chars) for easier management.

> Once the key-pair is generated, just copy the ***public key*** to `Ubuntu` server with:
> `ssh-copy-id username@ubuntu_server_ip`

## SSH Config

This is to create an SSH Config shortcut.

On your local machine, edit `~/.ssh/config`:

```config
Host myserver
    HostName YOUR_SERVER_IP
    User ubuntu
    Port 22022
    IdentityFile ~/.ssh/id_ed25519
```

Then simply run:

```console
% ssh myserver
```

