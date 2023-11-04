---
title: "Quick Review on CVSS 4.0"
date: 2023-11-04T08:07:25+08:00
tags: [ "cvss" ]
categories: [ "Posts"  ]
summary: "New CVSS 4.0 vulnerability severity rating standard released."
draft: false
---
{{< lead >}}
Key Takeaways:
- CVSS v4 comes with new features, including added base metrics and new supplemental metric.
- CVSS v4 is more useful for assessing the severity of OT/ICS/Safety systems.
- CVSS v4 has new nomenclature and organizations should start planning the migration.
{{< /lead >}}

## Intro

CVSS essentially provides a way to capture the principal technical characteristics of a security vulnerability and produce a numerical score denoting its severity. 
The score can be translated into various levels, such as low, medium, high, and critical, to help organizations prioritize their vulnerability management processes.

On Nov 1 of 2023, the [FIRST](https://www.first.org/cvss/) has officially launched CVSS v4.0, the latest version of Common Vulnerabiltiy Scoring System standard in replacing the CVSS v3.0 (released in June 2015). 
BTW, CVSS v3.1 was released in June 2019.

> CVSS v3.1 has [emphasize and clarify](https://www.first.org/cvss/v3.1/user-guide) that "CVSS is designed to measure the severity of a vulnerabiltiy and should not be used alone to assess risk."

> CVSS v3.1 attracted criticism for lack of granularity in scoing scale and OT/ICS/Safety focus. 

## What's New?

Here I highlight some new features introduced in CVSS v4.0:

 1. New level of granularity with added Base Metrics and Values.
 2. Clearer insight into vulnerability impact with assessing effects and subsequent systems.
 3. Simplifying the Threat Metrics to focus on Exploit Maturity.
 4. New Supplemental Metric Group.
 5. New nomenclature to enumerate CVSS scores:
     - Base (CVSS-B)
     - Base + Threat (CVSS-BT),
     - Base + Envrionmental (CVSS-BE)
     - Base + Threat + Environmental (CVSS-BTE)

Below is the summary of the differences between CVSS v4.0 and v3.1:

| Feature | CVSS v4.0 | CVSS v3.1 |
| :------ | :-------- | :-------- |
| ***Base*** | 11 metrics | 8 metrics |
|  | **Exploitablity**<br> 1. Attack Vector (AV)<br> 2. Attack Complexity (AC)<br> 3. Attack Requirements (AT)<br> 4. Privileges Required (PR)<br> 5. User Interaction (UI) 	| <br> 1. Attack Vector (AV)<br> 2. Attack Complexity (AC)<br> 3. Privileges Required (PR)<br> 4. User Interaction (UI) |
|  | **Vulnerable System Impact**<br> 6. Confidentiality (VC)<br> 7. Integrity (VI)<br> 8. Availability (VA)<br> **Subsequent System Impact**<br> 9. Confidentiality (SC)<br> 10. Integrity (SI)<br> 11. Availability (SA) | **Impact**<br> 5. Confidentiality (C)<br> 6. Integrity (I)<br>7. Availability (A) |
|  | N/A | 8. Scope |
| ***Threat*** | **Threat**:<br> - Exploit Maturity (E) | **Temporal**:<br> - Exploit Code Maturity (E)<br> - Remediation Level (RL)<br> - Report Confidence (RC) | 
| ***Environmental*** | - Modified (11)<br> - Consumer-assessed Safety (MSI:S, MSA:S) | - Modified (8) |
| ***Supplemental Group*** | - Safety (S)<br> - Automatable (A)<br> - Recovery (R)<br> - Value Density (V)<br> - Response Effort (RE)<br> - Urgency (U) | None |
| ***OT/ICS/Safety Focus*** | Yes | No | 

## Notes

The concept of CVSS is not just the Base score.
The CVSS Base Score should be supplemented with an analysis of **threat** factor (change over time) and the **environment** factor (security controls).

## Tools and Links

 - CVSS Calculator: [v4.0](https://www.first.org/cvss/calculator/4.0) and [v3.1](https://www.first.org/cvss/calculator/3.1)
 - [CVSS v4.0 Specification](https://www.first.org/cvss/v4.0/specification-document) 
 - [CVSS v4.0 Presentation](https://www.first.org/cvss/v4-0/cvss-v40-presentation.pdf)


