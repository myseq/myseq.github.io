---
title: "Kernel Panic"
date: 2025-07-22T21:30:16+08:00
tags: [ "kernel", "sysadm", "ubuntu" ]
categories: [ "Posts"  ]
summary: "Kernel Panic - not syncing: VFS: Unable to mount root fs on unknown-block (0,0)"
draft: false
---
{{< lead >}}
*Kernel Panic issue that due to missing of `initramfs`.*
{{< /lead >}}

Today, I just came into the **kernel panic** issue while booting up my Ubuntu OS.
Below is the error message:

{{< alert icon="fire" cardColor="#772953" iconColor="#e95420" >}}
Kernel Panic - not syncing: VFS: Unable to mount root fs on unknown-block (0,0)
{{< /alert >}}

## Root Cause

The kernel panic issue is due to missing of `initramfs` for the kernel version. 

This issue will occur when the kernel can't mount the `rootfs`.
There are 2 common causes which causing kernel panic issue.

First, the OS has been configured incorrectly during OS patching and upgrade.
To resolve this, we have to re-generate the `initramfs` and install it manually.

Another root cause for this issue is, the system has run out of storage space (`/boot`) and kernel updates had not completed successfully.
To resolve this, we have to do some clean up at the partition by removing old stuffs.

## Quick Resolution

Here's how I resolve the problem. 

First, I reboot my system with previous installed kernel (`6.11.0-29`).

Then, check the kernel version that I've installed earlier.

```console
% dpkg --list | grep linux-image-generic
ii  linux-image-generic-hwe-24.04                  6.14.0-24.24~24.04.3                                                    amd64        Generic Linux kernel image
```

The output shows that the kernel version is `6.14.0-24-generic`.
And below is what I need to do.

```console
% sudo update-initramfs -u -k 6.14.0-24-generic
% sudo update-grub
% sudo systemctl reboot
```



