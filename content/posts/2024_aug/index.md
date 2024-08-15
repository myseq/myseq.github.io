---
title: "Patch Tuesday (2024-08)"
date: 2024-08-15T15:36:37+08:00
tags: [ "patchtuesday" ]
categories: [ "Posts"  ]
summary: "$ ./patch_tuesday.py -k 2024-aug -vc"
draft: true
---
{{< lead >}}
This video summarizes the security updates released by Microsoft on August 13, 2024.
{{< /lead >}}

## Key Takeways

 - `91` newly disclosed vulnerabilities, slightly above average.
 - Highest scored vulnerability is 9.8.
 - `29` remote code execution vulnerabilities (around average).
 - `4` publicly disclosed vulnerabilities (higher than average).
 - `6` vulnerabilities known to be exploited (higher than average).
 - Windows 11 version 24H2 has security updates but is not yet generally available.

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


 [*] Finish fetching [2,062,411 bytes] from https://api.msrc.microsoft.com/cvrf/v3.0/cvrf/2024-aug

 Microsoft Patch Tuesday - By MSRC
===============================================
 << August 2024 Security Updates [ 2024-08-13 ] >>


 [+] Vulnerabilities           : [ 185 ]
        [-] High_Severity      : [  31 ]
        [-] High_likelihood    : [  11 ]
        [-] Exploited in_wild  : [   6 ]
 [+] Product Families          : [   9 ]

                                                                      High_Severity/31
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base ┃ CVSS_Temporal ┃ Title_Value                                                                                                 ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2022-36648 │   10.0    │     10.0      │ <>                                                                                                          │
│ CVE-2024-39331 │    9.8    │      9.8      │ <>                                                                                                          │
│ CVE-2024-41110 │    9.9    │      9.9      │ <>                                                                                                          │
│ CVE-2022-35414 │    8.8    │      8.8      │ <>                                                                                                          │
│ CVE-2022-3872  │    8.6    │      8.6      │ <>                                                                                                          │
│ CVE-2023-29404 │    9.8    │      9.8      │ <>                                                                                                          │
│ CVE-2023-29402 │    9.8    │      9.8      │ <>                                                                                                          │
│ CVE-2017-17522 │    8.8    │      8.8      │ <>                                                                                                          │
│ CVE-2024-2398  │    8.6    │      8.6      │ <>                                                                                                          │
│ CVE-2024-38428 │    9.1    │      9.1      │ <>                                                                                                          │
│ CVE-2022-2601  │    8.6    │      8.6      │ Redhat: CVE-2022-2601 grub2 - Buffer overflow in grub_font_construct_glyph() can lead to out-of-bound write │
│                │           │               │ and possible secure boot bypass                                                                             │
│ CVE-2024-38108 │    9.3    │      8.1      │ Azure Stack Hub Spoofing Vulnerability                                                                      │
│ CVE-2024-38159 │    9.1    │      7.9      │ Windows Network Virtualization Remote Code Execution Vulnerability                                          │
│ CVE-2024-38160 │    9.1    │      7.9      │ Windows Network Virtualization Remote Code Execution Vulnerability                                          │
│ CVE-2024-38199 │    9.8    │      8.5      │ Windows Line Printer Daemon (LPD) Service Remote Code Execution Vulnerability                               │
│ CVE-2024-38063 │    9.8    │      8.5      │ Windows TCP/IP Remote Code Execution Vulnerability                                                          │
│ CVE-2024-38114 │    8.8    │      7.7      │ Windows IP Routing Management Snapin Remote Code Execution Vulnerability                                    │
│ CVE-2024-38115 │    8.8    │      7.7      │ Windows IP Routing Management Snapin Remote Code Execution Vulnerability                                    │
│ CVE-2024-38116 │    8.8    │      7.7      │ Windows IP Routing Management Snapin Remote Code Execution Vulnerability                                    │
│ CVE-2024-38121 │    8.8    │      7.7      │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability                        │
│ CVE-2024-38128 │    8.8    │      7.7      │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability                        │
│ CVE-2024-38130 │    8.8    │      7.7      │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability                        │
│ CVE-2024-38131 │    8.8    │      7.7      │ Clipboard Virtual Channel Extension Remote Code Execution Vulnerability                                     │
│ CVE-2024-38140 │    9.8    │      8.5      │ Windows Reliable Multicast Transport Driver (RMCAST) Remote Code Execution Vulnerability                    │
│ CVE-2024-38144 │    8.8    │      7.7      │ Kernel Streaming WOW Thunk Service Driver Elevation of Privilege Vulnerability                              │
│ CVE-2024-38154 │    8.8    │      7.7      │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability                        │
│ CVE-2024-38180 │    8.8    │      7.7      │ Windows SmartScreen Security Feature Bypass Vulnerability                                                   │
│ CVE-2024-38189 │    8.8    │      8.2      │ Microsoft Project Remote Code Execution Vulnerability                                                       │
│ CVE-2024-38120 │    8.8    │      7.7      │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability                        │
│ CVE-2024-38206 │    8.5    │      7.4      │ Microsoft Copilot Studio Information Disclosure Vulnerability                                               │
│ CVE-2024-38109 │    9.1    │      7.9      │ Azure Health Bot Elevation of Privilege Vulnerability                                                       │
└────────────────┴───────────┴───────────────┴─────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

                                                        High_Likelihood/11
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base ┃ CVSS_Temporal ┃ Title_Value                                                                        ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-38196 │    7.8    │      6.8      │ Windows Common Log File System Driver Elevation of Privilege Vulnerability         │
│ CVE-2024-38198 │    7.5    │      6.5      │ Windows Print Spooler Elevation of Privilege Vulnerability                         │
│ CVE-2024-38063 │    9.8    │      8.5      │ Windows TCP/IP Remote Code Execution Vulnerability                                 │
│ CVE-2024-38125 │    7.8    │      6.8      │ Kernel Streaming WOW Thunk Service Driver Elevation of Privilege Vulnerability     │
│ CVE-2024-38133 │    7.8    │      6.8      │ Windows Kernel Elevation of Privilege Vulnerability                                │
│ CVE-2024-38141 │    7.8    │      6.8      │ Windows Ancillary Function Driver for WinSock Elevation of Privilege Vulnerability │
│ CVE-2024-38144 │    8.8    │      7.7      │ Kernel Streaming WOW Thunk Service Driver Elevation of Privilege Vulnerability     │
│ CVE-2024-38147 │    7.8    │      6.8      │ Microsoft DWM Core Library Elevation of Privilege Vulnerability                    │
│ CVE-2024-38148 │    7.5    │      6.5      │ Windows Secure Channel Denial of Service Vulnerability                             │
│ CVE-2024-38150 │    7.8    │      6.8      │ Windows DWM Core Library Elevation of Privilege Vulnerability                      │
│ CVE-2024-38163 │    7.8    │      6.8      │ Windows Update Stack Elevation of Privilege Vulnerability                          │
└────────────────┴───────────┴───────────────┴────────────────────────────────────────────────────────────────────────────────────┘

                                                        Exploited_in_Wild/6
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base ┃ CVSS_Temporal ┃ Title_Value                                                                        ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-38178 │    7.5    │      7.0      │ Scripting Engine Memory Corruption Vulnerability                                   │
│ CVE-2024-38193 │    7.8    │      7.2      │ Windows Ancillary Function Driver for WinSock Elevation of Privilege Vulnerability │
│ CVE-2024-38213 │    6.5    │      6.0      │ Windows Mark of the Web Security Feature Bypass Vulnerability                      │
│ CVE-2024-38106 │    7.0    │      6.5      │ Windows Kernel Elevation of Privilege Vulnerability                                │
│ CVE-2024-38107 │    7.8    │      7.2      │ Windows Power Dependency Coordinator Elevation of Privilege Vulnerability          │
│ CVE-2024-38189 │    8.8    │      8.2      │ Microsoft Project Remote Code Execution Vulnerability                              │
└────────────────┴───────────┴───────────────┴────────────────────────────────────────────────────────────────────────────────────┘


 [+] Product Families (9)
        [ 1]              Windows : 29
        [ 2]                Azure : 19
        [ 3]     Microsoft Office : 18
        [ 4]                  ESU : 10
        [ 5]              Mariner : 6
        [ 6]      Developer Tools : 6
        [ 7]   Microsoft Dynamics : 2
        [ 8]              Browser : 1
        [ 9]                 Apps : 1

 [*] "August 2024 Security Updates" (Rev 52)
        [-] Initial Release date: 2024-08-13T07:00:00
        [-] Current Release date: 2024-08-12T00:00:00


 [*] [2024-08-14] main(): Completed within [6.7466 sec].


```

