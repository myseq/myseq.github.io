---
title: "Modern Infrastructure"
date: 2026-01-10T07:36:24+08:00
tags: [ "proxmox", "lxc", "docker" ]
categories: [ "Posts"  ]
summary: "Should I use VMs, LXC, or Docker?"
draft: false
---
{{< lead >}}
Proxmox supports 3 types of modern infrastructure: **Virtual Machine (VM), Linux Container (LXC) and Docker**.
{{< /lead >}}

*A Practical Guide for Modern Infrastructure*

When building infrastructure, one question always comes up:

> **Should I use VMs, LXC, or Docker?**

Actually, all three solve different problems.
They are **not competitors**.  
They are **tools at different layers**.

This post explains each option clearly and shows **when to use what**.

## The Big Picture

Before details, here is the one‑line summary:

*   **VM** → A full virtual computer
*   **LXC** → A lightweight Linux server
*   **Docker** → A packaged application

***

## 1. Virtual Machine (VM)

**What it is**

A **virtual computer** with its own operating system.

**How it works**

*   Hardware is virtualized by a hypervisor.
*   Each VM runs a full OS kernel.
*   Examples: KVM, VMware, Hyper‑V.

**Strengths**

*   Strong isolation
*   High security boundary
*   Can run different OS types (Linux, Windows)

**Weaknesses**

*   High CPU and memory usage
*   Slow boot time
*   More patching and maintenance

**Best use cases**

*   Production workloads
*   Security‑sensitive systems
*   Mixed OS environments

***

## 2. LXC (Linux Containers)

**What it is**

**OS‑level virtualization** that feels like a VM.

**How it works**

*   Containers share the host Linux kernel.
*   Each container has its own filesystem, users, and processes.
*   Common in Proxmox environments.

**Strengths**

*   Very low overhead
*   Fast boot
*   Looks and behaves like a real server

**Weaknesses**

*   Linux only
*   Weaker isolation than VM
*   Kernel issues affect all containers

**Best use cases**

*   Homelabs
*   Internal services
*   Long‑running workloads
*   VM‑like environments with low cost

***

## 3. Docker (Application Containers)

**What it is**

An **application packaging format**.

**How it works**

*   One main app per container
*   Only app and dependencies are included
*   Uses images and layers

**Strengths**

*   Extremely lightweight
*   Fast deployment
*   Easy rollback and replacement
*   Strong ecosystem

**Weaknesses**

*   Not designed as a “server”
*   Containers are disposable by design
*   Needs external tools for orchestration

**Best use cases**

*   Microservices
*   CI/CD pipelines
*   Short‑lived or scalable workloads

***

## Comparison Table

| Feature      | VM       | LXC            | Docker       |
| ------------ | -------- | -------------- | ------------ |
| Virtualizes  | Hardware | OS environment | Application  |
| Isolation    | Strong   | Medium         | Medium       |
| Resource use | High     | Low            | Very low     |
| Boot time    | Slow     | Fast           | Near instant |
| OS support   | Any OS   | Linux only     | Linux only   |
| VM‑like feel | Yes      | Yes            | No           |
| App‑centric  | No       | No             | Yes          |

***

## ASCII Architecture Diagram

```
                    Physical Machine
              ┌─────────────────────────┐
              │      CPU / RAM / Disk   │
              └────────────┬────────────┘
                           │
            ┌──────────────┴──────────────┐
            │         Host OS             │
            └──────────────┬──────────────┘
                           │
         ┌─────────────────┼─────────────────┐
         │                 │                 │

       VM STACK         LXC STACK         DOCKER STACK
     ───────────      ───────────       ────────────
     ┌─────────┐      ┌─────────┐       ┌──────────┐
     │ App     │      │ App     │       │ App      │
     ├─────────┤      ├─────────┤       ├──────────┤
     │ GuestOS │      │ Users   │       │ Runtime  │
     ├─────────┤      ├─────────┤       ├──────────┤
     │ Hyper   │      │ Kernel  │       │ Kernel   │
     └─────────┘      └─────────┘       └──────────┘
```

**Reading tip**

*   VM duplicates the OS.
*   LXC shares the kernel.
*   Docker strips everything down to the app.

***

## Simple Mental Model

*   **VM**: “I need a full machine”
*   **LXC**: “I need a lightweight server”
*   **Docker**: “I need to ship an application”

***

## Practical Recommendation

Use **more than one**.

A common real‑world pattern:

*   **VM** for strong isolation and OS separation
*   **LXC** for infrastructure services
*   **Docker** for applications

***

## Final Thought

Choosing the wrong abstraction causes pain.

Choosing the **right layer** makes systems:

*   Easier to maintain
*   Easier to automate
*   Easier to replace

> **Design for replacement, not repair.**

