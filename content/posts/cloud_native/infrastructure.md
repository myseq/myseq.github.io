---
title: "Cloud-Native Infrastructure"
date: 2026-05-06T09:48:08+08:00
tags: [ "101", "cloud" ]
categories: [ "Posts"  ]
series: [ "Cloud_Native" ]
series_order: 1
summary: "Aka Containerized Infrastructure."
draft: false
---
{{< lead >}}
*Infrastructure involving Kubernetes (K8s) and Docker is primarily referred to as a Containerized Infrastructure or a Cloud-Native Infrastructure.*

*Together, they form a complete system for managing applications through Container Orchestration.*
{{< /lead >}}

## Docker

This is known as the *containerization platform*.
It is a layer used for *building and packaging* **application** into portable units called ***containers***.

Then, **Docker** provides the **container runtime** (or engine) that actually executes the applicaiton code on individual servers.

## Kubernetes (k8s)

This is known as the *container orchestration platform*.
It is the management layer that runs on top of the container runtime.

It organizes multiple servers into a **Kubernetes cluster**.
This is where it *automates* the deployment, *scaling*, and *networking* of containers across that cluster.

## Key Components

A few key components of the infrastructure.

 1. **Nodes**

    - Individual machines that make up the infrastructure.
    - These are divided into **Control Plane** (managing cluster) and **Worker Nodes** (running containers).

 1. **Pods**

    - Smallest deployable units in k8s cluster, which can contain 1 or more containers.

 1. **Container Registry**

    - A storage system (like Docker Hub) where container images are kept before being pulled by k8s.



