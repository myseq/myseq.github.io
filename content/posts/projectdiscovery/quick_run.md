---
title: "PD: Quick Run"
date: 2026-05-04T21:54:46+08:00
tags: [ "101", "projectdiscovery", "tools" ]
categories: [ "Posts"  ]
series: [ "Project_Discovery" ]
series_order: 2
summary: "Learn the PD suite quick."
draft: false
---
{{< lead >}}
*To learn the ProjectDiscovery (PD) suite, it is best to follow a "Recon-to-Vulnerability" workflow.*
{{< /lead >}}

Let's see how data flows from broad discovery to specific security findings.

> Use the PD's dedicated testing domain: **chaos.projectdiscovery.io**. 

## Phase 1: Discovery

 1. Finding the surface with: **Subfinder**

```console
% subfinder -d projectdiscovery.io -o subdomains.txt
```

 2. Finding the doors with: **Naabu**

```console
% naabu -list subdomains.txt -p 80,443,8080,8443 -o open_ports.txt
```

 3. Checking the services with: **HTTPX**

```console
% httpx -list open_ports.txt -title -tech-detect -status-code
```

 4. Scanning for vulnerabilities with: **Nuclei**

```console
% nuclei -ut
% nuclei -u https://testphp.vulnweb.com -severity low,medium,high,critical
```

---

## Phase 2: Chaining

Let's see the power of **chaining**.

The **true** strength of the PD suite is the `UNIX Philosophy`: 
**Standard Input (stdin)** and **Standard Output (stdout)**. 
We can *chain* the results of one tool directly into the next.

Here is a classic automation chain that goes from a domain name to a vulnerability report in one line:

```console
% subfinder -d projectdiscovery.io | httpx -silent | nuclei -t vulnerabilities/ -severity low,medium,high,critical
```

## Phase 3: Advanced Piping

Security assessment to local home lab network.

```console
% naabu -host 192.168.10.0/24 -top-ports 100 -silent | httpx -sc -title | nuclei -tags exposure,misconfig
```


## Common Tools

| Tool | Core Function | Input |
| :--- | :------------ | :---- |
| **Subfinder** | Find subdomains | Root domain (example.com) |
| **Naabu** | Port scanning | IP address or Subdomain |
| **HTTPX** | Service analysis | Open ports or URLs |
| **Nuclei** | Vulnerability scan | Live URLs |
| **Katana** | Web crawling | A single starting URL |
| **Dnsx** | DNS resolution | List of potential subdomains |

