---
title: "Linux Container (LXC)"
date: 2026-04-12T14:43:13+08:00
tags: [ "101", "lxc", "proxmox" ]
categories: [ "Posts"  ]
summary: "Explore to the LXC for efficiency and smart cloning."
draft: false
---
{{< lead >}}
*You need to master Linux Containers (LXC) for creating gold image and cloning.*
{{< /lead >}}

If you are like me, who keep looking for the most efficient way to run services on your home server, **Linux Containers (LXC)** are the answer.

Unlike heavy Virtual Machines, LXC offers a "lightweight" approach to virtualization that saves CPU and RAM for what actually matters.

## What is LXC?

An LXC is a "chroot on steroids." 
While a Virtual Machine (VM) emulates a whole set of hardware, kernel, and OS, an LXC shares the **Host's Kernel** but keeps the application environment isolated.

### Key Advantages
 1.  **Near-Zero Overhead:** Uses almost the same resources as a native app.
 1.  **Instant Boot:** Most containers boot in under 5 seconds.
 1.  **Density:** Run dozens of containers on a Mini-PC where you might only manage 2 or 3 Windows VMs.

> Can see the [comparison table](/posts/modern_infra1/#comparison-table) in modern infrastructure post.

---

## Gold-Image

Once you have perfectly configured a container, you can **Convert to Template**.
This turns it into a read-only "Golden Image" used for cloning later.

### Cloning

While making a clone, we have the option to choose between: **Linked Clone** vs. **Full Clone**


**Linked Clone:** A "read-only" link back to your template.

 * **Pros:** Instant creation and uses **virtually zero space** initially.
 * **Cons:** Dependent on the template. If you delete the original, the clone breaks.

**Full Clone:** A complete, byte-for-byte copy.

 * **Pros:** 100% independent. You can delete the template or move the clone easily.
 * **Cons:** Takes up the **full disk space** and takes longer to create.

{{< alert icon="fire" >}}
**Storage Note:** LXC Downloadable Templates live in `local`, while **Converted Templates** live in `local-lvm` as read-only block devices.
{{< /alert  >}}


