---
title: "Docker 101"
date: 2023-10-08T22:00:59+08:00
tags:  [ "101", "docker" ]
categories:  [ "Posts" ]
summary: "Let's learn about Docker architecture and its alternatives."
draft: false
---

Let's see what does Docker mean for us today?

## Today's Docker

Docker used to be proprietary technology. But it has increasingly embrace **open standard**, called OCI. 
This openness has paved tha way for more tools created in Docker space, as long as the tools are adhere to the OCI standard.

With OCI standardization, the *original Docker engine is now replaceable*.

Let's quickly learn the basic architecture of Docker.

## Architecture

Docker has 3 primary components. 
 - Docker client
 - Docker daemon
 - Docker registry

`Docker client` is the primary interface for interacting with Docker. 
It communicates with the Docker daemon to manage Docker objects (within), including images and runtime containers.

The second component is `Docker daemon`. 
It resides in a system called Docker host, that running the Docker software.
It is the core engine that manages the container operations (build, run, stop) and images stored at registries.
Note that, the Docker daemon can utilize the OCI compliant run-times, like cri-o and LXC, for running containers.

The third compoenent is `Docker registry`.
The most commonly used is Docker registry called Docker Hub.
Docker Hub stores and distributes container images.

{{< mermaid >}}
graph TD;
    D1{{Docker CLI}}
    D2{{Docker Daemon}}
    D3{{Docker Registry}}
    D21([Containers])
    D22([Images])
    D31([docker hub])

    subgraph Arch[ ]

      subgraph aa[Docker Architecture]
      end

      D1 -->|REST API| g2;
      D2 -->|manage| D22;
      D2 -->|build, run, manage| D21;
      D22 -->|push/upload| D31;
      D31 -->|pull/download| D22;

      subgraph g1[Docker Client]
        D1
      end

      subgraph g2[Docker Host]
        D2
        D21
        D22
      end
      
      subgraph g3[Docker Registry]
        D3
        D31
      end

    end

    linkStyle default stroke: #8080FF
    classDef title font-size:28px,color:#000000,fill:#FFBF00
    classDef subtitle font-size:14px,color:#8080FF,fill:#FFBF00
    class g1,g2,g3 subtitle
    class Arch title
    class aa title

{{< /mermaid >}}

## Open Container Initiative (OCI)

OCI standardize container runtime, image, distribution.
It is an **open standard** to ensure the container ecosystem remains open and not tied to a single vendor.

{{< mermaid >}}
graph TD;
    P0[ OCI Standard ]
    C1{{runtime-spec}}
    C2{{image-spec}}
    C3{{distribution-spec}}

      P0 --> C1;
      P0 --> C2;
      P0 --> C3;

    subgraph main[OCI]
      P0
      C1
      C2
      C3
    end

    linkStyle default stroke: #8080FF
    classDef main font-size:28px,color:#FFBF00,fill:#FFBF00
    class main main

{{< /mermaid >}}

<style>
#L-P0-C1-0 .arrowheadPath { fill:red !important; }
#L-P0-C2-0 .arrowheadPath { fill:red !important; }
#L-P0-C3-0 .arrowheadPath { fill:red !important; }
</style>


## Docker Vs OCI

Docker has popularized several key concept in containerization:
 1. Standardize image format.
 2. Streamline the building of container images.
 3. Enabling the sharing of images through Registries.
 4. Facilitate the actual running of containers.


With OCI standardizing container technologies, new tools are built to deliver speed and efficiency.


### Alternatives to Docker Components

Here are some alternatives to standard Docker components.

| Docker | Alternatives |
| ------ | ------------ |
| Docker Client | <mark>docker cli</mark><br>Podman |
| Docker Daemon | <mark>docker runtime</mark><br>LXC<br>containerD<br>BuildKit<br>ZeroVM |
| Docker Registry | <mark>docker hub</mark><br>Amazon Elastic Container<br>Azure Container Registry<br>Google Container Registry<br>Sandboxie<br>Red Hat Quay<br>Harbor<br>ZooKeeper |


