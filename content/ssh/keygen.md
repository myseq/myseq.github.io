---
title: "Essential Security on SSH Client"
date: 2024-01-23T10:12:50+08:00
tags: [ "101", "passwordless", "ssh" ]
categories: [ "Posts", "Essential"  ]
series: [ "ssh_client" ]
series_order: 1
summary: "New series about essential practices for SSH client."
draft: true
---
{{< lead >}}
*This is the my first article that focus on essential practices for SSH client.*
{{< /lead >}}

Many ariticles talk about the best practices on securing SSH server.
But not many really pay attention on practicing essential security for SSH client.

The use of public key authenticationi (PKA) in SSH, is known to be a form of `passwordless` practice. 

> In fact, `Passkeys` implementation is very similar to SSH PKA.



> What’s worse than an unsafe private key? An unsafe public key. ~ Ev Kontsevoy

## SSH Client

## SSH Protocol

The SSH protocol consists of 3 major components.

Transport Layer Protocol 
: Provides server authentication, confidentiality, and integrity with perfect forward secrecy.

User Authentication Protocol 
: Authenticates the client to the server.  

Connection Protocol 
: Multiplexes the encrypted tunnel into several logical channels.



## SSH PKA

SSH public key authentication (PKA) is the prefered method

### Keygen

```bash

```

## What's Next

SSH comes from the combination of hashing and symmetric/asymmetric encryptions.

Next, I'll deep dive into the algorithms commonly used in SSH, and explain in detail about the `keygen` process.

 - cryptography in SSH
 - protecting private key
 - use ssh-agent
 - autditing ssh client
   - list the fingerprints of all of the identities in the agent. `ssh-add -l`
 - key management in PKA
 - having fun on ssh keys
   - sign a file with your ssh private key
   - verify the the signature
   - SSH key distribution is easy at Github
 - summary
    - Use PKA instead of password for authentication.

 https://blog.peterruppel.de/ed25519-for-ssh/

Ed25519 is a modern and secure public-key signature algorithm that brings many desirable features, in particular the resistance against several side-channel attacks.

## Links

 - [The Secure Shell (SSH) Protocol Architecture (RFC4251)](https://datatracker.ietf.org/doc/html/rfc4251)
 - Mozilla - [Best Practices on OpenSSH Server](https://infosec.mozilla.org/guidelines/openssh)
 - [SSH Port Forwarding](https://myseq.github.io/posts/ssh_port_forwarding/)

