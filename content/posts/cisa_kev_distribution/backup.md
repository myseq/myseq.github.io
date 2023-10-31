---
title: "CISA KEV Distribution"
date: 2023-11-01T10:01:42+08:00
tags: [ "chart", "cisa", "kev", "graph", "shortcodes", "vulnmgmt" ]
categories: [ "Posts"  ]
summary: "How can we identify the trends and patterns in CISA KEV?"
draft: true
---
{{< lead >}}
What we can learn from CISA KEV after 24 months?
{{< /lead >}}

## CISA KEV

The CISA Known Exploited Vulnerabilities (KEV) catalog, launched in Nov 2021, is a list of vulnerabilities that are actively exploited by malicious actors. 

As of today, the list has grown up to `1023` vulnerabilities. This is a valuable resource for organizations to prioritize their vulnerability remediation efforts and protect themselves from cyber attacks.

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

Below, here are the 2 ways that I'm doing analysis in CISA KEV data. 

### Eg.1: Show the Top-X vulnerable products/vendors

This is a cmdline tool (written in Python) that can provide:
 - top 5 vendors listed in KEV.
 - top 5 products listed in KEV.
 - heartmap calendar for vulnerability due date.
 - heartmap calendar for vulnerability added.

{{< article link="https://myseq.blogspot.com/2022/04/kev-dashboard.html" >}}

 - See more at https://myseq.blogspot.com/2022/04/kev-dashboard.html

> Conclusion: The top 5 vendors/products info allow quickly analyze trends of KEV to better add intelligence-led prioritization to vulnerability management.

### Eg.2: Distribution of KEV (for fun)

This is the latest distribution of KEV (after 24 monhts). 

  {{< chart >}}
  type: "scatter",
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [ {
      type: "bar",
      label: '2023.10.26 (1023)',
      data: [14, 20, 120, 157, 233, 146, 58, 46, 48, 45, 115, 21],
      backgroundColor: ['#36A2EB33', '#36A2EB33', '#FF638433', '#FF638433', '#FF638433', '#FF638433', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#FF638433', '#36A2EB33'],
      borderColor: ['#36A2EB', '#36A2EB', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#FF6384', '#36A2EB'],
      borderWidth: 1
  }, {
      label: 'Mean:',
      data: [85.25, 85.25, 85.25, 85.25, 85.25, 85.25, 85.25, 85.25, 85.25, 85.25, 85.25, 85.25],
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
        text: 'Distribution of 1023 KEV (by_month) vs mean = 85.25',
        position: 'top',
        padding: 10,
        color: '#FFFFFF'
      }
    }
  }

  {{< /chart >}}


`mean_val=85.25`

|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|14|20|120|157|233|146|58|46|48|45|115|21|

> Conclusion: There are 5 months (Mar/Apr/May/Jun/Nov) where the distribution of KEV is higher than `mean` value. 
>> And this means more resources should be allocated for those months (in red).


## Links

 - Using [KEV Dashboard](https://myseq.blogspot.com/2022/04/kev-dashboard.html).
 - [CISA KEV Catalog Hits 860 After 13 Months](https://myseq.blogspot.com/2022/12/cisa-kev-catalog-hits-860-after-13.html).
 - Using [Taipy Cloud](https://cisakev.taipy.cloud/).

 
