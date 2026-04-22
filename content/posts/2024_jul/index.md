---
title: "Patch Tuesday (2024-07)"
date: 2024-07-10T11:34:21+08:00
tags: [ "patchtuesday" ]
categories: [ "Posts"  ]
summary: "Security Update Release Summary July 2024."
draft: false
---
{{< lead >}}
This video is a summary of security updates released by Microsoft on July 9th, 2024.
{{< /lead >}}

## Key Takeaways

Here are the key points in brevity:

 - There are `142` newly published vulnerabilities in today’s release, which is higher than the average over the past 13 months.
 - The highest scored vulnerability from today's set is 9.8 on a scale of 10.
 - There were two vulnerabilities (`CVE-2024-38080` and `CVE-2024-38112`) that were publicly disclosed prior to release and two vulnerabilities known to be exploited at the time of release.
 - A specific reason for the high number of vulnerabilities and the high average CVSS score is the 37 vulnerabilities in the SQL Server drivers.
 - Microsoft is changing the way they document CVEs going forward. They will now be publishing CVEs for vulnerabilities that require no customer action.


{{< youtube id="cqvC0keC-KU" title="Security Update Release Summary July 2024" >}}

## Patch Tuesday

```bash
$ ./patch_tuesday.py -k 2024-jul -vc 

 _____     _       _      _____               _
|  _  |___| |_ ___| |_   |_   _|_ _ ___ ___ _| |___ _ _
|   __| .'|  _|  _|   |    | | | | | -_|_ -| . | .'| | |
|__|  |__,|_| |___|_|_|    |_| |___|___|___|___|__,|_  |
                                                   |___|


 [*] Finish fetching [2,435,964 bytes] from https://api.msrc.microsoft.com/cvrf/v3.0/cvrf/2024-jul

 Microsoft Patch Tuesday - By MSRC
===============================================
 << July 2024 Security Updates [ 2024-07-09 ] >>


 [+] Vulnerabilities           : [ 155 ]
        [-] High_Severity      : [  51 ]
        [-] High_likelihood    : [  14 ]
        [-] Exploited in_wild  : [   2 ]
 [+] Product Families          : [   8 ]

                                                      High_Severity/51
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base ┃ CVSS_Temporal ┃ Title_Value                                                                  ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2017-17522 │    8.8    │      8.8      │ <>                                                                           │
│ CVE-2024-21417 │    8.8    │      7.7      │ Windows Text Services Framework Elevation of Privilege Vulnerability         │
│ CVE-2024-28899 │    8.8    │      7.7      │ Secure Boot Security Feature Bypass Vulnerability                            │
│ CVE-2024-38088 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-38087 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21332 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21333 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21335 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21373 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21398 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21414 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21415 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21428 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37318 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37332 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37331 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-38060 │    8.8    │      7.7      │ Windows Imaging Component Remote Code Execution Vulnerability                │
│ CVE-2024-38077 │    9.8    │      8.5      │ Windows Remote Desktop Licensing Service Remote Code Execution Vulnerability │
│ CVE-2024-38104 │    8.8    │      7.7      │ Windows Fax Service Remote Code Execution Vulnerability                      │
│ CVE-2024-30013 │    8.8    │      7.7      │ Windows MultiPoint Services Remote Code Execution Vulnerability              │
│ CVE-2024-35271 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-35272 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-20701 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21303 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21308 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21317 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21331 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21425 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37319 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37320 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37321 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37322 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37323 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37324 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-21449 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37326 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37327 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37328 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37329 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37330 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37334 │    8.8    │      7.7      │ Microsoft OLE DB Driver for SQL Server Remote Code Execution Vulnerability   │
│ CVE-2024-37333 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-37336 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-28928 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-35256 │    8.8    │      7.7      │ SQL Server Native Client OLE DB Provider Remote Code Execution Vulnerability │
│ CVE-2024-38021 │    8.8    │      7.7      │ Microsoft Office Remote Code Execution Vulnerability                         │
│ CVE-2024-38053 │    8.8    │      7.7      │ Windows Layer-2 Bridge Network Driver Remote Code Execution Vulnerability    │
│ CVE-2024-38074 │    9.8    │      8.5      │ Windows Remote Desktop Licensing Service Remote Code Execution Vulnerability │
│ CVE-2024-38076 │    9.8    │      8.5      │ Windows Remote Desktop Licensing Service Remote Code Execution Vulnerability │
│ CVE-2024-38089 │    9.1    │      7.9      │ Microsoft Defender for IoT Elevation of Privilege Vulnerability              │
│ CVE-2024-38092 │    8.8    │      7.9      │ Azure CycleCloud Elevation of Privilege Vulnerability                        │
└────────────────┴───────────┴───────────────┴──────────────────────────────────────────────────────────────────────────────┘

                                                      High_Likelihood/14
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base ┃ CVSS_Temporal ┃ Title_Value                                                                    ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-38023 │    7.2    │      6.3      │ Microsoft SharePoint Server Remote Code Execution Vulnerability                │
│ CVE-2024-38024 │    7.2    │      6.3      │ Microsoft SharePoint Server Remote Code Execution Vulnerability                │
│ CVE-2024-38054 │    7.8    │      6.8      │ Kernel Streaming WOW Thunk Service Driver Elevation of Privilege Vulnerability │
│ CVE-2024-38059 │    7.8    │      6.8      │ Win32k Elevation of Privilege Vulnerability                                    │
│ CVE-2024-38060 │    8.8    │      7.7      │ Windows Imaging Component Remote Code Execution Vulnerability                  │
│ CVE-2024-38085 │    7.8    │      6.8      │ Windows Graphics Component Elevation of Privilege Vulnerability                │
│ CVE-2024-38100 │    7.8    │      6.8      │ Windows File Explorer Elevation of Privilege Vulnerability                     │
│ CVE-2024-38021 │    8.8    │      7.7      │ Microsoft Office Remote Code Execution Vulnerability                           │
│ CVE-2024-38052 │    7.8    │      6.8      │ Kernel Streaming WOW Thunk Service Driver Elevation of Privilege Vulnerability │
│ CVE-2024-38066 │    7.8    │      6.8      │ Windows Win32k Elevation of Privilege Vulnerability                            │
│ CVE-2024-38079 │    7.8    │      6.8      │ Windows Graphics Component Elevation of Privilege Vulnerability                │
│ CVE-2024-38094 │    7.2    │      6.3      │ Microsoft SharePoint Remote Code Execution Vulnerability                       │
│ CVE-2024-38099 │    5.9    │      5.2      │ Windows Remote Desktop Licensing Service Denial of Service Vulnerability       │
│ CVE-2024-39684 │    7.8    │      6.8      │ Github: CVE-2024-39684 TenCent RapidJSON Elevation of Privilege Vulnerability  │
└────────────────┴───────────┴───────────────┴────────────────────────────────────────────────────────────────────────────────┘

                                         Exploited_in_Wild/2
┏━━━━━━━━━━━━━━━━┳━━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃ CVE            ┃ CVSS_Base ┃ CVSS_Temporal ┃ Title_Value                                          ┃
┡━━━━━━━━━━━━━━━━╇━━━━━━━━━━━╇━━━━━━━━━━━━━━━╇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┩
│ CVE-2024-38080 │    7.8    │      6.8      │ Windows Hyper-V Elevation of Privilege Vulnerability │
│ CVE-2024-38112 │    7.5    │      7.0      │ Windows MSHTML Platform Spoofing Vulnerability       │
└────────────────┴───────────┴───────────────┴──────────────────────────────────────────────────────┘


 [+] Product Families (8)
               Developer Tools ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇ 77
                         Azure ▇▇▇▇▇▇▇▇▇ 29
                       Windows ▇▇▇▇▇▇▇▇ 26
              Microsoft Office ▇▇▇▇ 13
                           ESU ▇▇▇ 10
                    SQL Server ▇▇▇ 10
            Microsoft Dynamics ▏ 1
                 System Center ▏ 1

 [*] "July 2024 Security Updates" (Rev 20)
        [-] Initial Release date: 2024-07-09T07:00:00
        [-] Current Release date: 2024-07-09T00:00:00


 [*] [2024-07-10] main(): Completed within [6.8730 sec].

```

