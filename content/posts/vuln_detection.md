---
title: "Vulnerability Detection Outcomes"
date: 2022-09-03T11:49:21+08:00
tags: [ "101", "infosec", "vulnmgmt" ]
categories: [ "Posts", "Simplify"  ]
summary: "4 outcomes in vulnerability detection."
draft: false
---
{{< lead >}}
***Detection outcomes*** or ***classification outcomes***, *come from the field of binary classification.*

*There are applied in vulnerability management to describe how accurately a vulnerability scanning tool or process identifies issues.*
{{< /lead >}}

For example, if a vulnerability scanner identifies a specific security flaw (such as an outdated software version with known exploits), and this flaw actually exists on the system, that’s a true positive. 
It indicates the detection was accurate and actionable.

## 4 Outcomes

| Outcomes | Definition | Vuln Exists | Vuln Not_Found |
| :------- | :--------- | :---------: | :------------: |
| True Positive | Correctly identifies a vulnerability that exists. | ✔️  | |
| False Positive | Incorrectly identifies a vulnerability that doesn't exist. | | ✔️  |
| True Negative | Correctly identifies that a vulnerability doesn't exist. | | ✔️  |
| False Negative | Incorrectly fails to identify a vulnerability that exists. | ✔️  | |

> In machine learning and cybersecurity, these outcomes are sometimes also referred to as the confusion matrix outcomes, as they are part of the confusion matrix used to evaluate the performance of a classifier.

