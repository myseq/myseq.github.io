---
title: "30-Month Update with CISA KEV"
date: 2024-05-01T20:28:53+08:00
tags: [ "cisa", "kev", "vulnmgmt" ]
categories: [ "Posts"  ]
series: [ "CISA_KEV" ]
series_order: 5
summary: "Analysis updates of CISA KEV catalog."
draft: false
---
{{< lead >}}
CISA KEV has been released 30 months.
Today, there are total of ***1103*** (*+20*) CVE been added to CISA KEV catalog.

*CISA Catalog of Known Exploited Vulnerabilities [ ***2024.04.30/1103*** ]*
{{< /lead >}}

## Updates

As of today, there are total of 1099 CVE have overdue, and another 4 will due in May 2024.  

Highlights (within CISA KEV catalog):
 - The top-5 vendors with highest number of vulnerabilities remain the **same** (total 174 vendors). 
 - The top-5 vendors hold ***551*** (around 50%) of all the 1103 CVE.
 - The top-5 vulnerable products remain the **same** (total 453 products).
 - There are ***253*** (or ~27%) CVE found at the top-5 vulnerable products. 
 - The mean value increases to **91.91** (was 90.25).
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
        data: [284, 75, 71, 67, 54, 552],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Microsoft|Apple|Cisco|Adobe|Google|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|284|75|71|67|54|552|

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
        data: [112, 38, 31, 29, 28, 865],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Windows|Multiple Products (Apple)|Internet Explorer|Flash Player|Chromium V8|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|112|38|31|29|28|865|

---


  {{< chart >}}
  type: "scatter",
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [ {
      type: "bar",
      label: '2024.04.30 (1103)',
      data: [28, 32, 132, 164, 240, 146, 58, 46, 47, 45, 125, 40],
      backgroundColor: ['#36A2EB33', '#36A2EB33', '#FF638433', '#FF638433', '#FF638433', '#FF638433', '#36A2EB33',
'#36A2EB33', '#36A2EB33', '#36A2EB33', '#FF638433', '#36A2EB33'],
      borderColor: ['#36A2EB', '#36A2EB', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#36A2EB', '#36A2EB', '#36A2EB',
'#36A2EB', '#FF6384', '#36A2EB'],
      borderWidth: 1
  }, {
      label: 'Mean:',
      data: [91.91666666666667, 91.91666666666667, 91.91666666666667, 91.91666666666667, 91.91666666666667,
91.91666666666667, 91.91666666666667, 91.91666666666667, 91.91666666666667, 91.91666666666667, 91.91666666666667,
91.91666666666667],
      borderWidth: 1,
      pointRadius: 0,
      type: "line"
    }]
  },

  options: {
    plugins: {
      legend: { display: false },
      title: { display: true, color: 'white', font: { size: 18, weight: 'bold' }, text: 'Distribution of KEV (by_month) vs mean = 91.91666666666667' }
    }
  }

  {{< /chart >}}



`mean_val=91.91666666666667`

|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|28|32|132|164|240|146|58|46|47|45|125|40|


