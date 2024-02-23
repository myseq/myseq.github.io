---
title: "Cloud Flight Simulator"
date: 2024-02-21T18:17:58+08:00
tags: [ "cloud", "iac", "sans", "workshop", "devsecops" ]
categories: [ "Posts", "YT"  ]
summary: "Cloud Flight Simulator workshops from SANS."
draft: false
---
{{< lead >}}
*Navigate ***DevSecOps*** and automation with all new cloud native security content and labs via browser-based SANS Cloud Flight Simulator.*
{{< /lead >}}

## SEC540

SANS SEC540 provides security professionals with the knowledge to automate guardrails and security policies in their DevOps pipelines, cloud infrastructure, container orchestrators, and microservice environments. 
The aims is to help everyone:
 - To embrace the DevOps culture.
 - Be equipped with cutting-edge tools and concepts to combat modern threats in Cloud and DevOps security.

## Cloud Flight Simulator

Cloud Flight Simulator, is a new set of tools introduced in SEC540 course.
Student no longer need to run a VMware virtual machine locally or bring their own AWS /Azure cloud accounts.

Explore the rest of the Cloud Flight Simulator Series:

Part 1
: GitLab CI, Workflows, and Secrets

Part 2
: Protecting Kubernetes Clusters with Admission

Part 3
: Safeguarding the Software Supply Chain

Part 4
: Least Privileged Pods with Kubernetes Workloads

> *As a student of SEC540, I love the CFS very much.
> It creates a more immersive, clean, and realistic lab environment for learning.*

Below are some of my notes after finishing the workshops.

## Part 1

> Date: Thu Jan 04 2024 (updated on Feb 4, 2024)

In part 1, Eric has shared the topic on Continuous Integration (CI) with GitLab. 
He also demo the JWT Integration in GitLab CI workflow with OpenID Connect (OIDC).

 - Understand and compare the different CI tools: cloud-based, on-prem, on-prem (opensource), cloud native.
 - GitLab's OpenID Connect (OIDC).

{{< youtube id="3SV9v49UKH0" title="Cloud Flight Simulator Part 1" >}}

## Part 2

> Date: Thu Jan 18 2024 (updated on Feb 14, 2024)

Kubernetes admission controllers play a critical role in enhancing the security of a Kubernetes cluster. 
They act as gatekeepers, intercepting requests to the Kubernetes API server before requests are processed and stored by the cluster.

In part 2, Ben talks about how to secure a Kubernetes Clousters with Admission controllers.
In his talk, he covers:

 - K8s overview
 - K8s cluster components
 - Admission Control Data Flow including built-in, and dynamic admission controllers.
 - Open Policy Agent

{{< youtube id="VnEJf_2leZs" title="Cloud Flight Simulator Part 2" >}}

## Part 3

> Date: Thu Feb 01 2024 (updated on Feb 21, 2024)

Enrich software development practices provides better assurance regarding the software development and creation of artifacts. 
Popular techniques inlcude: Artifact Provenance, Signatures, and Software Bill of Materials (SBOM).

Other interesting topics in Software Supply Chain Security Hierarchy include: the policy and insight, the aggregation and synthesis (GUAC), the software attestations (SLSA), and the trust foundation (SigStore).

In part 3 of CFS sharing, safeguarding the software supply chain, Jon talks about:

 - The Supply Chain Security eco-system in modern software development.
 - The software Supply Chain Security issues:
   - Source Threats: unauthorized change, compromise source repo, modified source. 
   - Depdendency Threats: compromised depdencencies.
   - Build Threats: compromise build process, modified package, compromise package.
 - What is Software Provenance (DSSE envelope) ?
 - Supply-chain Levels for Software Artifacts (SLSA) and SBOM.
 - Demo 3 SBOM formats: cyclonedx, SPFX (ISO/Linux foundation), SYFT.
 - The OpenVEX (Vulnerability Exploitability Exchange) Vs CycloneDX.
 - The Day-2 challenges and techniques in Supply Chain Security
 - OSCAL - Open Security Controls Assessment Language (NIST project)
   - Kubernetes Governance, Risk and Compliance 

{{< youtube id="MMKSJxO1Opk" title="Cloud Flight Simulator Part 3" >}}

## Part 4

> Date: Thu Feb 15 2024 (updated on Feb 26, 2024)

This is about leveraging least privileged pod with Kubernetes Workloads.

Rather than issuing long-lived credentials to individual pods or inheriting excessive permissions from the node, Kubernetes service accounts can use an internal OpenID Connect (OIDC) provider to obtain a signed identity token (JWT). 
Then, cloud administrators can configure their identity services (IAM, Entra ID) to trust the Kubernetes cluster's OpenID Connect provider and grant the service account to obtain temporary, least privilege credentials.

In the final part of CFS, Eric will show how to enable workload identity for AWS Elastic Kubernetes Service (EKS) and Azure Kubernetes Service (AKS).

 - Kubernetes Managed Services
 - Kubernetes Workload Identity Options
 - Anti-pattern: Long-lived credentials, and inherit node permissions
   - Bash history, config files, source codes, version controls, k8s secrets, env var.
   - access to IMDS for secrets keys.
 - Kubernetest Workload Identity (OIDC)
   - manage default permissions (minimal)
   - specific service account
   - role bindings.
   - (EKS) using IAM Roles for Service Accounts (IRSA)
 - EKS pod identity (agent)
   - specific to AWS only
   - no config change at K8s


{{< youtube id="JRpJfe8Fak8" title="Cloud Flight Simulator Part 4" >}}

## Links 

 - SANS [SEC540: Cloud Security and DevSecOps Automation](https://www.sans.org/cyber-security-courses/cloud-security-devsecops-automation/)
 - [What is the SANS Cloud Flight Simulator](https://www.sans.org/blog/sans-cloud-flight-simulator-sec540/)?
   - [Cloud Flight Simulator part 1](https://www.youtube.com/watch?v=3SV9v49UKH0)
   - [Cloud Flight Simulator part 2](https://www.youtube.com/watch?v=VnEJf_2leZs)
   - [Cloud Flight Simulator part 3](https://www.youtube.com/watch?v=MMKSJxO1Opk)
   - [Cloud Flight Simulator part 4](https://www.youtube.com/watch?v=JRpJfe8Fak8)

 - Software Supply Chain resources:
   - [Kubernetest Governance, Risk, and Compliance](https://github.com/kubernetes/sig-security/blob/main/sig-security-docs/papers/policy_grc/Kubernetes_Policy_WG_Paper_v1_101123.pdf)
   - [Software Supply Chain Best Practices](https://github.com/cncf/tag-security/blob/main/supply-chain-security/supply-chain-security-paper/CNCF_SSCP_v1.pdf) by [CNCF](https://github.com/cncf/tag-security)
   - [The Secure Software Factory](https://github.com/cncf/tag-security/blob/main/supply-chain-security/secure-software-factory/Secure_Software_Factory_Whitepaper.pdf) by [CNCF](https://github.com/cncf/tag-security)

 - Kubernetes Workload Identity [presentation/workshops](https://github.com/pumasecurity/nymeria)
   - AWS Identity Provider, MS Workload Identity Federation, Google Workload Identity Federation. 

 - Audit scripts:
   - [JWT Decode Shortcuts](https://gist.github.com/ejohn20/6e228c5bac42f314705ff9b619882599)
   - [az-aks-audit-workload-identity.sh](https://gist.github.com/ejohn20/ba958b7c66a0441b05487a393d7743b61)
   - [aws-eks-irsa-pods-audit.sh](https://gist.github.com/ejohn20/928c6de2fa7659062c8299f49c6b6884)
   - [aws-eks-audit-pod-identity-pods.sh](https://gist.github.com/ejohn20/212ef7ea95d6dd92bda8b77e8b3b3881)





