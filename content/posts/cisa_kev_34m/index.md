---
title: "34-Month Update with CISA KEV"
date: 2024-09-01T09:28:53+08:00
tags: [ "cisa", "kev", "vulnmgmt" ]
categories: [ "Posts"  ]
series: [ "CISA_KEV" ]
series_order: 7
summary: "Analysis updates of CISA KEV catalog."
draft: false
---
{{< lead >}}
CISA KEV has been released 34 months.
Today, there are total of ***1159*** (*+33*) CVE been added to CISA KEV catalog.

*CISA Catalog of Known Exploited Vulnerabilities [ ***2024.08.28/1159*** ]*
{{< /lead >}}

## Updates

As of today, there are total of 1143 CVE have overdue, and another 16 will due in Sep 2024.  

Highlights (within CISA KEV catalog):
 - The top-5 vendors with highest number of vulnerabilities remain the **same** (total 184 vendors). 
 - The top-5 vendors hold ***573*** (around 49%) of all the 1159 CVEs.
 - The top-5 vulnerable products remain the **same** (total 475 products).
 - There are ***252*** (or ~22%) CVE found at the top-5 vulnerable products. 
 - One difference is, **Chromium V8** (32) has overtook **Internet Explorer** (32) as the third position in top-vulnerable products.
 - The mean value increases to **96.58** (was 93.83).
 - The top-5 months where distribution of KEV is higher than `mean` remain the **same** (*Mar, Apr, May Jun, Nov*).

## Current State

{{< chart >}}
  type: "doughnut",
  options: {
    plugins: {
        legend: { labels: { font: { size: 14, weight: 'normal' }, color: 'white' } },
        title: { display: true, color: 'white', font: { size: 18, weight: 'bold' }, text: 'Top 5 Vendors' }
    }
  },
  data: {
    labels: ['Microsoft', 'Apple', 'Cisco', 'Adobe', 'Google', 'others'],
    datasets: [{
        label: 'count',
        data: [298, 75, 72, 68, 60, 586],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

{{< /chart >}}


|Microsoft|Apple|Cisco|Adobe|Google|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|298|75|72|68|60|586|


---


{{< chart >}}
  type: "doughnut",
  options: {
    plugins: {
        legend: { labels: { font: { size: 14, weight: 'normal' }, color: 'white' } },
        title: { display: true, color: 'white', font: { size: 18, weight: 'bold' }, text: 'Top 5 Products' }
    }
  },
  data: {
    labels: ['Windows', 'Multiple Products (Apple)', 'Chromium V8', 'Internet Explorer', 'Flash Player', 'others'],
    datasets: [{
        label: 'count',
        data: [121, 38, 32, 32, 29, 907],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

{{< /chart >}}


|Windows|Multiple Products (Apple)|Chromium V8|Internet Explorer|Flash Player|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|121|38|32|32|29|907|

---


  {{< chart >}}
  type: "scatter",
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [ {
      type: "bar",
      label: '2024.08.28 (1159)',
      data: [28, 32, 132, 164, 241, 160, 70, 59, 63, 45, 125, 40],
      backgroundColor: ['#36A2EB33', '#36A2EB33', '#FF638433', '#FF638433', '#FF638433', '#FF638433', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33',
'#FF638433', '#36A2EB33'],
      borderColor: ['#36A2EB', '#36A2EB', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#FF6384', '#36A2EB'],
      borderWidth: 1
  }, {
      label: 'Mean:',
      data: [96.58333333333333, 96.58333333333333, 96.58333333333333, 96.58333333333333, 96.58333333333333, 96.58333333333333, 96.58333333333333,
96.58333333333333, 96.58333333333333, 96.58333333333333, 96.58333333333333, 96.58333333333333],
      borderWidth: 1,
      pointRadius: 0,
      type: "line"
    }]
  },

  options: {
    plugins: {
      legend: { display: false },
      title: { display: true, color: 'white', font: { size: 18, weight: 'bold' }, text: 'Distribution of KEV (by_month) vs mean = 96.58333333333333' }
    }
  }

  {{< /chart >}}


`mean_val=96.58333333333333`

|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|28|32|132|164|241|160|70|59|63|45|125|40|


