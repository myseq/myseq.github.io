---
title: "Update Error: dpkg error code 1"
date: 2024-03-24T20:16:53+08:00
tags: [ "error", "ubuntu", "sysadm" ]
categories: [ "Posts"  ]
summary: "Resolving various errors while updating my Ubuntu."
draft: false
---
{{< lead >}}
*An essential troubleshooting guide for Sysadm*.
{{< /lead >}}

Recently, I come across update error code 1 while updating my Ubuntu. 
And this isn't the first time it happens. 

It can be in different formats, such as:

```
subprocess installed post-installation script returned error exit status 10
```

```
E: Sub-process /usr/bin/dpkg returned an error code (1)
```

```
dpkg: error processing package dpkg (--configure):
 installed dpkg package post-installation script subprocess returned error exit status 1
Errors were encountered while processing:
 dpkg
```


## Quick Resolution

1. Remove post info files of those troubleshome package.

```
$ sudo mv /var/lib/dpkg/info/dpkg.* /tmp
```

Note that package name can be others, such as `openssh-server.*` or `dpkg.*`.

2. Use force install.

```
$ sudo apt install -f 
```

3. Reconfigure package database.

```
$ sudo dpkg --configure -a 
```

## Root Cause

Most likely, the package got corrupted while installing a package. Usually reconfiguring fix the problem.
And if a package installation was interrupted previously, then force installing is needed to resolve it. 


