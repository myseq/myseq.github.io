---
title: "Azure Linux"
date: 2024-10-31T16:16:55+08:00
tags: [ "azure", "linux" ]
categories: [ "Posts"  ]
summary: "An internal Linux distribution for Microsoft's cloud infrastructure and edge products/services."
draft: false
---
{{< lead >}}
*Azure Linux is available as an ISO file that makes it easy to install at cloud, in a VM, or in home lab.*
{{< /lead >}}

Microsoft Azure Linux 3.0 has been released recently.

It is a Linux distribution for Microsoft's cloud infra and edge. 
It is designed to provide a consistent platform to allow Microsoft to stay current on Linux updates.

`Azure Linux` has been engineered with a small common set of packages to address the universal needs of first party cloud and edge services.
However, any individual can layer additional packages on top of the common core packages and produce images for their workloads.

> Azure Linux is designed to consumes limited disk and memory resources.

With its lighweight characteristics, Azure Linux provides faster boot times and a minimal attack surface.
And this makes it suitable to be deployed as a container or a container host.

> This could be a great choice of Linux distribution for enterprise who intend to create custom Linux distribution.

{{< youtube id="UsQNOUnmKRM" title="Microsoft Linux 3.0 is Out - Is it Good for a Home Lab?" >}}

  - GitHub [Azure Linux](https://github.com/microsoft/azurelinux)
  - Direct download [Azure Linux 3.0 x86_64 ISO](https://aka.ms/azurelinux-3.0-x86_64.iso).
  - [Quickstart instructions](https://github.com/microsoft/azurelinux/blob/3.0/toolkit/docs/quick_start/quickstart.md)

