---
title: "32-Month Update with CISA KEV"
date: 2024-07-01T02:28:53+08:00
tags: [ "cisa", "kev", "vulnmgmt" ]
categories: [ "Posts"  ]
series: [ "CISA_KEV" ]
series_order: 6
summary: "Analysis updates of CISA KEV catalog."
draft: false
---
{{< lead >}}
CISA KEV has been released 32 months.
Today, there are total of ***1126*** (*+23*) CVE been added to CISA KEV catalog.

*CISA Catalog of Known Exploited Vulnerabilities [ ***2024.06.26/1126*** ]*
{{< /lead >}}

## Updates

As of today, there are total of 1118 CVE have overdue, and another 8 will due in July 2024.  

Highlights (within CISA KEV catalog):
 - The top-5 vendors with highest number of vulnerabilities remain the **same** (total 179 vendors). 
 - The top-5 vendors hold ***558*** (around 49%) of all the 1126 CVEs.
 - The top-5 vulnerable products remain the **same** (total 463 products).
 - There are ***242*** (or ~21%) CVE found at the top-5 vulnerable products. 
 - The mean value increases to **93.83** (was 91.92).
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
        data: [287, 75, 71, 67, 58, 568],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Microsoft|Apple|Cisco|Adobe|Google|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|287|75|71|67|58|568|

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
    labels: ['Windows', 'Multiple Products (Apple)', 'Internet Explorer', 'Chromium V8', 'Flash Player', 'others'],
    datasets: [{
        label: 'count',
        data: [114, 38, 31, 30, 29, 884],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Windows|Multiple Products (Apple)|Internet Explorer|Chromium V8|Flash Player|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|114|38|31|30|29|884|

---


  {{< chart >}}
  type: "scatter",
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [ {
      type: "bar",
      label: '2024.06.26 (1126)',
      data: [28, 32, 132, 164, 241, 160, 66, 46, 47, 45, 125, 40],
      backgroundColor: ['#36A2EB33', '#36A2EB33', '#FF638433', '#FF638433', '#FF638433', '#FF638433', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33',
'#FF638433', '#36A2EB33'],
      borderColor: ['#36A2EB', '#36A2EB', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#FF6384', '#36A2EB'],
      borderWidth: 1
  }, {
      label: 'Mean:',
      data: [93.83333333333333, 93.83333333333333, 93.83333333333333, 93.83333333333333, 93.83333333333333, 93.83333333333333, 93.83333333333333,
93.83333333333333, 93.83333333333333, 93.83333333333333, 93.83333333333333, 93.83333333333333],
      borderWidth: 1,
      pointRadius: 0,
      type: "line"
    }]
  },

  options: {
    plugins: {
      legend: { display: false },
      title: { display: true, color: 'white', font: { size: 18, weight: 'bold' }, text: 'Distribution of KEV (by_month) vs mean = 93.83333333333333' }
    }
  }

  {{< /chart >}}


`mean_val=93.83333333333333`

|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|28|32|132|164|241|160|66|46|47|45|125|40|


