---
title: "CISA KEV Distribution"
date: 2023-11-01T17:54:42+08:00
tags: ["chart", "cisa", "kev", "graph", "shortcodes"]
categories: [ "Posts"  ]
summary: "How can we identify the trends and patterns in CISA KEV?"
draft: true
---
{{< lead >}}
What we can learn from CISA KEV after 24 months?
{{< /lead >}}

## CISA KEV

The CISA Known Exploited Vulnerabilities (KEV) catalog, launched in Nov 2021, is a list of vulnerabilities that are actively exploited by malicious actors. 

As of today, the list has grown up to `1020` vulnerabilities. This is a valuable resource for organizations to prioritize their vulnerability remediation efforts and protect themselves from cyber attacks.

Here are some key takeaways from the CISA KEV catalog:
 - Many of the vulnerabilities in the KEV catalog are old and well-known, highlighting the importance of regular patching.
 - Organizations should implement a layered security approach to protect against known exploited vulnerabilities, including patching, security awareness training, and network segmentation.
 - It is important to monitor systems for suspicious activity to detect and respond to cyber attacks early.

## Data Analysis 

With these 24 months data, can we learn something out of it? Maybe for some funs ?

To have some funs for analysing the CISA KEV, we can:
 1. Download a copy of the [KEV JSON file](https://www.cisa.gov/sites/default/files/feeds/known_exploited_vulnerabilities.json).
 2. Visualize the data with charts (like [Taipy](https://www.taipy.io)).
 3. Identify the trends and patterns:
     - show the top-5 vulnerable vendors.
     - show the top-5 vulnerable products.
     - compare the data to previous year.
     - correlate with the number of cyber attacks that occur
     - identify vulnerabilities in certain months.

### Eg.1: Show the Top-X vulnerable products/vendors

{{< article link="https://myseq.blogspot.com/2022/04/kev-dashboard.html" >}}

 - https://myseq.blogspot.com/2022/04/kev-dashboard.html

### Eg.2: Distribution of KEV (for fun)

  {{< chart >}}
  type: "scatter",
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [ {
      type: "bar",
      label: '2023.10.16 (1020)',
      data: [14, 20, 120, 157, 233, 146, 58, 46, 48, 44, 113, 21],
      backgroundColor: ['#36A2EB33', '#36A2EB33', '#FF638433', '#FF638433', '#FF638433', '#FF638433', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33',
'#FF638433', '#36A2EB33'],
      borderColor: ['#36A2EB', '#36A2EB', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#FF6384', '#36A2EB'],
      borderWidth: 1
  }, {
      label: 'Mean:',
      data: [85.0, 85.0, 85.0, 85.0, 85.0, 85.0, 85.0, 85.0, 85.0, 85.0, 85.0, 85.0],
      borderWidth: 1,
      pointRadius: 0,
      type: "line"
    }]
  },

  options: {
    plugins: {
      legend: { display: false },
      title: {
        align: 'center',
        display: true,
        text: 'Distribution of 1020 KEV (by_month) vs mean = 85.0',
        position: 'top',
        padding: 10,
        color: '#FFFFFF'
      }
    }
  }

  {{< /chart >}}

`mean_val=85.0`

|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|14|20|120|157|233|146|58|46|48|44|113|21|

> Conclusion: There are 5 months (Mar/Apr/May/Jun/Nov) where the distribution of KEV is higher than `mean` value. 
>> And this means more resources should be allocated for those months (in red).

## Taipy Cloud

 - https://cisakev.taipy.cloud/
 
