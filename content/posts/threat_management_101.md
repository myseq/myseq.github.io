+++
title =  "SimplifyCybersecurity: Threat Management"
date = 2023-09-15T07:22:05+08:00
author = "zd"
tags = [ "strategy", "threatmgmt"]
categories = [ "Posts", "Simplify" ]
summary = "Explain Threat Management in 2 min."
draft = false
+++

## What is Threat Management?

> *Risk management is a process to build a strategy to **measure cybersecurity risk**.*

***Threat Management*** is a process to build the strategy (using framework) to *prevent cyberattacks*. Just like *risk management*, it is also an essential part of Cybersecurity strategy. 

> The most common framework used nowadays is using **NIST Cybersecurity Framework**. It contains the 5 primary functions: 
>  1. Identify
>  2. Protect
>  3. Detect
>  4. Respond *
>  5. Recover

***Threat Management*** can be very useful to help CISO to plan and prioritize (budgetting) what tools should be deployed whenever a new infrastructure is needed. For example, if a company wish to transform to start using container and cloud for hosting the application. Then we can start creating threat management for container and cloud.

Threat Management can be a powerful tool for Cybersecurity team. It helps cyber team to build threat management for different infra, such as on-prem infra, cloud infra, or even webapp system. And it can always be re-used for any at newly proposed/plan web application that hosting at ISP. 


### Example 1: Threat Management for Container Security

Here, I'll demo how threat management (simplified version) can be built for container security.

| Threat/Attacks | Detection/Discover | Mitigation (rebuild image) |
| ------ | ------------------ | ---------- |
| Badly built container images | - Static analysis tools (CI/CD)<br> - vuln scanner (remote) | Patch base image |
| Vulnerable Apps | - SAST (local)<br> - DAST/WebApp scan (remote) | Update codes |
| Supply chain | - SBOM<br> - vuln scanner * | Patch base image |
| Badly configured container | - Static analysis tools (CI/CD) | Re-configure container |
| Vulnerable hosts | - vuln scanner (remote) | Patch the hosts |
| Exposed secrets | - Static analysis tools (CI/CD) | Re-configure container | 
| Container escape |  | Security Hardening |

In real life, it can go deeper by exploring into different tools for identify/protect/detect/respond/recover. It also can go multi-layer of discover and protection to ensure defense-in-depth strategy is being applied too. 

## Links
 - NIST [Cybersecurity Framework (CSF)](https://www.nist.gov/cyberframework)

