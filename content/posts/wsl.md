---
title: "Windows Subsystem for Linux"
date : 2023-08-03T11:29:58+08:00
authors : 
  - "zd"
tags : [ "config", "wsl" ]
categories : [ "Posts" ]
summary : "Advanced settings configuration in WSL."
draft: false
---

## Windows Subsystem for Linux

There are 2 config files in WSL. 
 - `wsl.conf` - per-distribution basis 
 - `.wslconfig` - globally across all WSL 2 distributions 

### Config: /etc/wsl.conf
 - located at `/etc/` folder within the distribution.
 - per-distribution basis
  
```
[boot]
systemd = true
#command = service docker start

[user]
default = xx

[network]
hostname = wslpf
generateHosts = false
generateResolvConf = false

[automount]
#enabled = true
#mountFsTab = true
#root = /mnt
#options = 

[interop]
#enabled = true
#appendWindowsPath = true

```

### Config: %UserProfile%\.wslconfig
 - located at `%UserProfile%\` (usually `c:\Users\<UserLogin>`) folder within Windows OS.
 - contains global configuration for all WSL distributions.

```
[wsl2]
memory=4GB
processors=4
#memory=16GB
#processors=8
```

## Links
 - [Advanced settings configuration](https://learn.microsoft.com/en-us/windows/wsl/wsl-config) 
 - [wsl-config.md](https://github.com/MicrosoftDocs/wsl/blob/main/WSL/wsl-config.md)

