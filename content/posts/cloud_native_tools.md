---
title: "Cloud Native Tools"
date: 2024-03-22T06:04:54+08:00
tags: [ "101", "cloud", "tools" ]
categories: [ "Posts"  ]
summary: "What are CSPM, CWPP, and CIEM?"
draft: false
---
{{< lead >}}
*The CNAPP is advantageous in a number of ways, with the key benefit of increasing Security Visibility to the cloud*.
{{< /lead >}}

## CNAPP

A Cloud-Native Application Protection Platform (CNAPP) provides a holistic view of cloud security risks in one platform. 

As noted, a CNAPP integrates multiple cloud security capabilities, including CWPP, CSPM and CIEM, even with Kubernetes Security Posture Management (KSPM), with compliance and cybersecurity risk management.

Besides, CNAPP could incorporate `shift-left` capabilities to identify risks in development lifecycle. 

With an agentless CNAPP deployed, the platform can address the cloud security gaps that traditional agent-based tools cannot.

Benefits of CNAPP include centralized management, enhanced visibility, improved security posture, and deeper insights into cloud environments.

*Let's explore the 3-key common components of cloud native tools under CNAPP platform*.

## Key Components

Cloud Workload Protection Platform - CWPP
: Protects workloads by detecting threats, managing vulnerabilities, and addressing security risks.

Cloud Security Posture Management - CSPM 
: Monitors cloud environments, manages configurations, and proactively applies controls for security and compliance.

Cloud Identity Entitlement Management - CIEM
: Manages identities, access rights, and permissions to mitigate excessive privileges and data breaches.

Kubernetes Security Posture Management - KSPM 
: Manages continuous monitoring (misconfiguration), assessing (image/host vulnerability, access control and identity management), and ensuring the security and compliance of Kubernetes environments.

### CSPM & CWPP

Here's the summary of CSPM and CWPP.

|  | CSPM | CWPP |
| --------: | ---: | ---: |
| Focus | Security posture & compliance of cloud infra | Protection of cloud workloads & applications | 
| Scope | Monitor configuration, identity & access, storage. | Protect VM, container, serverless workloads, code |
| Approach | Preventive & proactive | Reactive & protective | 

| Capability | CSPM | CWPP |
| :--------- | :--: | :--: |
| Monitor for misconfiguration & vulnerabilities | Yes | No | 
| Identifies compliance gaps | Yes | No |
| Provide risk assessment & visualization | Yes | No | 
| Integration into cloud provider API for visibility | Yes | No |
| Measureing the cloud infra and platform services | Yes | No |
| Protect against malware & intrusions | No | Yes | 
| Enable workload behavior analysis & anomaly detection | No | Yes |
| Runtime app security protection | No | Yes |
| Workload hardening and configuration | No | Yes | 
| Vulnerability Management | No | Yes | 
| Utilize agents for intra-workload | No | Yes | 


### Limitations

Disadvantages of CSPM & CWPP:

 - CSPM can only identify simple control plane misconfiguration.
 - Some CSPM could have limited insights to workload posture.
 - 

## Others 

Cloud Access Security Brokers - CASB
: Brokers each session between users and cloud service to enforce policy for enterprise, such as authentication, SSO, authorization, credential mapping, device profiling, encryption, logging, alerting, malware detection/prevention.

## Security Visibility

When come to the *cloud*, the key is ***Security Visibility***.

Here's the evolution of `security visibility`: starting from `agents`, then `scanners`, and `CSPM`.

|      | Agents | Scanners | CSPM |
| :--- | :----- | :------- | :--- |
| Scope | Host | Network | Cloud |
| Focus | Full visibility to OS, Apps & Data | Scan apps & network | Examine cloud metadata |
| Looking for | Rogue activity | Improper response | Deviations and misconfiguration |

## Typical Tests

CSPM Tests

 - Storage bucket permissions
 - Network configuration
 - IAM hygiene, `root` usage, password policy, etc
 - User & API logging settings and permissions

CWPP Tests (Agent-based)

 - Software vulnerabilities
 - Malware detection/prevention
 - OS & software patch status
 - Misplaced keys or sensitive data

## What Next?

>  CNAPP = CIEM + KSPM + CSPM + CWPP

## Links 

 - [Kubernetes Security Posture Management (KSPM) Explain](https://www.wiz.io/academy/kubernetes-security-posture-management-kspm)



