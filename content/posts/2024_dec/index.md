---
title: "Patch Tuesday (2024-12)"
date: 2024-12-15T16:36:37+08:00
tags: [ "patchtuesday" ]
categories: [ "Posts"  ]
summary: "$ ./patch_tuesday.py -k 2024-dec -vc"
draft: false
---
{{< lead >}}
*Summarizing from <https://msrc.microsoft.com/update-guide/releaseNote/2024-Dec>.*
{{< /lead >}}

## Key Takeways

In December 2024, Microsoft released **74 CVEs** as part of their Patch Tuesday updates.

 - `78` newly disclosed vulnerabilities in Dec 2024 release (including non-MS CVEs).
 - Total of `1` CVE found in **CISA_KEV** and *exploited in wild*. 
 - `30` remote code execution vulnerabilities (most impactful type).
 - `16` (22.9%) CVEs have been rated as **Critical**, and `54` been rated as **Important**.
 - Total of `76` CVEs that require customer action. *(New metric starting in Aug 2024)*

![](/posts/2024_dec/dist_2024_dec.png)

![](/posts/2024_dec/highlight_2024_dec.png)

## Highlights

 - `CVE-2024-49138`: Windows Common Log File System Driver Elevation of Privilege Vulnerability
 - `CVE-2024-49070`: Microsoft SharePoint Remote Code Execution Vulnerability
 - `CVE-2024-49118`, `CVE-2024-49122`: Microsoft Message Queuing (MSMQ) Remote Code Execution Vulnerability
 - `9` CVEs: Windows Remote Desktop Services Remote Code Execution Vulnerability

> "Playback on other website has been disabled." by Microsoft Security.
> Thus, watch the [video at YouTube](https://www.youtube.com/watch?v=1eC-7u-TtKo) instead.

{{< youtube id="1eC-7u-TtKo" title="Security Update Release Summary December 2024" >}}

## Patch_Tuesday

Here, you can run the tool manually for your own analysis. 

```bash

$ ./patch_tuesday.py -k 2024-dec -vc

   ___       __      __   ______                __
  / _ \___ _/ /_____/ /  /_  __/_ _____ ___ ___/ /__ ___ __
 / ___/ _ `/ __/ __/ _ \_ / / / // / -_|_-</ _  / _ `/ // /
/_/   \_,_/\__/\__/_//_(_)_/  \_,_/\__/___/\_,_/\_,_/\_, /
                                                    /___/


 [*] Finish fetching [4,001,593 bytes] from https://api.msrc.microsoft.com/cvrf/v3.0/cvrf/2024-dec

 [*] CISA Catalog of Known Exploited Vulnerabilities [ 2024.12.13/1229 ]

 Microsoft Patch Tuesday - By MSRC
===============================================
 << December 2024 Security Updates [ 2024-12-10 ] >>


 [+] Vulnerabilities           : [  78 ]
        [-] High_Severity      : [  10 ]
        [-] High_likelihood    : [   6 ]
        [-] Exploited in_wild  : [   1 ]
        [-] Action_required    : [  76 ]
        [-] Found in CISA_KEV  : [   1 ]

                                                       High_Severity/10
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp ┃ Title_Value                                                                              ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-49085 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability     │
│ CVE-2024-49086 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability     │
│ CVE-2024-49093 │  B:8.8/T:7.7   │ Windows Resilient File System (ReFS) Elevation of Privilege Vulnerability                │
│ CVE-2024-49102 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability     │
│ CVE-2024-49104 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability     │
│ CVE-2024-49117 │  B:8.8/T:7.7   │ Windows Hyper-V Remote Code Execution Vulnerability                                      │
│ CVE-2024-49125 │  B:8.8/T:7.7   │ Windows Routing and Remote Access Service (RRAS) Remote Code Execution Vulnerability     │
│ CVE-2024-49147 │  B:9.3/T:8.4   │ Microsoft Update Catalog Elevation of Privilege Vulnerability                            │
│ CVE-2024-49080 │  B:8.8/T:7.7   │ Windows IP Routing Management Snapin Remote Code Execution Vulnerability                 │
│ CVE-2024-49112 │  B:9.8/T:8.5   │ Windows Lightweight Directory Access Protocol (LDAP) Remote Code Execution Vulnerability │
└────────────────┴────────────────┴──────────────────────────────────────────────────────────────────────────────────────────┘

                                                High_Likelihood/6
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp ┃ Title_Value                                                                 ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-49070 │  B:7.4/T:6.4   │ Microsoft SharePoint Remote Code Execution Vulnerability                    │
│ CVE-2024-49093 │  B:8.8/T:7.7   │ Windows Resilient File System (ReFS) Elevation of Privilege Vulnerability   │
│ CVE-2024-49122 │  B:8.1/T:7.1   │ Microsoft Message Queuing (MSMQ) Remote Code Execution Vulnerability        │
│ CVE-2024-49088 │  B:7.8/T:6.8   │ Windows Common Log File System Driver Elevation of Privilege Vulnerability  │
│ CVE-2024-49090 │  B:7.8/T:6.8   │ Windows Common Log File System Driver Elevation of Privilege Vulnerability  │
│ CVE-2024-49114 │  B:7.8/T:6.8   │ Windows Cloud Files Mini Filter Driver Elevation of Privilege Vulnerability │
└────────────────┴────────────────┴─────────────────────────────────────────────────────────────────────────────┘

                                               Exploited_in_Wild/1
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp  ┃ Title_Value                                                                ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-49138 │ B:7.8/T:6.8 [K] │ Windows Common Log File System Driver Elevation of Privilege Vulnerability │
└────────────────┴─────────────────┴────────────────────────────────────────────────────────────────────────────┘


 [+] Product Families (8)
                       Windows ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 29
              Microsoft Office ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 23
                           ESU ▇▇▇▇▇▇▇ 10
                       Mariner ▇▇▇▇ 6
                 System Center ▇▇▇ 5
                       Browser ▇ 1
                          Apps ▇ 1
               Developer Tools ▇ 1

 [*] "December 2024 Security Updates" (Rev 179)
        [-] Initial Release date: 2024-12-10T08:00:00
        [-] Current Release date: 2024-12-16T00:00:00

```

## Outro

 - Tool: [Patch_Tuesday](https://github.com/myseq/ms_patch_tuesday) at GitHub.


