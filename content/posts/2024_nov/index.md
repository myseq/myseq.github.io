---
title: "Patch Tuesday (2024-11)"
date: 2024-11-15T17:36:37+08:00
tags: [ "patchtuesday" ]
categories: [ "Posts"  ]
summary: "$ ./patch_tuesday.py -k 2024-nov -vc"
draft: false
---
{{< lead >}}
*Summarizing from <https://msrc.microsoft.com/update-guide/releaseNote/2024-Nov>.*
{{< /lead >}}

## Key Takeways

In November 2024, Microsoft released **103 CVEs** as part of their Patch Tuesday updates.

 - `89` newly disclosed vulnerabilities in Nov 2024 release.
 - Total of `2` CVEs found in **CISA_KEV** and *exploited in wild*. 
 - `52` remote code execution vulnerabilities (most impactful type).
 - Highest CVSS scored vulnerability is 9.9.
 - **SQL Server**: There are 31 vulnerabilities in SQL Server, all of which are rated 8.8.
 - **Exchange**: There is one vulnerability in Exchange, `CVE-2024-4904`, which is an important spoofing vulnerability.
 - Total of `102` CVEs that require customer action. *(New metric starting in Aug 2024)*


![](/posts/2024_nov/cve_2024_nov.png)

## Highlights

 - `CVE-2024-43451`: NTLM Hash Disclosure Spoofing Vulnerability
 - `CVE-2024-49039`: Windows Task Scheduler Elevation of Privilege Vulnerability
 - `CVE-2024-43639`: A critical remote code execution vulnerability in Windows Server.
 - `CVE-2024-38255`: SQL Server, CVSS 8.8
 - `CVE-2024-43447`: Windows SMBv3 Client/Server, CVSS 8.1
 - `CVE-2024-43498`: .NET and Visual Studio, CVSS 9.8
 - `CVE-2024-43602`: Azure CycleCloud, CVSS 9.9

{{< youtube id="Zi7akrt8kK8" title="Security Update Release Summary November 2024" >}}

> Video is added later on Nov 19. 

## Patch_Tuesday


```bash

$ ./patch_tuesday.py -k 2024-nov -vc

   ___       __      __   ______                __
  / _ \___ _/ /_____/ /  /_  __/_ _____ ___ ___/ /__ ___ __
 / ___/ _ `/ __/ __/ _ \_ / / / // / -_|_-</ _  / _ `/ // /
/_/   \_,_/\__/\__/_//_(_)_/  \_,_/\__/___/\_,_/\_,_/\_, /
                                                    /___/


 [*] Finish fetching [3,064,834 bytes] from https://api.msrc.microsoft.com/cvrf/v3.0/cvrf/2024-nov


 [*] CISA Catalog of Known Exploited Vulnerabilities [ 2024.11.18/1217 ]


 Microsoft Patch Tuesday - By MSRC
===============================================
 << November 2024 Security Updates [ 2024-11-12 ] >>


 [+] Vulnerabilities           : [ 103 ]
        [-] High_Severity      : [  43 ]
        [-] High_likelihood    : [   9 ]
        [-] Exploited in_wild  : [   2 ]
        [-] Action_required    : [ 102 ]
        [-] Found in CISA_KEV  : [   2 ]

                                               High_Severity/43
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp  ┃ Title_Value                                                              ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-43602 │   B:9.9/T:8.6   │ Azure CycleCloud Remote Code Execution Vulnerability                     │
│ CVE-2024-43627 │   B:8.8/T:7.7   │ Windows Telephony Service Remote Code Execution Vulnerability            │
│ CVE-2024-43628 │   B:8.8/T:7.7   │ Windows Telephony Service Remote Code Execution Vulnerability            │
│ CVE-2024-38255 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-43459 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-43462 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-48994 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-48995 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-48996 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-5535  │   B:9.1/T:8.7   │ OpenSSL: CVE-2024-5535 SSL_select_next_proto buffer overread             │
│ CVE-2024-43498 │   B:9.8/T:8.5   │ .NET and Visual Studio Remote Code Execution Vulnerability               │
│ CVE-2024-43620 │   B:8.8/T:7.7   │ Windows Telephony Service Remote Code Execution Vulnerability            │
│ CVE-2024-43621 │   B:8.8/T:7.7   │ Windows Telephony Service Remote Code Execution Vulnerability            │
│ CVE-2024-43622 │   B:8.8/T:7.7   │ Windows Telephony Service Remote Code Execution Vulnerability            │
│ CVE-2024-43624 │   B:8.8/T:7.7   │ Windows Hyper-V Shared Virtual Disk Elevation of Privilege Vulnerability │
│ CVE-2024-43635 │   B:8.8/T:7.7   │ Windows Telephony Service Remote Code Execution Vulnerability            │
│ CVE-2024-48993 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-48997 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-48998 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-48999 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49000 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49001 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49002 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49003 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49004 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49005 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49007 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49006 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49008 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49009 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49010 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49011 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49012 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49013 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49014 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49015 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49016 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49017 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49018 │   B:8.8/T:7.7   │ SQL Server Native Client Remote Code Execution Vulnerability             │
│ CVE-2024-49039 │ B:8.8/T:8.2 [K] │ Windows Task Scheduler Elevation of Privilege Vulnerability              │
│ CVE-2024-49050 │   B:8.8/T:7.7   │ Visual Studio Code Python Extension Remote Code Execution Vulnerability  │
│ CVE-2024-49060 │   B:8.8/T:7.7   │ Azure Stack HCI Elevation of Privilege Vulnerability                     │
│ CVE-2024-43639 │   B:9.8/T:8.5   │ Windows KDC Proxy Remote Code Execution Vulnerability                    │
└────────────────┴─────────────────┴──────────────────────────────────────────────────────────────────────────┘

                                               High_Likelihood/9
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp ┃ Title_Value                                                                ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-43623 │  B:7.8/T:6.8   │ Windows NT OS Kernel Elevation of Privilege Vulnerability                  │
│ CVE-2024-43630 │  B:7.8/T:6.8   │ Windows Kernel Elevation of Privilege Vulnerability                        │
│ CVE-2024-49040 │  B:7.5/T:6.7   │ Microsoft Exchange Server Spoofing Vulnerability                           │
│ CVE-2024-43629 │  B:7.8/T:6.8   │ Windows DWM Core Library Elevation of Privilege Vulnerability              │
│ CVE-2024-43636 │  B:7.8/T:6.8   │ Win32k Elevation of Privilege Vulnerability                                │
│ CVE-2024-43642 │  B:7.5/T:6.5   │ Windows SMB Denial of Service Vulnerability                                │
│ CVE-2024-49019 │  B:7.8/T:6.8   │ Active Directory Certificate Services Elevation of Privilege Vulnerability │
│ CVE-2024-49033 │  B:7.5/T:6.5   │ Microsoft Word Security Feature Bypass Vulnerability                       │
│ CVE-2024-49060 │  B:8.8/T:7.7   │ Azure Stack HCI Elevation of Privilege Vulnerability                       │
└────────────────┴────────────────┴────────────────────────────────────────────────────────────────────────────┘

                                       Exploited_in_Wild/2
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base/Temp  ┃ Title_Value                                                 ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-43451 │ B:6.5/T:6.0 [K] │ NTLM Hash Disclosure Spoofing Vulnerability                 │
│ CVE-2024-49039 │ B:8.8/T:8.2 [K] │ Windows Task Scheduler Elevation of Privilege Vulnerability │
└────────────────┴─────────────────┴─────────────────────────────────────────────────────────────┘


 [+] Product Families (12)
                       Windows ▇▇▇▇▇▇▇▇▇▇▇▇ 27
                         Azure ▇▇▇▇▇▇▇▇▇▇▇ 25
              Microsoft Office ▇▇▇▇▇▇▇▇▇ 22
                           ESU ▇▇▇▇ 10
               Developer Tools ▇▇▇▇ 9
                    SQL Server ▇▇▇ 8
                       Mariner ▇▇▇ 6
               Server Software ▇ 3
                 System Center ▇ 2
          Open Source Software ▇ 2
                       Browser ▏ 1
                          Apps ▏ 1

 [*] "November 2024 Security Updates" (Rev 164)
        [-] Initial Release date: 2024-11-12T08:00:00
        [-] Current Release date: 2024-11-18T08:00:00


 [*] [2024-11-19] main(): Completed within [9.6138 sec].

```

## Outro

 - Tool: [Patch_Tuesday](https://github.com/myseq/ms_patch_tuesday) at GitHub.
 - Tool: [CISA KEV Catalog](https://github.com/myseq/kev-catalog) at GitHub.


