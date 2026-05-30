---
title: "Enable Auto Updates"
date: 2026-05-21T21:24:40+08:00
tags: [ "101", "hardening", "ubuntu" ]
categories: [ "Essential", "Posts"  ]
summary: "Consider enabling auto security updates."
draft: false
---
{{< lead >}}
*New vulnerabilities are found regularly.*
*Ensuring system packages are up to date is crucial for security.*
{{< /lead >}}

`Ubuntu` can apply security updates automatically, without user interaction. 
This is done via the `unattended-upgrades` package, which is installed by default.

## Auto Update

Consider enabling auto security updates:

```console
% sudo apt install unattended-upgrades
% sudo dpkg-reconfigure --priority=low unattended-upgrades
```

To check the current auto-upgrade status:

```console
% apt-config dump APT::Periodic::Unattended-Upgrade
```

Testing and/or debugging:

```console
% sudo unattended-upgrades --dry-run --debug
```

## Manual Update

To manually update packages:

```console
% sudo apt update && sudo apt upgrade 
```

## Links

 - [Automatic Updates](https://ubuntu.com/server/docs/how-to/software/automatic-updates/)
 - Advanced [Howto](https://www.interserver.net/tips/kb/configure-automatic-security-updates-in-ubuntu-24-04/)


