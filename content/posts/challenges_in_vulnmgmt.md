---
title: "Challenges In Vulnerability Management"
date: 2022-04-28T09:07:45+08:00
tags: [ "vulnmgmt" ]
categories: [ "Posts"  ]
summary: "Vulnerability management faces challenges in both agent-based and network scan-based approaches"
draft: false
---
{{< lead >}}
*Vulnerability management faces challenges in both agent-based and network scan-based approaches.*

Here is a list of challenges in vulnerability management. And it will be updated from time-to-time.
{{< /lead >}}

These are the potential challenges in vulnerability management, categorized into agent-based and network scan-based approaches:

## Agent-based

 1. **Agent deployment:** Complexities in deploying agents across diverse environments pose challenges.
 1. **Agent management:** Ensuring continuous coverage and updates for agents across the network presents logistical hurdles.
 1. **Agent support and maintenance:** Manual intervention is required for agent troubleshooting or restarts in case of failures.
 1. **Unresponsive agent:** Requires manual login to server for restart.
 1. **Incompatibility:** Compatibility conflicts with existing software or security solutions may arise.
 1. **Increased attack surface:** Agents themselves can be vulnerable. Risks of agent evasion or tampering by malicious entities warrant attention.
 1. **Performance overhead:** Agents may impose resource overhead and performance impacts on endpoints.
 1. **Scalability challenges:** Managing and updating agents across large networks.
 1. **Privacy and compliancy:** Compliance considerations regarding data privacy and monitoring emerge with agent-based solutions.
 1. **Missing out of network vulnerabiltiy:** Most of the agents will not assess network-based and misconfiguration vulnerability, such as default password, weak cryptography in SSL or SSH.


## Network Scan 

 1. **Limited visibility:** Firewalls and network segmentation can restrict scan reach.
 1. **False positives:** Inaccurate identification of vulnerabilities (like backport) can consume resources for investigating on non-existent vulnerabilities.
 1. **Network congestion:** Scans can overload network resources and may disrupt scans or compromise data integrity.
 1. **Incomplete credential scan:** May miss vulnerabilities requiring privileged access or hinder comprehenive scans due to insufficient permissions.


## General

 1. **Incomplete asset inventory:** Inaccurate asset inventories can result in missed endpoints.
 1. **Prioritization:** Ineffective prioritization may delay critical patching.


