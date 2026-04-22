---
title: "Patch Tuesday (2024-10)"
date: 2024-10-09T00:36:37+08:00
tags: [ "patchtuesday" ]
categories: [ "Posts"  ]
summary: "$ ./patch_tuesday.py -k 2024-oct -vc"
draft: false
---
{{< lead >}}
*Summarizing from <https://msrc.microsoft.com/update-guide/releaseNote/2024-Oct>.*
{{< /lead >}}

## Key Takeways

 - `177` newly disclosed vulnerabilities and `4` non-Microsoft CVEs released in Oct 2024.
 - Highest CVSS Based Score is 9.8 (CVE-2024-43468).
 - Other 2 critical vulnerabilities include CVE-2024-43488 and CVE-2024-43582.
 - `4` zero-day flaws with 2 are actively exploited.
   - [CVE-2024-43572](https://msrc.microsoft.com/update-guide/en-US/advisory/CVE-2024-43572) [CISA_KEV]
   - [CVE-2024-43573](https://msrc.microsoft.com/update-guide/en-US/advisory/CVE-2024-43573) [CISA_KEV]
   - [CVE-2024-20659](https://msrc.microsoft.com/update-guide/en-US/advisory/CVE-2024-20659)
   - [CVE-2024-43583](https://msrc.microsoft.com/update-guide/en-US/advisory/CVE-2024-43583)
 - Total of `2` CVEs found in **CISA_KEV** and *exploited in wild*. 
 - Total of `120` CVEs that require customer action. *(New metric starting in Aug 2024)*
 - `43` remote code execution vulnerabilities (RCE).

![](/posts/2024_oct/vulns_2024_oct.png)

<!--
https://www.youtube.com/watch?v=dZ1pW6Sy8iM
-->
{{< youtube id="dZ1pW6Sy8iM" title="Security Update Release Summary October 2024" >}}

> Video is added later since it only been released on Oct 10. 


## Patch_Tuesday

```bash

$ patch_tuesday -k 2024-oct -vc


 _____     _       _      _____               _
|  _  |___| |_ ___| |_   |_   _|_ _ ___ ___ _| |___ _ _
|   __| .'|  _|  _|   |    | | | | | -_|_ -| . | .'| | |
|__|  |__,|_| |___|_|_|    |_| |___|___|___|___|__,|_  |
                                                   |___|


 [*] Finish fetching [2,146,701 bytes] from https://api.msrc.microsoft.com/cvrf/v3.0/cvrf/2024-oct


 [*] CISA Catalog of Known Exploited Vulnerabilities [ 2024.10.08/1190 ]


 Microsoft Patch Tuesday - By MSRC
===============================================
 << October 2024 Security Updates [ 2024-10-08 ] >>


 [+] Vulnerabilities           : [ 122 ]
        [-] High_Severity      : [  23 ]
        [-] High_likelihood    : [   9 ]
        [-] Exploited in_wild  : [   2 ]
        [-] Action_required    : [ 120 ]
        [-] Found in CISA_KEV  : [   2 ]

                                                     High_Severity/23
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp ┃ Title_Value                                                                          ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-38179 │  B:8.8/T:7.7   │ Azure Stack Hyperconverged Infrastructure (HCI) Elevation of Privilege Vulnerability │
│ CVE-2024-43518 │  B:8.8/T:7.7   │ Windows Telephony Server Remote Code Execution Vulnerability                         │
│ CVE-2024-43519 │  B:8.8/T:7.7   │ Microsoft WDAC OLE DB provider for SQL Server Remote Code Execution Vulnerability    │
│ CVE-2024-43532 │  B:8.8/T:7.7   │ Remote Registry Service Elevation of Privilege Vulnerability                         │
│ CVE-2024-43533 │  B:8.8/T:7.7   │ Remote Desktop Client Remote Code Execution Vulnerability                            │
│ CVE-2024-6197  │  B:8.8/T:7.7   │ Open Source Curl Remote Code Execution Vulnerability                                 │
│ CVE-2024-43608 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability │
│ CVE-2024-43607 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability │
│ CVE-2024-38124 │  B:9.0/T:7.8   │ Windows Netlogon Elevation of Privilege Vulnerability                                │
│ CVE-2024-38265 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability │
│ CVE-2024-43453 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability │
│ CVE-2024-38212 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability │
│ CVE-2024-43468 │  B:9.8/T:8.5   │ Microsoft Configuration Manager Remote Code Execution Vulnerability                  │
│ CVE-2024-43517 │  B:8.8/T:7.7   │ Microsoft ActiveX Data Objects Remote Code Execution Vulnerability                   │
│ CVE-2024-43549 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability │
│ CVE-2024-43564 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability │
│ CVE-2024-43589 │  B:8.8/T:8.1   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability │
│ CVE-2024-43591 │  B:8.7/T:7.6   │ Azure Command Line Integration (CLI) Elevation of Privilege Vulnerability            │
│ CVE-2024-43592 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability │
│ CVE-2024-43593 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability │
│ CVE-2024-43599 │  B:8.8/T:7.7   │ Remote Desktop Client Remote Code Execution Vulnerability                            │
│ CVE-2024-43611 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability │
│ CVE-2024-43488 │  B:8.8/T:7.7   │ Visual Studio Code extension for Arduino Remote Code Execution Vulnerability         │
└────────────────┴────────────────┴──────────────────────────────────────────────────────────────────────────────────────┘

                                               High_Likelihood/9
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp ┃ Title_Value                                                                ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-43502 │  B:7.1/T:6.2   │ Windows Kernel Elevation of Privilege Vulnerability                        │
│ CVE-2024-43581 │  B:7.1/T:6.2   │ Microsoft OpenSSH for Windows Remote Code Execution Vulnerability          │
│ CVE-2024-43609 │  B:6.5/T:5.7   │ Microsoft Office Spoofing Vulnerability                                    │
│ CVE-2024-43615 │  B:7.1/T:6.2   │ Microsoft OpenSSH for Windows Remote Code Execution Vulnerability          │
│ CVE-2024-43509 │  B:7.8/T:6.8   │ Windows Graphics Component Elevation of Privilege Vulnerability            │
│ CVE-2024-43556 │  B:7.8/T:6.8   │ Windows Graphics Component Elevation of Privilege Vulnerability            │
│ CVE-2024-43560 │  B:7.8/T:6.8   │ Microsoft Windows Storage Port Driver Elevation of Privilege Vulnerability │
│ CVE-2024-43583 │  B:7.8/T:6.8   │ Winlogon Elevation of Privilege Vulnerability                              │
│ CVE-2024-43610 │  B:0.0/T:0.0   │ Copilot Studio Information Disclosure Vulnerability                        │
└────────────────┴────────────────┴────────────────────────────────────────────────────────────────────────────┘

                                          Exploited_in_Wild/2
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp  ┃ Title_Value                                                      ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-43573 │ B:6.5/T:6.0 [K] │ Windows MSHTML Platform Spoofing Vulnerability                   │
│ CVE-2024-43572 │ B:7.8/T:7.2 [K] │ Microsoft Management Console Remote Code Execution Vulnerability │
└────────────────┴─────────────────┴──────────────────────────────────────────────────────────────────┘


 [+] Product Families (10)
               Developer Tools ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 89
                       Windows ▇▇▇▇▇▇▇▇▇ 28
              Microsoft Office ▇▇▇▇▇ 15
                           ESU ▇▇▇ 10
                         Azure ▇▇ 8
                       Mariner ▇▇ 6
                 System Center ▇ 4
                    SQL Server ▏ 1
                          Apps ▏ 1
                       Browser ▏ 1

 [*] "October 2024 Security Updates" (Rev 118)
        [-] Initial Release date: 2024-10-08T07:00:00
        [-] Current Release date: 2024-10-08T07:00:00

 [*] [2024-10-09] main(): Completed within [7.2541 sec].

```

## Outro

 - Tool: [Patch_Tuesday](https://github.com/myseq/ms_patch_tuesday) at GitHub.
 - Tool: [CISA KEV Catalog](https://github.com/myseq/kev-catalog) at GitHub.
 


