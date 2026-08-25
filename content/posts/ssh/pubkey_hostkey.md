---
title: "SSH Public Keys and Host Key"
date: 2026-08-21T17:32:50+08:00
tags: [ "asymmetric", "hardening", "ssh", "sysadm" ]
categories: [ "Posts"  ]
series: [ "SSH" ]
series_order: 9
summary: "Differences between `authorized_keys` and `known_hosts`."
draft: false
---
{{< lead >}}
*`authorized_keys` authenticates the user to the server, while `known_hosts` authenticates the server to the client.*
{{< /lead >}}

Both the (user's) SSH public key and (server's) Host key are public information. 

For example, here are the SSH public keys to access `Myseq` at GitHub.

```console
% curl https://github.com/myseq.keys 
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5....v/oQqgQSH4/JV8ov8qGUOFHjGDjSCdIw
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5....jJ9sXZkSbWI06WEe7rdbk+ht7gCmUFyt
```


## SSH Keys Management

`authorized_keys` and `known_hosts` are configuration files used in SSH (Secure Shell) to handle cryptographic security and verify identities.

 - `authorized_keys` lives on the server. It lists the public keys of users who are allowed to log into that server without a password. It proves who you are to the machine.
 - `known_hosts` lives on the client workstation. It stores the public keys or fingerprints of servers previously connected. It proves who the machine is and preventing fake servers from intercepting (man-in-the-middle attacks).

| Feature | `authorized_keys` | `known_hosts` |
| :------ | :---------------- | :------------ |
| Location | Stored on the remote server (usually at `~/.ssh/authorized_keys`). | Stored on the local client machine (usually at `~/.ssh/known_hosts`). |
| Purpose | Authenticates **user** to the server. Allows user login using a private key instead of password. | Authenticates **server** to the user. Helps prevent mitm attack. |
| Goal | Grants or denies access to log in | Warns if a server's identity changes | 
| Contents | List of public keys who are allowed access to specific account | List of public host keys or fingerprints for servers connected previously. | 
| Direction | Proves to the server that the connecting client is trusted. | Proves to the client that the remote server is trusted. | 


> I'll share more about the SSH public key management in next post. 
> Many **sysadm** will find how to secure a public facing SSH server which lacking in many **security best practice** guide.

## Tool: ssh-keyscan

`ssh-keyscan` (or `ssh-keyscan.exe`) is a cmdline used to gather public SSH Host keys from remote servers.

Its primary purpose is to help build and maintain the `known_hosts` file.

**Common Use Cases:**

```console
% ssh-keyscan github.com  
# github.com:22 SSH-2.0-20b2056
github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQAB....nAZp+S5hpQs+p1vN1/wsjk=
# github.com:22 SSH-2.0-20b2056
github.com ecdsa-sha2-nistp256 AAAAE2VjZHNh.....WZ2YB/++Tpockg=
# github.com:22 SSH-2.0-20b2056
github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5.....0dh2l9GKJl
# github.com:22 SSH-2.0-20b2056
# github.com:22 SSH-2.0-20b2056
```

**Key Parameters:**

 - `-t <type>`: Specifies the type of keys to fetch (e.g., **dsa, ecdsa, ed25519, rsa**).
 - `-p <port>`: Connects to a specific port on the remote host instead of the default port 22.
 - `-f <file>`: Reads a list of target hostnames or IP addresses from a file.
 - `-H`:  Hashes all hostnames and addresses in the output for extra privacy.


## Links 

 - Linux manual page: [sshd(8)](https://man7.org/linux/man-pages/man8/sshd.8.html)
 - SSH Certificates: [A Complete Guide](https://infisical.com/blog/ssh-certificates-guide)


