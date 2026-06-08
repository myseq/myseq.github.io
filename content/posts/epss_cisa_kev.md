---
title: "EPSS vs CISA KEV"
date: 2025-08-13T15:08:20+08:00
tags: [ "cisa", "epss", "kev", "strategy", "vulnmgmt"]
categories: [ "Posts"  ]
summary: "Integrating EPSS And CISA KEV as part of security strategy."
draft: false
---
{{< lead >}}
*When it comes to managing software vulnerabilities, CISA KEV serves as a reactive "emergency alarm," whereas EPSS acts as a forward-looking "weather forecast".*
{{< /lead >}}

We've created a [series of CISA KEV](/series/cisa_kev/) posts before. 
And we also show how can we identify the trends of vulnerabilities being released with CISA KEV.

{{< article link="/posts/cisa_kev_distribution/" >}}

Here, I'm going to provide a quick comparison between **EPSS and CISA KEV**.
And how can we use them together as part of our vulnerability management strategy.

First, **CISA KEV** provides ground-truth confirmation of vulnerabilities actively exploited in the wild.
And **EPSS** provides a statistical prediction of how likely a vulnerability is to be exploited within the next 30 days. 

**KEV**
: Known Exploited Vulnerabilities

**EPSS**
: Exploit Prediction Scoring System

## Understanding CISA KEV

The CISA KEV Catalog is a strictly curated list of vulnerabilities with documented, real-world evidence of successful malicious use. 

For a Common Vulnerabilities and Exposures (CVE) ID to be added to KEV catalog, it must meet three specific criteria: 

 - it must have a CVE ID;
 - there must be clear evidence of active exploitation; 
 - and a **clear mitigation or patch must exist**. 

It acts as a mandatory baseline for U.S. Federal Agencies.
But it has become an industry standard for private enterprise patch management.


## Understanding EPSS

The **FIRST EPSS** Model uses threat intelligence data and machine learning to produce a daily probability score for a given CVE. 
The system evaluates the near-term risk based on technical attributes, code availability, and multi-vendor sensor data.

 - **EPSS Score**: The probability (from 0% to 100%) that a vulnerability will face an exploit attempt within the upcoming 30 days.
 - **EPSS Percentile**: Measures how the risk of a specific CVE ranks against all other tracked vulnerabilities.

{{< alert >}}
**Example:** *A 95th percentile score means it is more likely to be exploited than 95% of all other CVEs.*
{{< /alert >}}


## Key Differences

| Feature | CISA KEV | EPSS |
| :------ | :------- | :--- |
| Primary purpose | Confirms what is currently or has been exploited. | Predicts what is likely to be exploited soon. |
| Output Type | Binary (Yes, it's on the list / No, it's not). | Continuous score (0.0 to 1.0) and a percentile. |
| Data Nature | Definitive historical facts and ground-truth. | Probability based on Machine Learning (ML). |
| Update Frequency | Ad-hoc (whenever CISA confirms a new exploit). | Daily. |
| Authority | Maintained by the [U.S. CISA][cisa_kev]. | Maintained by [FIRST.org][first]. |
| Core Weakness | Reactive; missing lesser-known or targeted zero-days. | Can suffer from false positives or delayed data loops. |

## Combine Them in Practice

Relying solely on CVSS severity creates a massive backlog of "critical" flags. 
Security teams can significantly shrink their patching workload by establishing a **multi-layered triage model**. 

```
  [ All Ingested Vulnerabilities ]
                 │
                 ▼
       Is it on CISA KEV? ──────( Yes )─────► [ IMMEDIATE REMEDIATION ]
                 │                              (SLA: 24 to 72 Hours)
               ( No )
                 │
                 ▼
     Is EPSS > 95th Percentile? ──( Yes )───► [ HIGH PRIORITY PATCHING ]
                 │                              (SLA: Standard Cycle)
               ( No )
                 │
                 ▼
       [ Standard Backlog ]
```

 1. **Check CISA KEV First**: If a vulnerability is on the CISA KEV list, drop everything and remediate it according to strict Service Level Agreements (SLAs), regardless of what the CVSS or EPSS scores say.

 1. **Layer EPSS Over the Rest**: 
     - For vulnerabilities not listed on KEV, look at the daily EPSS metrics. 
     - If a CVE has an EPSS percentile above 95%, prioritize it next. 
     - This catches high-probability target paths before they reach the stage of a widespread, confirmed KEV alert.

 1. **Deprioritize Low-Probability Risks**: Vulnerabilities that possess high technical severity (CVSS) but feature very low EPSS scores and no KEV listing can safely be deferred to standard maintenance cycles, freeing up critical engineering resources.

[cisa_kev]: https://www.cisa.gov/known-exploited-vulnerabilities-catalog
[first]: https://www.first.org/epss/

