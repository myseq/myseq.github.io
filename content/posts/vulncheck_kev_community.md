---
title: "VulnCheck KEV Community"
date: 2024-03-17T14:59:30+08:00
tags: [ "kev", "python", "tools", "vulncheck", "threatmgmt", "vulnmgmt" ]
categories: [ "Posts"  ]
summary: "Introducing the VulnCheck Known Exploited Vulnerabilities (KEV) catalog, a free community database of known exploited vulnerabilities fused with exploit intelligence."
draft: false
---
{{< lead >}}
VulnCheck’s KEV catalog equips vulnerability management teams and cybersecurity professionals with faster, broader coverage in an efficient machine-readable dataset needed for detection, prioritization, and remediation.
{{< /lead >}}

Staying ahead of cyber threats requires constant vigilance, especially when it comes to exploited vulnerabilities. 

VulnCheck KEV steps up as a next-generation solution, empowering security teams to proactively manage vulnerabilities and prioritize remediation efforts.

## VulnCheck KEV
This robust platform offers the largest real-time collection of known exploited vulnerabilities (KEVs).  
By incorporating data beyond what CISA KEV provides, VulnCheck KEV equips you with a more comprehensive threat landscape.

| Feature | CISA KEV | VulnCheck KEV |
| :------ | :------- | :------------ |
| Scope   | Curated list of confirmed KEVs | Broader scope including CISA KEV and additional reported KEVs (~80% more) |
| Timelines | Updates may lag behind real-time threats | Aims for earlier warnings, potentially identifying threats 27 days before CISA | 
| Additional Info | Basic vulnerability information | Enriched data with eploit references and context for better decision-making | 

### Clear Advantages

With its focus on real-time threat intelligence and actionable data, VulnCheck KEV empowers security teams to:

 - Prioritize vulnerabilities based on a more complete picture of the threat landscape.
 - Respond faster to emerging threats with earlier warnings.
 - Minimize exposure by focusing resources on vulnerabilities with readily available exploit information.

> With VulnCheck KEV, it allows us to ***embrace proactive Vulnerability Management***

> VulnCheck KEV goes beyond basic vulnerability management.
> It's a powerful tool designed to help Cybersecurity professional stay ahead of attackers and safeguard our system.


## Vendor Intro/Update 

*Feb 29, 2024*:

{{< youtube id="gutmd_AXhws" title="VulnCheck KEV Community Intro" >}}

*Mar 08, 2024*:

{{< youtube id="GDQ7Uwp86uw" title="VulnCheck Known Exploited Vulnerabilties - Community Update" >}}

## Tool: vcheck-cli

`vcheck-cli` is a small tool written by me over the weekend.

It can:
 
 - Download the VulnCheck KEV as zip file.
 - Extract the JSON into a Python list.
 - Search CVE within VulnCheck KEV.
 - Show info such as ransomeware campaign, exploit database, exploit count, and CISA KEV status.

Below is the screenshot:

|![vcheck-cli](/images/vcheck-cli.png)|
| :--: |
| **vcheck-cli** : *./main.py -ve  CVE-2021-27102 cve-2019-12985 2024-1709* |

> As of today, the JSON file from VulnCheck KEV contains `2044` CVEs (compare CISA's `1089`).

## Links

 - [VulnCheck KEV Catalog](https://vulncheck.com/browse/kev)
 - VulnCheck's [API Documentation](https://docs.vulncheck.com/)
   - [API/Schema](https://docs.vulncheck.com/community/vulncheck-kev/schema)
 - [vcheck-cli](https://github.com/myseq/vcheck-cli) at GitHub


