+++
title =  "Infrastructure-as-Code (IaC)"
date = 2022-10-26T22:11:08+08:00
author = "zd"
tags = [ "iac", "devops", "gitops" ]
categories = [ "Blogger" ]
summary = "How to move from Operations to GitOps?"
draft = false
+++

After the post on [Operation Hates Agile](https://myseq.blogspot.com/2022/10/operation-hates-agile.html), here comes to the next, how to move from Operations to GitOps.

## Moving to GitOps

Infrastructure-as-Code, or `IaC`, is replacing the traditional operation. It allows enterprise to control changes and manage the configuration settings in cloud environment more efficiently.

First, we need to know what contained inside `IaC`. There are 3 characteristics in `IaC`:

  1. Imperative and Declarative
  2. Mutable and Immutable
  3. DevOps


## Imperative Vs. Declarative

When working with `Infrastructure as Code (IaC)`, we can use two different approaches to make changes to cloud environments: **declarative and imperative automation**.

**Imperative automation** involves using a command line interface (CLI) to create a script that specifies the changes to be made in a container, virtual machine, or virtual private cloud. However, this process can be time-consuming if changes need to be made to multiple VM.

**Declarative automation**, on the other hand, involves simply stating your desired infrastructure state, such as a VM with a domain attached, and letting the automation tools take care of the configuration process. This approach is often easier to communicate and streamlines the process of configuring infrastructure.

## Mutable Vs. Immutable

Infrastructure can be categorized into two types: **mutable and immutable**.

**Mutable infrastructure**, like a virtual machine, can be changed after it's deployed. On the other hand, immutable infrastructure, like a container, cannot be changed once it's deployed. Changes are made to the original image and declarative statements, ensuring consistent changes across like devices.

However, when we use both imperative and declarative automation methods interchangeably to manage IaC, it can lead to a problem called *Configuration Drift*. Configuration Drift occurs when mutable infrastructure is changed, causing it to become out of sync with the rest of the infrastructure.

To maintain security, it's important to have consistent application of configurations across the infrastructure. This is because even one small opening can give hackers a way in. Consistency complicates matters for the hacker, making it more difficult to exploit vulnerabilities in the infrastructure.

## DevOps Practices (GitOps)

For smoother and quicker deployment of network and virtual machine configurations, it's important to use a *controlled system*. Developers can then request containers or virtual machines through an automated request, ensuring the same level of stability as code. This leads to better versioning that's easier to trace.

This approach is called ***GitOps***, and it enables us to provision infrastructure with *full automation* and *version control*, similar to *DevOps*.

>
> The world is changing so fast. Big will not beat small anymore. *It will be the fast beating the slow.*
>

