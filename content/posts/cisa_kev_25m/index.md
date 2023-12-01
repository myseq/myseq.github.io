---
title: "State of KEV After 25 months"
date: 2023-12-01T09:07:53+08:00
tags: [ "cisa", "kev", "vulnmgmt" ]
categories: [ "Posts"  ]
summary: "See what happen to CISA KEV cataglog in Nov 2023."
draft: false
---
{{< lead >}}
There are total of 18 CVE been added to CISA KEV catalog in November 2023.
{{< /lead >}}

## Updates

As of today, 8 CVE have overdue (within Nov), and another 10 will due in Dec 2023. 

Highlights:
 - The top-5 vendors with highest number of vulnerabilities remain the **same**. 
 - The top-5 vulnerable products remain the **same**.
 - The mean value increases to **86.916** (was 85.4167)
 - The top-5 months where distribution of KEV is higher than `mean` remain the **same**.

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
        data: [275, 68, 67, 65, 51, 517],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Microsoft|Apple|Cisco|Adobe|Google|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|275|68|67|65|51|517|

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
        data: [108, 31, 31, 29, 25, 819],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Windows|Multiple Products (Apple)|Internet Explorer|Flash Player|Chromium V8 Engine|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|108|31|31|29|25|819|

---


  {{< chart >}}
  type: "scatter",
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [ {
      type: "bar",
      label: '2023.11.30 (1043)',
      data: [14, 20, 120, 157, 233, 146, 58, 46, 48, 45, 125, 31],
      backgroundColor: ['#36A2EB33', '#36A2EB33', '#FF638433', '#FF638433', '#FF638433', '#FF638433', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33',
'#FF638433', '#36A2EB33'],
      borderColor: ['#36A2EB', '#36A2EB', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#FF6384', '#36A2EB'],
      borderWidth: 1
  }, {
      label: 'Mean:',
      data: [86.91666666666667, 86.91666666666667, 86.91666666666667, 86.91666666666667, 86.91666666666667, 86.91666666666667, 86.91666666666667,
86.91666666666667, 86.91666666666667, 86.91666666666667, 86.91666666666667, 86.91666666666667],
      borderWidth: 1,
      pointRadius: 0,
      type: "line"
    }]
  },

  options: {
    plugins: {
      legend: { display: false },
      title: { display: true, color: 'white', font: { size: 18, weight: 'bold' }, text: 'Distribution of KEV (by_month) vs mean = 86.91666666666667' }
    }
  }

  {{< /chart >}}


`mean_val=86.91666666666667`

|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|14|20|120|157|233|146|58|46|48|45|125|31|
