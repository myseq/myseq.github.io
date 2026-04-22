---
title: "Checking CVE with RedHat Access"
date: 2024-10-10T11:55:24+08:00
tags: [ "redhat", "vulnmgmt" ]
categories: [ "Posts"  ]
summary: "Searching CVE details with RedHat Access for vulnerability management."
authors:
  - "zd"
draft: false
---
{{< lead >}}
*A handy utility to check CVE details via Red Hat Access API.*
{{< /lead >}}

> Vulnerability management is an essential IT security practice that involves identifying, assessing, and remediating security flaws in devices, networks, and applications, in order to reduce the risks of cyberattacks and security breaches.

One of the time-consuming task to support vulnerability management is ***post-scan validation***.

These includes false-postive verification, patch availability checking, and most important is "***Does the CVE applicable to me?***".

## RedHat Access

Luckily, RedHat has provide an excellent API access and CSAF/VEX framework to provide latest information.

> ***CSAF*** is a replacement for the Common Vulnerability Reporting Framework (CVRF).
> ***VEX*** is a profile in the CSAF standard.

In short, RedHat Product Security Center has provided an easy way to check CVE details for **post-scan validation** tasks.

## Util: rha_cve_check

The util is available at 2 formats: **Python script** `rha_cve_check.py`  and **Windows executable (exe)** `rha_cve_check.zip`. 
Both can be downloaded at the GitHub repo below.

> {{< github repo="myseq/utils" >}}

Below is how it works.

```console
$ ./rha_cve_check.py

usage: rha_cve_check.py [-h] [-v] <cve> [<cve> ...]

   Zzzzz   |\      _,,,---,,_
           /,`.-'`'    -.  ;-;;,_   __author__ : [ zd ]
          |,4-  ) )-,_..;\ (  `'-'  __year__   : [ 2024.09 ]
          '---''(_/--'  `-'\_)

         Retrieve CVE details directly via RedHat Security Data API.

         [ base_url = 'https://access.redhat.com/hydra/rest/securitydata' ]

positional arguments:
  <cve>       Specify a CVE or a list of CVEs.

options:
  -h, --help  show this help message and exit
  -v          verbose output

    RedHat Security Data API:

        See https://docs.redhat.com/en/documentation/red_hat_security_data_api/1.0/html-single/red_hat_security_data_api/index
```

Below is sample outputs to check on CUPS's cve.
Note that it can accept different format of the CVEs.

```console
c:\> rha_cve_check CVE-2024-47076 cve-2024-47175 2024-47176 2024-47177 -v

 [*] Searching 4/4 CVEs...

 [+] [200] https://access.redhat.com/hydra/rest/securitydata/cve/CVE-2024-47177.json
 [+] [200] https://access.redhat.com/hydra/rest/securitydata/cve/CVE-2024-47176.json
 [+] [200] https://access.redhat.com/hydra/rest/securitydata/cve/CVE-2024-47076.json
 [+] [200] https://access.redhat.com/hydra/rest/securitydata/cve/CVE-2024-47175.json

 [*] All [4 responses] are OK.

 [*] Successful fetched : 4/4

 [+] CVE-2024-47175 | cvss3:7.7 (released at 2024-09-26)
 [-] CVE-2024-47175 : cpe:/o:redhat:rhel_aus:7.7 [ Red Hat Enterprise Linux 7.7 Advanced Update Support ] Packages=cups-filters-0:1.0.35-26.el7_7.3 | RHSA-2024:7551 (2024-10-02)
 [-] CVE-2024-47175 : cpe:/o:redhat:rhel_els:7 [ Red Hat Enterprise Linux 7 Extended Lifecycle Support ] Packages=cups-filters-0:1.0.35-29.el7_9.3 | RHSA-2024:7553 (2024-10-02)
 [-] CVE-2024-47175 : cpe:/a:redhat:enterprise_linux:8 [ Red Hat Enterprise Linux 8 ] Packages=cups-filters-0:1.20.0-35.el8_10 | RHSA-2024:7463 (2024-10-01)
 [-] CVE-2024-47175 : cpe:/a:redhat:rhel_aus:8.2 [ Red Hat Enterprise Linux 8.2 Advanced Update Support ] Packages=cups-filters-0:1.20.0-19.el8_2.2 | RHSA-2024:7461 (2024-10-01)
 [-] CVE-2024-47175 : cpe:/a:redhat:rhel_aus:8.4 [ Red Hat Enterprise Linux 8.4 Advanced Mission Critical Update Support ] Packages=cups-filters-0:1.20.0-24.el8_4.2 | RHSA-2024:7504 (2024-10-02)
 [-] CVE-2024-47175 : cpe:/a:redhat:rhel_tus:8.4 [ Red Hat Enterprise Linux 8.4 Telecommunications Update Service ] Packages=cups-filters-0:1.20.0-24.el8_4.2 | RHSA-2024:7504 (2024-10-02)
 [-] CVE-2024-47175 : cpe:/a:redhat:rhel_e4s:8.4 [ Red Hat Enterprise Linux 8.4 Update Services for SAP Solutions ] Packages=cups-filters-0:1.20.0-24.el8_4.2 | RHSA-2024:7504 (2024-10-02)
 [-] CVE-2024-47175 : cpe:/a:redhat:rhel_aus:8.6 [ Red Hat Enterprise Linux 8.6 Advanced Mission Critical Update Support ] Packages=cups-filters-0:1.20.0-27.el8_6.3 | RHSA-2024:7623 (2024-10-03)
 [-] CVE-2024-47175 : cpe:/a:redhat:rhel_tus:8.6 [ Red Hat Enterprise Linux 8.6 Telecommunications Update Service ] Packages=cups-filters-0:1.20.0-27.el8_6.3 | RHSA-2024:7623 (2024-10-03)
 [-] CVE-2024-47175 : cpe:/a:redhat:rhel_e4s:8.6 [ Red Hat Enterprise Linux 8.6 Update Services for SAP Solutions ] Packages=cups-filters-0:1.20.0-27.el8_6.3 | RHSA-2024:7623 (2024-10-03)
 [-] CVE-2024-47175 : cpe:/a:redhat:rhel_eus:8.8 [ Red Hat Enterprise Linux 8.8 Extended Update Support ] Packages=cups-filters-0:1.20.0-29.el8_8.3 | RHSA-2024:7462 (2024-10-01)
 [-] CVE-2024-47175 : cpe:/a:redhat:enterprise_linux:9 [ Red Hat Enterprise Linux 9 ] Packages=cups-filters-0:1.28.7-17.el9_4 | RHSA-2024:7346 (2024-09-27)
 [-] CVE-2024-47175 : cpe:/a:redhat:rhel_e4s:9.0 [ Red Hat Enterprise Linux 9.0 Update Services for SAP Solutions ] Packages=cups-filters-0:1.28.7-10.el9_0.2 | RHSA-2024:7506 (2024-10-02)
 [-] CVE-2024-47175 : cpe:/a:redhat:rhel_eus:9.2 [ Red Hat Enterprise Linux 9.2 Extended Update Support ] Packages=cups-filters-0:1.28.7-11.el9_2.2 | RHSA-2024:7503 (2024-10-02)

 [-] Mitigation : See the security bulletin for a detailed mitigation procedure.
 [-] CVE-2024-47175 : cpe:/o:redhat:enterprise_linux:7 [Red Hat Enterprise Linux 7] cups (Fix deferred)
 [-] CVE-2024-47175 : cpe:/o:redhat:enterprise_linux:8 [Red Hat Enterprise Linux 8] cups (Fix deferred)
 [-] CVE-2024-47175 : cpe:/o:redhat:enterprise_linux:9 [Red Hat Enterprise Linux 9] cups (Fix deferred)
 [-] CVE-2024-47175 : cpe:/a:redhat:openshift:4 [Red Hat OpenShift Container Platform 4] rhcos (Not affected)

 [+] CVE-2024-47177 | cvss3:6.1 (released at 2024-09-26)
 [-] OS/package : Current investigation indicates that no versions of Red Hat Enterprise Linux (RHEL) are affected.

 [-] Mitigation : See the security bulletin for a detailed mitigation procedure.
 [-] CVE-2024-47177 : cpe:/o:redhat:enterprise_linux:7 [Red Hat Enterprise Linux 7] cups-filters (Not affected)
 [-] CVE-2024-47177 : cpe:/o:redhat:enterprise_linux:7 [Red Hat Enterprise Linux 7] foomatic (Will not fix)
 [-] CVE-2024-47177 : cpe:/o:redhat:enterprise_linux:8 [Red Hat Enterprise Linux 8] cups-filters (Affected)
 [-] CVE-2024-47177 : cpe:/o:redhat:enterprise_linux:8 [Red Hat Enterprise Linux 8] foomatic (Not affected)
 [-] CVE-2024-47177 : cpe:/o:redhat:enterprise_linux:9 [Red Hat Enterprise Linux 9] cups-filters (Affected)
 [-] CVE-2024-47177 : cpe:/o:redhat:enterprise_linux:9 [Red Hat Enterprise Linux 9] foomatic (Not affected)

 [+] CVE-2024-47176 | cvss3:7.5 (released at 2024-09-26)
 [-] CVE-2024-47176 : cpe:/o:redhat:rhel_aus:7.7 [ Red Hat Enterprise Linux 7.7 Advanced Update Support ] Packages=cups-filters-0:1.0.35-26.el7_7.3 | RHSA-2024:7551 (2024-10-02)
 [-] CVE-2024-47176 : cpe:/o:redhat:rhel_els:7 [ Red Hat Enterprise Linux 7 Extended Lifecycle Support ] Packages=cups-filters-0:1.0.35-29.el7_9.3 | RHSA-2024:7553 (2024-10-02)
 [-] CVE-2024-47176 : cpe:/a:redhat:enterprise_linux:8 [ Red Hat Enterprise Linux 8 ] Packages=cups-filters-0:1.20.0-35.el8_10 | RHSA-2024:7463 (2024-10-01)
 [-] CVE-2024-47176 : cpe:/a:redhat:rhel_aus:8.2 [ Red Hat Enterprise Linux 8.2 Advanced Update Support ] Packages=cups-filters-0:1.20.0-19.el8_2.2 | RHSA-2024:7461 (2024-10-01)
 [-] CVE-2024-47176 : cpe:/a:redhat:rhel_aus:8.4 [ Red Hat Enterprise Linux 8.4 Advanced Mission Critical Update Support ] Packages=cups-filters-0:1.20.0-24.el8_4.2 | RHSA-2024:7504 (2024-10-02)
 [-] CVE-2024-47176 : cpe:/a:redhat:rhel_tus:8.4 [ Red Hat Enterprise Linux 8.4 Telecommunications Update Service ] Packages=cups-filters-0:1.20.0-24.el8_4.2 | RHSA-2024:7504 (2024-10-02)
 [-] CVE-2024-47176 : cpe:/a:redhat:rhel_e4s:8.4 [ Red Hat Enterprise Linux 8.4 Update Services for SAP Solutions ] Packages=cups-filters-0:1.20.0-24.el8_4.2 | RHSA-2024:7504 (2024-10-02)
 [-] CVE-2024-47176 : cpe:/a:redhat:rhel_aus:8.6 [ Red Hat Enterprise Linux 8.6 Advanced Mission Critical Update Support ] Packages=cups-filters-0:1.20.0-27.el8_6.3 | RHSA-2024:7623 (2024-10-03)
 [-] CVE-2024-47176 : cpe:/a:redhat:rhel_tus:8.6 [ Red Hat Enterprise Linux 8.6 Telecommunications Update Service ] Packages=cups-filters-0:1.20.0-27.el8_6.3 | RHSA-2024:7623 (2024-10-03)
 [-] CVE-2024-47176 : cpe:/a:redhat:rhel_e4s:8.6 [ Red Hat Enterprise Linux 8.6 Update Services for SAP Solutions ] Packages=cups-filters-0:1.20.0-27.el8_6.3 | RHSA-2024:7623 (2024-10-03)
 [-] CVE-2024-47176 : cpe:/a:redhat:rhel_eus:8.8 [ Red Hat Enterprise Linux 8.8 Extended Update Support ] Packages=cups-filters-0:1.20.0-29.el8_8.3 | RHSA-2024:7462 (2024-10-01)
 [-] CVE-2024-47176 : cpe:/a:redhat:enterprise_linux:9 [ Red Hat Enterprise Linux 9 ] Packages=cups-filters-0:1.28.7-17.el9_4 | RHSA-2024:7346 (2024-09-27)
 [-] CVE-2024-47176 : cpe:/a:redhat:rhel_e4s:9.0 [ Red Hat Enterprise Linux 9.0 Update Services for SAP Solutions ] Packages=cups-filters-0:1.28.7-10.el9_0.2 | RHSA-2024:7506 (2024-10-02)
 [-] CVE-2024-47176 : cpe:/a:redhat:rhel_eus:9.2 [ Red Hat Enterprise Linux 9.2 Extended Update Support ] Packages=cups-filters-0:1.28.7-11.el9_2.2 | RHSA-2024:7503 (2024-10-02)

 [-] Mitigation : See the security bulletin for a detailed mitigation procedure.

 [+] CVE-2024-47076 | cvss3:8.2 (released at 2024-09-26)
 [-] CVE-2024-47076 : cpe:/o:redhat:rhel_aus:7.7 [ Red Hat Enterprise Linux 7.7 Advanced Update Support ] Packages=cups-filters-0:1.0.35-26.el7_7.3 | RHSA-2024:7551 (2024-10-02)
 [-] CVE-2024-47076 : cpe:/o:redhat:rhel_els:7 [ Red Hat Enterprise Linux 7 Extended Lifecycle Support ] Packages=cups-filters-0:1.0.35-29.el7_9.3 | RHSA-2024:7553 (2024-10-02)
 [-] CVE-2024-47076 : cpe:/a:redhat:enterprise_linux:8 [ Red Hat Enterprise Linux 8 ] Packages=cups-filters-0:1.20.0-35.el8_10 | RHSA-2024:7463 (2024-10-01)
 [-] CVE-2024-47076 : cpe:/a:redhat:rhel_aus:8.2 [ Red Hat Enterprise Linux 8.2 Advanced Update Support ] Packages=cups-filters-0:1.20.0-19.el8_2.2 | RHSA-2024:7461 (2024-10-01)
 [-] CVE-2024-47076 : cpe:/a:redhat:rhel_aus:8.4 [ Red Hat Enterprise Linux 8.4 Advanced Mission Critical Update Support ] Packages=cups-filters-0:1.20.0-24.el8_4.2 | RHSA-2024:7504 (2024-10-02)
 [-] CVE-2024-47076 : cpe:/a:redhat:rhel_tus:8.4 [ Red Hat Enterprise Linux 8.4 Telecommunications Update Service ] Packages=cups-filters-0:1.20.0-24.el8_4.2 | RHSA-2024:7504 (2024-10-02)
 [-] CVE-2024-47076 : cpe:/a:redhat:rhel_e4s:8.4 [ Red Hat Enterprise Linux 8.4 Update Services for SAP Solutions ] Packages=cups-filters-0:1.20.0-24.el8_4.2 | RHSA-2024:7504 (2024-10-02)
 [-] CVE-2024-47076 : cpe:/a:redhat:rhel_aus:8.6 [ Red Hat Enterprise Linux 8.6 Advanced Mission Critical Update Support ] Packages=cups-filters-0:1.20.0-27.el8_6.3 | RHSA-2024:7623 (2024-10-03)
 [-] CVE-2024-47076 : cpe:/a:redhat:rhel_tus:8.6 [ Red Hat Enterprise Linux 8.6 Telecommunications Update Service ] Packages=cups-filters-0:1.20.0-27.el8_6.3 | RHSA-2024:7623 (2024-10-03)
 [-] CVE-2024-47076 : cpe:/a:redhat:rhel_e4s:8.6 [ Red Hat Enterprise Linux 8.6 Update Services for SAP Solutions ] Packages=cups-filters-0:1.20.0-27.el8_6.3 | RHSA-2024:7623 (2024-10-03)
 [-] CVE-2024-47076 : cpe:/a:redhat:rhel_eus:8.8 [ Red Hat Enterprise Linux 8.8 Extended Update Support ] Packages=cups-filters-0:1.20.0-29.el8_8.3 | RHSA-2024:7462 (2024-10-01)
 [-] CVE-2024-47076 : cpe:/a:redhat:enterprise_linux:9 [ Red Hat Enterprise Linux 9 ] Packages=cups-filters-0:1.28.7-17.el9_4 | RHSA-2024:7346 (2024-09-27)
 [-] CVE-2024-47076 : cpe:/a:redhat:rhel_e4s:9.0 [ Red Hat Enterprise Linux 9.0 Update Services for SAP Solutions ] Packages=cups-filters-0:1.28.7-10.el9_0.2 | RHSA-2024:7506 (2024-10-02)
 [-] CVE-2024-47076 : cpe:/a:redhat:rhel_eus:9.2 [ Red Hat Enterprise Linux 9.2 Extended Update Support ] Packages=cups-filters-0:1.28.7-11.el9_2.2 | RHSA-2024:7503 (2024-10-02)

 [-] Mitigation : See the security bulletin for a detailed mitigation procedure.

 [*] main(): completed within [0.8496 sec].

```


## Links 

 - [What is vulnerability management?](https://www.redhat.com/en/topics/security/what-is-vulnerability-management#risk-based-vulnerability-management)
 - [Common Security Advisory Framework](https://oasis-open.github.io/csaf-documentation/) (CSAF)
 - [What is VEX?](https://github.com/oasis-tcs/csaf/blob/master/csaf_2.0/guidance/faq.md#what-is-vex-and-how-is-it-supported-in-csaf)


