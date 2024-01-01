---
title: "State of KEV After 26 months"
date: 2024-01-01T01:37:53+08:00
tags: [ "cisa", "kev", "vulnmgmt" ]
categories: [ "Posts"  ]
series: [ "CISA_KEV" ]
series_order: 3
summary: "Summarize CISA KEV cataglog by end of 2023."
draft: false
---
{{< lead >}}
There are total of ***1053*** CVE been added to CISA KEV catalog by end of 2023.

*CISA Catalog of Known Exploited Vulnerabilities [ ***2023.12.21/1053*** ]*
{{< /lead >}}

## Updates

As of today, there are total of 1051 CVE have overdue, and another 2 will due in Jan 2024. 

Highlights:
 - The top-5 vendors with highest number of vulnerabilities remain the **same** (total 169 vendors). 
 - The top-5 vendors hold ***523*** (around 50%) of all the 1053 CVE within CISA KEV catalog.
 - The top-5 vulnerable products remain the **same** (total 420 products).
 - There are ***226*** (or 21%) CVE found at the top-5 vulnerable products. 
 - The mean value increases to **87.75** (was 86.916).
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
        data: [275, 70, 67, 65, 51, 525],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Microsoft|Apple|Cisco|Adobe|Google|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|275|70|67|65|51|525|

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
    labels: ['Windows', 'Multiple Products (Apple)', 'Internet Explorer', 'Flash Player', 'Chromium V8 Engine', 'others'],
    datasets: [{
        label: 'count',
        data: [108, 33, 31, 29, 25, 827],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Windows|Multiple Products (Apple)|Internet Explorer|Flash Player|Chromium V8 Engine|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|108|33|31|29|25|827|

---


  {{< chart >}}
  type: "scatter",
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [ {
      type: "bar",
      label: '2023.12.21 (1053)',
      data: [16, 20, 120, 157, 233, 146, 58, 46, 47, 45, 125, 40],
      backgroundColor: ['#36A2EB33', '#36A2EB33', '#FF638433', '#FF638433', '#FF638433', '#FF638433', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33',
'#FF638433', '#36A2EB33'],
      borderColor: ['#36A2EB', '#36A2EB', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#FF6384', '#36A2EB'],
      borderWidth: 1
  }, {
      label: 'Mean:',
      data: [87.75, 87.75, 87.75, 87.75, 87.75, 87.75, 87.75, 87.75, 87.75, 87.75, 87.75, 87.75],
      borderWidth: 1,
      pointRadius: 0,
      type: "line"
    }]
  },

  options: {
    plugins: {
      legend: { display: false },
      title: { display: true, color: 'white', font: { size: 18, weight: 'bold' }, text: 'Distribution of KEV (by_month) vs mean = 87.75' }
    }
  }

  {{< /chart >}}


`mean_val=87.75`

|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|16|20|120|157|233|146|58|46|47|45|125|40|


