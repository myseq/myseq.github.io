---
title: "Patch Tuesday (2024-08)"
date: 2024-08-15T15:36:37+08:00
tags: [ "patchtuesday" ]
categories: [ "Posts"  ]
summary: "$ ./patch_tuesday.py -k 2024-aug -vc"
draft: false
---
{{< lead >}}
This video summarizes the security updates released by Microsoft on August 13, 2024.
{{< /lead >}}

## Key Takeways

 - `102` newly disclosed vulnerabilities, slightly above average.
 - Highest scored vulnerability is 9.8.
 - `29` remote code execution vulnerabilities (around average).
 - `6` publicly disclosed vulnerabilities (higher than average).
 - `6` vulnerabilities known to be exploited (higher than average).
 - Windows 11 version 24H2 has security updates but is not yet generally available.
 - Total of `99` CVEs that require customer action. *(New metric starting in Aug 2024)*

## Highlights

 - `CVE-2024-38063`: Critical remote code execution in TCP/IP stack, no known exploits, base score 9.8, mitigated by disabling IPv6.
 - `CVE-2024-3819`: Important remote code execution in line printer daemon, publicly disclosed, no known exploits, base score 9.8, mitigated by disabling line printer daemon.
 - `CVE-2024-38106`: Important elevation of privilege in Windows kernel, privately disclosed but exploited in the wild, base score 7.0.

{{< youtube id="_COpq0-iPlA" title="Security Update Release Summary August 2024" >}}

## Patch_Tuesday


```bash
$ ./patch_tuesday.py -k 2024-aug -vc

 _____     _       _      _____               _
|  _  |___| |_ ___| |_   |_   _|_ _ ___ ___ _| |___ _ _
|   __| .'|  _|  _|   |    | | | | | -_|_ -| . | .'| | |
|__|  |__,|_| |___|_|_|    |_| |___|___|___|___|__,|_  |
                                                   |___|


 [*] Finish fetching [2,953,270 bytes] from https://api.msrc.microsoft.com/cvrf/v3.0/cvrf/2024-aug


 [*] CISA Catalog of Known Exploited Vulnerabilities [ 2024.08.15/1150 ]


 Microsoft Patch Tuesday - By MSRC
===============================================
 << August 2024 Security Updates [ 2024-08-13 ] >>


 [+] Vulnerabilities           : [ 102 ]
        [-] High_Severity      : [  21 ]
        [-] High_likelihood    : [  11 ]
        [-] Exploited in_wild  : [   6 ]
        [-] Action_required    : [  99 ]
        [-] Found in CISA_KEV  : [   6 ]

                                                    High_Severity/21
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp  ┃ Title_Value                                                                       ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2022-2601  │   B:8.6/T:8.6   │ Redhat: CVE-2022-2601 grub2 - Buffer overflow in grub_font_construct_glyph() can  │
│                │                 │ lead to out-of-bound write and possible secure boot bypass                        │
│ CVE-2024-38108 │   B:9.3/T:8.1   │ Azure Stack Hub Spoofing Vulnerability                                            │
│ CVE-2024-38159 │   B:9.1/T:7.9   │ Windows Network Virtualization Remote Code Execution Vulnerability                │
│ CVE-2024-38160 │   B:9.1/T:7.9   │ Windows Network Virtualization Remote Code Execution Vulnerability                │
│ CVE-2024-38199 │   B:9.8/T:8.5   │ Windows Line Printer Daemon (LPD) Service Remote Code Execution Vulnerability     │
│ CVE-2024-38063 │   B:9.8/T:8.5   │ Windows TCP/IP Remote Code Execution Vulnerability                                │
│ CVE-2024-38114 │   B:8.8/T:7.7   │ Windows IP Routing Management Snapin Remote Code Execution Vulnerability          │
│ CVE-2024-38115 │   B:8.8/T:7.7   │ Windows IP Routing Management Snapin Remote Code Execution Vulnerability          │
│ CVE-2024-38116 │   B:8.8/T:7.7   │ Windows IP Routing Management Snapin Remote Code Execution Vulnerability          │
│ CVE-2024-38121 │   B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution            │
│                │                 │ Vulnerability                                                                     │
│ CVE-2024-38128 │   B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution            │
│                │                 │ Vulnerability                                                                     │
│ CVE-2024-38130 │   B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution            │
│                │                 │ Vulnerability                                                                     │
│ CVE-2024-38131 │   B:8.8/T:7.7   │ Clipboard Virtual Channel Extension Remote Code Execution Vulnerability           │
│ CVE-2024-38140 │   B:9.8/T:8.5   │ Windows Reliable Multicast Transport Driver (RMCAST) Remote Code Execution        │
│                │                 │ Vulnerability                                                                     │
│ CVE-2024-38144 │   B:8.8/T:7.7   │ Kernel Streaming WOW Thunk Service Driver Elevation of Privilege Vulnerability    │
│ CVE-2024-38154 │   B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution            │
│                │                 │ Vulnerability                                                                     │
│ CVE-2024-38180 │   B:8.8/T:7.7   │ Windows SmartScreen Security Feature Bypass Vulnerability                         │
│ CVE-2024-38189 │ B:8.8/T:8.2 [K] │ Microsoft Project Remote Code Execution Vulnerability                             │
│ CVE-2024-38120 │   B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution            │
│                │                 │ Vulnerability                                                                     │
│ CVE-2024-38206 │   B:8.5/T:7.4   │ Microsoft Copilot Studio Information Disclosure Vulnerability                     │
│ CVE-2024-38109 │   B:9.1/T:7.9   │ Azure Health Bot Elevation of Privilege Vulnerability                             │
└────────────────┴─────────────────┴───────────────────────────────────────────────────────────────────────────────────┘

                                                   High_Likelihood/11
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp ┃ Title_Value                                                                        ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-38196 │  B:7.8/T:6.8   │ Windows Common Log File System Driver Elevation of Privilege Vulnerability         │
│ CVE-2024-38198 │  B:7.5/T:6.5   │ Windows Print Spooler Elevation of Privilege Vulnerability                         │
│ CVE-2024-38063 │  B:9.8/T:8.5   │ Windows TCP/IP Remote Code Execution Vulnerability                                 │
│ CVE-2024-38125 │  B:7.8/T:6.8   │ Kernel Streaming WOW Thunk Service Driver Elevation of Privilege Vulnerability     │
│ CVE-2024-38133 │  B:7.8/T:6.8   │ Windows Kernel Elevation of Privilege Vulnerability                                │
│ CVE-2024-38141 │  B:7.8/T:6.8   │ Windows Ancillary Function Driver for WinSock Elevation of Privilege Vulnerability │
│ CVE-2024-38144 │  B:8.8/T:7.7   │ Kernel Streaming WOW Thunk Service Driver Elevation of Privilege Vulnerability     │
│ CVE-2024-38147 │  B:7.8/T:6.8   │ Microsoft DWM Core Library Elevation of Privilege Vulnerability                    │
│ CVE-2024-38148 │  B:7.5/T:6.5   │ Windows Secure Channel Denial of Service Vulnerability                             │
│ CVE-2024-38150 │  B:7.8/T:6.8   │ Windows DWM Core Library Elevation of Privilege Vulnerability                      │
│ CVE-2024-38163 │  B:7.8/T:6.8   │ Windows Update Stack Elevation of Privilege Vulnerability                          │
└────────────────┴────────────────┴────────────────────────────────────────────────────────────────────────────────────┘

                                                  Exploited_in_Wild/6
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp  ┃ Title_Value                                                                       ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-38178 │ B:7.5/T:7.0 [K] │ Scripting Engine Memory Corruption Vulnerability                                  │
│ CVE-2024-38193 │ B:7.8/T:7.2 [K] │ Windows Ancillary Function Driver for WinSock Elevation of Privilege              │
│                │                 │ Vulnerability                                                                     │
│ CVE-2024-38213 │ B:6.5/T:6.0 [K] │ Windows Mark of the Web Security Feature Bypass Vulnerability                     │
│ CVE-2024-38106 │ B:7.0/T:6.5 [K] │ Windows Kernel Elevation of Privilege Vulnerability                               │
│ CVE-2024-38107 │ B:7.8/T:7.2 [K] │ Windows Power Dependency Coordinator Elevation of Privilege Vulnerability         │
│ CVE-2024-38189 │ B:8.8/T:8.2 [K] │ Microsoft Project Remote Code Execution Vulnerability                             │
└────────────────┴─────────────────┴───────────────────────────────────────────────────────────────────────────────────┘


 [+] Product Families (9)
                       Windows ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 29
                         Azure ▇▇▇▇▇▇▇▇▇▇ 19
              Microsoft Office ▇▇▇▇▇▇▇▇▇▇ 18
                           ESU ▇▇▇▇▇ 10
                       Mariner ▇▇▇ 6
               Developer Tools ▇▇▇ 6
            Microsoft Dynamics ▇ 2
                       Browser ▇ 1
                          Apps ▇ 1

 [*] "August 2024 Security Updates" (Rev 92)
        [-] Initial Release date: 2024-08-13T07:00:00
        [-] Current Release date: 2024-08-18T00:00:00


 [*] [2024-08-19] main(): Completed within [8.8423 sec].

```

## Outro

 - Tool: [Patch_Tuesday](https://github.com/myseq/ms_patch_tuesday) at GitHub.
 - Tool: [CISA KEV Catalog](https://github.com/myseq/kev-catalog) at GitHub.


