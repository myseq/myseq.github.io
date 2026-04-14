+++
title = "MS Patch Tuesday"
date = "2022-07-01T01:30:09+08:00"
author = "zd"
tags = ["cli", "patchtuesday", "python"]
categories = [ "Blogger", "Essential" ]
summary = "To get vulnerability stats and updates for Patch Tuesday from MSRC."
draft = false
+++

## MS Patch Tuesday
This is a simple tool (written python) to perfrom quick analysis on security updates for MS Patch Tuesday. It highlights:
- Products Families
- Vulnerability Types
- High severity vulnerabities (>= CVSS 8.5)
- High likelihood vulnerabilities (contains 'Exploitation More Likely')
- Vulnerabilties that exploited in wild (Exploited:Yes)

Microsoft Security Response Center (MSRC) investigates all reports of security vulnerabilities affecting Microsoft products and services, and provides these updates as part of the ongoing effort to help you manage security risks and help keep your systems protected. All the details from Microsoft security update are formatted according to the Common Vulnerability Reporting Framework (CVRF). For more details, please visit msrc.microsoft.com/update-guide.

## Usage
```shell
$ patch_tuesday -h
usage: patch_tuesday [-h] [-c] [-k <YYYY-mmm>] [-v]

   Zzzzz   |\      _,,,---,,_
           /,`.-'`'    -.  ;-;;,_   __author__ : [ zd ]
          |,4-  ) )-,_..;\ (  `'-'  __year__   : [ 2022.03 ]
         '---''(_/--'  `-'\_)       __file__   : [ /home/xx/admin/patch_tuesday ]

         [ To get vulnerability stats and updates for Patch Tuesday from MSRC. ]


options:
  -h, --help     show this help message and exit
  -c             show chart output
  -k <YYYY-mmm>  Date string for the report query in format YYYY-mmm
  -v             verbose output

Get detailed Microsoft security update, formatted according to the Common Vulnerability Reporting Framework. MSRC investigates all reports of security vulnerabilities affecting Microsoft products and services, and provides these updates as part of the ongoing effort to help you manage security risks and help keep your systems protected. For more details, please visit msrc.microsoft.com/update-guide.

A similar wbesite can be found at https://patchtuesdaydashboard.com (by Morphus Labs).
```

Get quick summary of MS vulnerability stats for current month.
```shell
$ ./patch_tuesday.py
```
![./patch_tuesday.py](https://raw.githubusercontent.com/myseq/ms_patch_tuesday/main/.github/patch_tuesday1.png)

## Tips
Show quick summary with simple ASCII chart.
```shell
$ ./patch_tuesday.py -vc -k 2022-apr
```
![./patch_tuesday.py -vc -k 2022-apr](https://raw.githubusercontent.com/myseq/ms_patch_tuesday/main/.github/patch_tuesday2.png)

```shell
$ ./patch_tuesday -k 2022-may -v
```
![./patch_tuesday.py -k 2022-may -v](https://raw.githubusercontent.com/myseq/ms_patch_tuesday/main/.github/2022-may.png)

```shell
$ ./patch_tuesday -k 2022-jun -v
```
![./patch_tuesday.py -k 2022-jun -v](https://raw.githubusercontent.com/myseq/ms_patch_tuesday/main/.github/2022-jun.png)

## References
- [MSRC CVRF API](https://api.msrc.microsoft.com/cvrf/v2.0/swagger/index)
- [Microsoft April 2022 Security Updates](https://myseq.blogspot.com/2022/04/microsoft-april-2022-security-updates.html)
- [April 2002 Microsoft Security Updates](https://myseq.blogspot.com/2022/04/april-2002-microsoft-security-updates.html)
- [MySeq - Patch_Tuesday Utils](https://myseq.blogspot.com/2022/07/patchtuesday-utils.html)

