+++
title =  "Vuln Mgmt: From Context to Metrics"
date = 2023-04-28T20:59:32+08:00
author = "zd"
tags = [ "sans", "webcast", "vulnmgmt" ]
categories = [ "YT" ]
summary = "From context to metrics in Vulnerability Management."
draft = false
+++

## Summary (My notes)

A series of videos (3 parts) that talk about vulnerability management: 
 - from finding the context with tools
 - leveraging the context for prioritization
 - leveraging context to create meaningful and tailored metrics for specifics to owners, systems, applications, by business unit
    - churn rate 
    - mean time to detect - average
    - mean time to resolve - average
    - agents coverage vs non-agent
    - SLA compliance rate
 - leveraging context for reporting (tailored) automated.
    - exceptions
    - vulnerable images
 - Contextual Information
    - Enterprise assets, cloud assets, and ownership information.
 - Leveraging Contextual Information
    - Prioritization, Metrics, and Reporting
    - Threat intel (internal and external)
 - Effective VulnMgmt
    - Working Vs Effective
      - Mean Time to Detect: Average (vuln pub data - vuln found date)
      - Churn rate: Absolute Value (New vuln - Closed vuln @ monthly)
      - Re-open rate: 
      - Averagee Exposure Windows: Average (vuln close date - vuln pub date)
      - Overdue: (current date - first discovered) > Policy 
    - Communication and collaborations
      - feedback, tailored report
    - Enabling business to deliver mission
 - Comments:
    - CMDB is too slow nowadays
      - tracking image version, usage, life-span, deployed
    - Multiple scanners and automation


## SANS Webcasts

### Finding Context (part 1 of 3)
 
{{< youtube id="48W1Jx4qnRc" title="Vulnerability Management: Finding Context - Part 1 of 3" >}}

### Leveraging Context (part 2 of 3)

{{< youtube id="xNQRHqIPiMQ" title="Vulnerability Management: Leveraging Context - Part 2 of 3" >}}

### Is the Program Effective (part 3 of 3)

{{< youtube id="VXo3ZSffUnk" title="Vulnerability Management: Is the Program Effective? - Part 3 of 3" >}}

## Links
  - [SANS MGT516: Managing Security Vulnerabilities: Enterprise & Cloud](https://www.sans.org/cyber-security-courses/building-leading-vulnerability-management-programs/)
  - [Asset Inventory](https://github.com/jonathanristo/asset-inventory)
  - [Vulnerability Management Metrics Part 2 – 3 Advanced Metrics for Your VM Program](https://www.youtube.com/watch?v=uarYlOA30EU)


