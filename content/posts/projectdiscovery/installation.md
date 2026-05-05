---
title: "PD: Installation"
date: 2026-05-01T21:54:46+08:00
tags: [ "101", "projectdiscovery" ]
categories: [ "Posts"  ]
series: [ "Project_Discovery" ]
series_order: 1
summary: "An opensource solution for ASM and vulnerability scanning."
draft: false
---
{{< lead >}}
*ProjectDiscovery (PD) is a solution for* ***attack surface management (ASM) and vulnerability scanning*** *by open-source community*.
{{< /lead >}}

PD follows *UNIX philosophy*: creating small, fast, and modular tools that do one thing exceptionally well and can be piped together into automated workflows.

There are 3 core pillars in PD:

 1. **Asset Discovery & Reconnaissance**: To find everything a company owns on Internet. Tools used: *Subfinder, HTTPX, Naabu*.

 1. **Vulnerability Scanning**: To uncover and validate vulnerabilities including "zero-day". Tools used: *Nuclei, Cent*.

 1. **Cloud & Infrastructure**: To fetch assets from cloud providers using API keys. Tool used: *Cloudlist*.

Most tools in PD are written in **Go** and designed to handle massive scale.
And all tools in PD support *JSON output* and *stdin/stdout*.
This simplify the effort to *chain* them together in BASH scripting or running at *cmdline*.

A typical security engineer can use PD tools to find all subdomains (`subfinder`),
to see which ports (`naabu`) are open on those subdomains,
to identify (`https`) any web server including what technology used,
and to scan (`nuclei`) for know vulnerabilities or misconfigurations.

## Prerequisites

The most efficient way to manage the ProjectDiscovery suite is through their official *ProjectDiscovery Tool Manager (pdtm)*.

And all PD tools require **Go** (Golang) version 1.21 or higher to run.

```console
% sudo apt update && sudo apt upgrade -y
% wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz
% sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz
% echo 'export PATH=$PATH:/usr/local/go/bin:$(go env GOPATH)/bin' >> ~/.zshrc
% source ~/.zshrc
```

> Verify with: `go version`

## Installation: PDTM

Install `pdtm` using **Go**.

```console
% go install -v github.com/projectdiscovery/pdtm/cmd/pdtm@latest
```

> Verify with: `pdtm -version`

## Installation: Tools

Use `pdtm` to download and install all the binaries.

```console
% pdtm -ia
```

> All tools are install in `~/.pdtm/go/bin/`. 
> Add this to PATH.

```console
% echo 'export PATH=$PATH:$HOME/.pdtm/go/bin' >> ~/.zshrc
% source ~/.zshrc
```

> Verify the installation: `subfinder -h`, `httpx -version`, `nuclei -version`

> To keep all tools fresh, just run: `pdtm -ua`

## Links 

 - GitHub: [ProjectDiscovery](https://github.com/projectdiscovery)
 - Learn about ProjectDiscovery's [Open Source Tools](https://docs.projectdiscovery.io/opensource/index)


