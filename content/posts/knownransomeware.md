---
title: "Ransomware Campaign"
date: 2026-09-20T17:18:35+08:00
tags: [ "cisa", "kev", "ransomware" ]
categories: [ "Posts"  ]
summary: "Tracking ransomeware in CISA KEV."
draft: false
---
{{< lead >}}
*Some KEV are flipped to `Known` state in 1 day.*
{{< /lead >}}

While I check out at **CISA KEV Tracker**[^1] today, it shows total of **1716** KEV (with the latest 3 KEV added in 2026-09-18). 

[^1]: http://github.com/myseq/tracker

And I also curious about how often does CISA updated the `knownRansomwareCampaignUse` status.


{{< alert >}}
`knownRansomwareCampaignUse` is a metadata field utilized within the CISA Known Exploited Vulnerabilities (KEV) Catalog. 
It is to indicate whether a specific Common Vulnerabilities and Exposures (CVE) identifier is actively weaponized by ransomware actors.
{{< /alert >}}

After a quick search, I manage to found a copy of CSV[^2] from **GreyNoise**.
It includes 59 KEVs with the **Date Flipped**, from *Unknown* to ***Known***.

[^2]: https://info.greynoise.io/hubfs/artifacts/ransomware-status-changes-2025.csv

OK, let's start with basic count on these **59 KEV**.

## KEV Count

Below are the number of CVE been added into KEV catalog by year, and then been flipped to `Known` state.

| Year </br>(Date added) | CVE Count | Percentage |
| :---------------- | --------: | :--------: |
| 2021 | 5 | 8.5% |
| 2022 | 13 | 22.0% |
| 2023 | 3 | 5.1% |
| 2024 | 14 | 23.7% |
| 2025 | 24 | 40.7% |
| | **59** | **100.0%** |

Below are the number of KEV been flipped to `Known` state by year.

| Year</br> (Date Flipped) | CVE Count | Percentage |
| :------------------ | :-------- | :--------- |
| 2025 | 59 | 100% |

GreyNoise did a great analysis and presentation of the data.

Like mentioned by GreyNoise: ***Today, ransomware operators are integrating fresh exploits into their playbooks faster than defenders are patching.***

## Known Ransomware Campaign Use

> I tried to redraw (with some grouping) the same data presented from GreyNoise with Mermaid.

<!--
<div style="width:100%; max-width:600px; overflow-x:auto;">
  <pre class="mermaid">

 Paste the Mermaid code here 

  </pre>
</div>
-->

Each of KEV is labelled with the number of days required to flip to `Known` state since it was added in CISA KEV catalog.

{{< mermaid >}}
---
config:
  gantt:
    barHeight: 14
    barGap: 6
    fontSize: 10
    sectionFontSize: 16
    leftPadding: 96
    rightPadding: 64
    topAxis: true
  themeCSS: "
    g.axis, g.tick { display: none; }
    .taskText { fill: #303030 !important; }
    .sectionText { fill: #FF0000 !important; }
  "
  themeVariables:
    milestoneBkgColor: "#8080FF"
    milestoneBorderColor: "#DBDBDB"
    critBkgColor: "#FF0000"
    critBorderColor: "#DBDBDB"
    #activeTaskBkgColor: "#CA8A04"
    activeTaskBkgColor: "#FFDF00"
    activeTaskBorderColor: "#DBDBDB"
    #doneTaskBkgColor: "#16A34A"
    doneTaskBkgColor: "#DFFF00"
    doneTaskBorderColor: "#DBDBDB"

    taskTextColor: "#303030"
    taskTextOutsideColor: "currentColor"
    sectionTextColor: "#FF0000"

    sectionBkgColor: "#303030"
    sectionBkgColor2: "#707070"
    #sectionBkgColor: "rgba(48, 48, 48, 0.05)"
    #sectionBkgColor2: "rgba(112, 112, 112, 0.02)"
    gridColor: "rgba(156, 163, 175, 0.3)"

---
gantt
    title CISA KEV knownRansomwareCampaignUse
    dateFormat YYYY-MM-DD
    todayMarker off

    section Y2021 [5]
    CVE-2019-11580 (1286d) :done, 2021-11-03, 2025-05-12
    CVE-2021-22205 (1286d) :done, 2021-11-03, 2025-05-12
    CVE-2014-1812 (1286d) :done, 2021-11-03, 2025-05-12
    CVE-2019-0708 (1353d) :done, 2021-11-03, 2025-07-18
    CVE-2021-43890 (1245d) :done, 2021-12-15, 2025-05-13

    section Y2022 [13]
    Y2022: vert,2022-01-01, 1year
    CVE-2015-7645 (1166d) :done, 2022-03-03, 2025-05-12
    CVE-2008-2992 (1166d) :done, 2022-03-03, 2025-05-12
    CVE-2012-4681 (1183d) :done, 2022-03-03, 2025-05-29
    CVE-2022-21999 (1145d) :done, 2022-03-25, 2025-05-13
    CVE-2012-1710 (1100d) :done, 2022-05-25, 2025-05-29
    CVE-2022-30190 (1063d) :done, 2022-06-14, 2025-05-12
    CVE-2022-27924 (1029d) :done, 2022-08-04, 2025-05-29
    CVE-2022-30333 (1024d) :done, 2022-08-09, 2025-05-29
    CVE-2022-27925 (966d) :done, 2022-08-11, 2025-04-03
    CVE-2022-37042 (966d) :done, 2022-08-11, 2025-04-03
    CVE-2022-2294 (992d) :done, 2022-08-25, 2025-05-13
    CVE-2022-41091 (916d) :done, 2022-11-08, 2025-05-12
    CVE-2022-42475 (846d) :done, 2022-12-13, 2025-04-07

    section Y2023 [3]
    Y2023: vert,2023-01-01, 1year
    CVE-2015-2291 (806d) :done, 2023-02-10, 2025-04-26
    CVE-2023-23376 (762d) :done, 2023-02-14, 2025-03-17
    CVE-2017-6884 (602d) :done, 2023-09-18, 2025-05-12

    section Y2024 [14]
    Y2024: vert,2024-01-01, 1year
    CVE-2023-46805 (637d) :done, 2024-01-10, 2025-10-08
    CVE-2024-21887 (637d) :done, 2024-01-10, 2025-10-08
    CVE-2024-21893 (616d) :done, 2024-01-31, 2025-10-08
    CVE-2024-21762 (486d) :done, 2024-02-09, 2025-06-09
    CVE-2024-21412 (603d) :done, 2024-02-13, 2025-10-08
    CVE-2021-44529 (432d) :done, 2024-03-25, 2025-05-31
    CVE-2024-3400 (360d) :done, 2024-04-12, 2025-04-07
    CVE-2024-30051 (328d) :done, 2024-05-14, 2025-04-07
    CVE-2023-43208 (379d) :done, 2024-05-20, 2025-06-03
    CVE-2024-24919 (272d) :done, 2024-05-30, 2025-02-26
    CVE-2024-1086 (519d) :done, 2024-05-30, 2025-10-31
    CVE-2024-38094 (167d) :done, 2024-10-22, 2025-04-07
    CVE-2024-0012 (175d) :done, 2024-11-18, 2025-05-12
    CVE-2024-9474 (346d) :done, 2024-11-18, 2025-10-30

    section Y2025 [24]
    Y2025: vert,2025-01-01, 1year
    CVE-2024-55550 (125d) :done, 2025-01-07, 2025-05-12
    CVE-2024-41713 (125d) :done, 2025-01-07, 2025-05-12
    CVE-2025-0282 (124d) :done, 2025-01-08, 2025-05-12
    CVE-2023-48365 (63d) :done, 2025-01-13, 2025-03-17
    CVE-2024-55591 (62d) :done, 2025-01-14, 2025-03-17
    CVE-2025-23006 (108d) :done, 2025-01-24, 2025-05-12
    CVE-2024-57727 (103d) :done, 2025-02-13, 2025-05-27
    CVE-2024-53704 (304d) :done, 2025-02-18, 2025-12-19
    CVE-2018-8639 (35d) :done, 2025-03-03, 2025-04-07
    CVE-2025-26633 (20d) :active, 2025-03-11, 2025-03-31
    CVE-2025-24472 (1d) :milestone, 2025-03-18, 2025-03-19
    CVE-2025-22457 (38d) :done, 2025-04-04, 2025-05-12
    CVE-2025-31161 (2d) :milestone, 2025-04-07, 2025-04-09
    CVE-2025-29824 (1d) :milestone, 2025-04-08, 2025-04-09
    CVE-2025-31324 (16d) :active, 2025-04-29, 2025-05-15
    CVE-2019-6693 (19d) :active, 2025-06-25, 2025-07-14
    CVE-2025-5777 (36d) :done, 2025-07-10, 2025-08-15
    CVE-2025-53770 (15d) :active, 2025-07-20, 2025-08-04
    CVE-2025-49704 (2d) :milestone, 2025-07-22, 2025-07-24
    CVE-2025-49706 (2d) :milestone, 2025-07-22, 2025-07-24
    CVE-2025-10035 (8d) :active, 2025-09-29, 2025-10-07
    CVE-2025-61882 (1d) :milestone, 2025-10-06, 2025-10-07
    CVE-2025-61884 (2d) :milestone, 2025-10-20, 2025-10-22
    CVE-2025-55182 (7d) :crit, 2025-12-05, 2025-12-12
    Y2026: vert,2026-01-01, 1year

{{< /mermaid >}}

### Analysis

 1. All the 59 KEV are flipped to `Known` state in year 2025.
 1. Starting from 2024H2, the days required to flip to `Known` state is getting less (< 8 days).
 1. Some KEV are flipped in 1 day since 2025.
 
## Links

 - GreyNoise's [The Noise in the Silence: Unmasking CISA's Hidden KEV Ransomware Updates](https://www.greynoise.io/blog/unmasking-cisas-hidden-kev-ransomware-updates)


