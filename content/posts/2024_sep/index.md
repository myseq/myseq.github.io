---
title: "Patch Tuesday (2024-09)"
date: 2024-09-11T17:36:37+08:00
tags: [ "patchtuesday" ]
categories: [ "Posts"  ]
summary: "$ ./patch_tuesday.py -k 2024-sep -vc"
draft: false
---
{{< lead >}}
This video summarizes the security updates released by Microsoft on September 10, 2024.
{{< /lead >}}

## Key Takeways

Highest scored vulnerability is 9.8, average score is 7.70.
Sign up for full briefing call if you are a Microsoft Premier or unified support customer.


 - `79` newly disclosed vulnerabilities in September 2024 release (slightly higher than average).
 - `23` remote code execution vulnerabilities (most impactful type).
 - Highest CVSS scored vulnerability is 9.8.
 - `7` ciritcal patches (lower than last month).
 - Critical vulnerabilities include `CVE-2024-38063` (TCP/IP stack) and CVE-2024-3819 (line printer daemon).
 - Accelerate update deployment due to elevated risk.
 - Total of `78` CVEs that require customer action. *(New metric starting in Aug 2024)*
 - Total of `4` CVEs found in **CISA_KEV** and *exploited in wild*. 

## Highlights

 - `CVE-2024-38018`: This vulnerability impacts SharePoint servers, enabling remote code execution with low complexity. It's crucial for organizations running their own SharePoint servers to apply the necessary patches.
 - `CVE-2024-38217`: This exploit allows attackers to bypass the Mark of the Web security feature, potentially leading to the download and execution of malicious files. It's recommended to patch this vulnerability to protect users from downloading harmful content.
 - `CVE-2024-43491`: A critical vulnerability affecting older Windows versions (1507 and 10 2015 LTSB) was reintroduced due to a rollback of security updates. This allows attackers to exploit previously patched vulnerabilities and gain control of the system. 

{{< youtube id="AL7mG5cq7F4" title="Security Update Release Summary September 2024" >}}

> Video is added later since it only been released on Sep 12. 

## Patch_Tuesday


```bash

$ ./patch_tuesday.py -k 2024-aug -vc

 _____     _       _      _____               _
|  _  |___| |_ ___| |_   |_   _|_ _ ___ ___ _| |___ _ _
|   __| .'|  _|  _|   |    | | | | | -_|_ -| . | .'| | |
|__|  |__,|_| |___|_|_|    |_| |___|___|___|___|__,|_  |
                                                   |___|


 [*] Finish fetching [2,383,180 bytes] from https://api.msrc.microsoft.com/cvrf/v3.0/cvrf/2024-sep


 [*] CISA Catalog of Known Exploited Vulnerabilities [ 2024.09.11/1169 ]


 Microsoft Patch Tuesday - By MSRC
===============================================
 << September 2024 Security Updates [ 2024-09-10 ] >>


 [+] Vulnerabilities           : [  79 ]
        [-] High_Severity      : [  19 ]
        [-] High_likelihood    : [  19 ]
        [-] Exploited in_wild  : [   4 ]
        [-] Action_required    : [  78 ]
        [-] Found in CISA_KEV  : [   4 ]

                                                 High_Severity/19
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp  ┃ Title_Value                                                                  ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-37338 │   B:8.8/T:7.7   │ Microsoft SQL Server Native Scoring Remote Code Execution Vulnerability      │
│ CVE-2024-37335 │   B:8.8/T:7.7   │ Microsoft SQL Server Native Scoring Remote Code Execution Vulnerability      │
│ CVE-2024-37340 │   B:8.8/T:7.7   │ Microsoft SQL Server Native Scoring Remote Code Execution Vulnerability      │
│ CVE-2024-37339 │   B:8.8/T:7.7   │ Microsoft SQL Server Native Scoring Remote Code Execution Vulnerability      │
│ CVE-2024-26186 │   B:8.8/T:7.7   │ Microsoft SQL Server Native Scoring Remote Code Execution Vulnerability      │
│ CVE-2024-26191 │   B:8.8/T:7.7   │ Microsoft SQL Server Native Scoring Remote Code Execution Vulnerability      │
│ CVE-2024-38018 │   B:8.8/T:7.7   │ Microsoft SharePoint Server Remote Code Execution Vulnerability              │
│ CVE-2024-38220 │   B:9.0/T:7.8   │ Azure Stack Hub Elevation of Privilege Vulnerability                         │
│ CVE-2024-37965 │   B:8.8/T:7.7   │ Microsoft SQL Server Elevation of Privilege Vulnerability                    │
│ CVE-2024-37341 │   B:8.8/T:7.7   │ Microsoft SQL Server Elevation of Privilege Vulnerability                    │
│ CVE-2024-38225 │   B:8.8/T:7.7   │ Microsoft Dynamics 365 Business Central Elevation of Privilege Vulnerability │
│ CVE-2024-38259 │   B:8.8/T:7.7   │ Microsoft Management Console Remote Code Execution Vulnerability             │
│ CVE-2024-38260 │   B:8.8/T:7.7   │ Windows Remote Desktop Licensing Service Remote Code Execution Vulnerability │
│ CVE-2024-43455 │   B:8.8/T:7.7   │ Windows Remote Desktop Licensing Service Spoofing Vulnerability              │
│ CVE-2024-43461 │   B:8.8/T:7.7   │ Windows MSHTML Platform Spoofing Vulnerability                               │
│ CVE-2024-43469 │   B:8.8/T:7.7   │ Azure CycleCloud Remote Code Execution Vulnerability                         │
│ CVE-2024-43479 │   B:8.5/T:7.4   │ Microsoft Power Automate Desktop Remote Code Execution Vulnerability         │
│ CVE-2024-43491 │ B:9.8/T:9.1 [K] │ Microsoft Windows Update Remote Code Execution Vulnerability                 │
│ CVE-2024-37980 │   B:8.8/T:7.7   │ Microsoft SQL Server Elevation of Privilege Vulnerability                    │
└────────────────┴─────────────────┴──────────────────────────────────────────────────────────────────────────────┘

                                                 High_Likelihood/19
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp ┃ Title_Value                                                                    ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-38018 │  B:8.8/T:7.7   │ Microsoft SharePoint Server Remote Code Execution Vulnerability                │
│ CVE-2024-38241 │  B:7.8/T:6.8   │ Kernel Streaming Service Driver Elevation of Privilege Vulnerability           │
│ CVE-2024-38242 │  B:7.8/T:6.8   │ Kernel Streaming Service Driver Elevation of Privilege Vulnerability           │
│ CVE-2024-38249 │  B:7.8/T:6.8   │ Windows Graphics Component Elevation of Privilege Vulnerability                │
│ CVE-2024-38252 │  B:7.8/T:6.8   │ Windows Win32 Kernel Subsystem Elevation of Privilege Vulnerability            │
│ CVE-2024-38253 │  B:7.8/T:6.8   │ Windows Win32 Kernel Subsystem Elevation of Privilege Vulnerability            │
│ CVE-2024-43464 │  B:7.2/T:6.3   │ Microsoft SharePoint Server Remote Code Execution Vulnerability                │
│ CVE-2024-38227 │  B:7.2/T:6.3   │ Microsoft SharePoint Server Remote Code Execution Vulnerability                │
│ CVE-2024-38228 │  B:7.2/T:6.3   │ Microsoft SharePoint Server Remote Code Execution Vulnerability                │
│ CVE-2024-38237 │  B:7.8/T:6.8   │ Kernel Streaming WOW Thunk Service Driver Elevation of Privilege Vulnerability │
│ CVE-2024-38238 │  B:7.8/T:6.8   │ Kernel Streaming Service Driver Elevation of Privilege Vulnerability           │
│ CVE-2024-38243 │  B:7.8/T:6.8   │ Kernel Streaming Service Driver Elevation of Privilege Vulnerability           │
│ CVE-2024-38244 │  B:7.8/T:6.8   │ Kernel Streaming Service Driver Elevation of Privilege Vulnerability           │
│ CVE-2024-38245 │  B:7.8/T:6.8   │ Kernel Streaming Service Driver Elevation of Privilege Vulnerability           │
│ CVE-2024-38246 │  B:7.0/T:6.1   │ Win32k Elevation of Privilege Vulnerability                                    │
│ CVE-2024-38247 │  B:7.8/T:6.8   │ Windows Graphics Component Elevation of Privilege Vulnerability                │
│ CVE-2024-43457 │  B:7.8/T:6.8   │ Windows Setup and Deployment Elevation of Privilege Vulnerability              │
│ CVE-2024-43461 │  B:8.8/T:7.7   │ Windows MSHTML Platform Spoofing Vulnerability                                 │
│ CVE-2024-43487 │  B:6.5/T:6.0   │ Windows Mark of the Web Security Feature Bypass Vulnerability                  │
└────────────────┴────────────────┴────────────────────────────────────────────────────────────────────────────────┘

                                        Exploited_in_Wild/4
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp  ┃ Title_Value                                                   ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-38014 │ B:7.8/T:7.2 [K] │ Windows Installer Elevation of Privilege Vulnerability        │
│ CVE-2024-38217 │ B:5.4/T:5.0 [K] │ Windows Mark of the Web Security Feature Bypass Vulnerability │
│ CVE-2024-38226 │ B:7.3/T:6.8 [K] │ Microsoft Publisher Security Feature Bypass Vulnerability     │
│ CVE-2024-43491 │ B:9.8/T:9.1 [K] │ Microsoft Windows Update Remote Code Execution Vulnerability  │
└────────────────┴─────────────────┴───────────────────────────────────────────────────────────────┘


 [+] Product Families (6)
                       Windows ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 28
              Microsoft Office ▇▇▇▇▇▇▇▇▇▇▇ 21
                         Azure ▇▇▇▇▇▇▇▇▇▇▇ 20
                           ESU ▇▇▇▇▇ 10
                    SQL Server ▇▇▇▇ 8
            Microsoft Dynamics ▇▇▇ 5

 [*] "September 2024 Security Updates" (Rev 141)
        [-] Initial Release date: 2024-09-10T07:00:00
        [-] Current Release date: 2024-09-08T00:00:00


 [*] [2024-09-11] main(): Completed within [7.7629 sec].

```

## Outro

 - Tool: [Patch_Tuesday](https://github.com/myseq/ms_patch_tuesday) at GitHub.
 - Tool: [CISA KEV Catalog](https://github.com/myseq/kev-catalog) at GitHub.


