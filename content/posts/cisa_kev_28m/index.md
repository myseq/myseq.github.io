---
title: "State of KEV After 28 months"
date: 2024-03-01T17:58:53+08:00
tags: [ "cisa", "kev", "vulnmgmt" ]
categories: [ "Posts"  ]
series: [ "CISA_KEV" ]
series_order: 4
summary: "Analysis of CISA KEV catalog."
draft: false
---
{{< lead >}}
CISA KEV has been released 28 months.
Today, there are total of ***1083*** CVE been added to CISA KEV catalog.

*CISA Catalog of Known Exploited Vulnerabilities [ ***2024.02.29/1083*** ]*
{{< /lead >}}

## Updates

As of today, there are total of 1078 CVE have overdue, and another 5 will due in March 2024.  

Highlights (within CISA KEV catalog):
 - The top-5 vendors with highest number of vulnerabilities remain the **same** (total 171 vendors). 
 - The top-5 vendors hold ***543*** (around 50%) of all the 1083 CVE.
 - The top-5 vulnerable products remain the **same** (total 456 products).
 - There are ***234*** (or 21%) CVE found at the top-5 vulnerable products. 
 - The mean value increases to **90.25** (was 87.75).
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
        data: [280, 73, 69, 67, 54, 540],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Microsoft|Apple|Cisco|Adobe|Google|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|280|73|69|67|54|540|

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
    labels: ['Windows', 'Multiple Products (Apple)', 'Internet Explorer', 'Flash Player', 'Chromium V8', 'others'],
    datasets: [{
        label: 'count',
        data: [110, 36, 31, 29, 28, 849],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Windows|Multiple Products (Apple)|Internet Explorer|Flash Player|Chromium V8|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|110|36|31|29|28|849|

---


  {{< chart >}}
  type: "scatter",
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [ {
      type: "bar",
      label: '2024.02.29 (1083)',
      data: [28, 32, 126, 157, 233, 146, 58, 46, 47, 45, 125, 40],
      backgroundColor: ['#36A2EB33', '#36A2EB33', '#FF638433', '#FF638433', '#FF638433', '#FF638433', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#FF638433', '#36A2EB33'],
      borderColor: ['#36A2EB', '#36A2EB', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#FF6384', '#36A2EB'],
      borderWidth: 1
  }, {
      label: 'Mean:',
      data: [90.25, 90.25, 90.25, 90.25, 90.25, 90.25, 90.25, 90.25, 90.25, 90.25, 90.25, 90.25],
      borderWidth: 1,
      pointRadius: 0,
      type: "line"
    }]
  },

  options: {
    plugins: {
      legend: { display: false },
      title: { display: true, color: 'white', font: { size: 18, weight: 'bold' }, text: 'Distribution of KEV (by_month) vs mean = 90.25' }
    }
  }

  {{< /chart >}}


`mean_val=90.25`

|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|28|32|126|157|233|146|58|46|47|45|125|40|



