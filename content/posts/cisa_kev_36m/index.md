---
title: "3rd Anniversary with CISA KEV"
date: 2024-11-01T17:58:53+08:00
tags: [ "cisa", "kev", "vulnmgmt" ]
categories: [ "Posts"  ]
series: [ "CISA_KEV" ]
series_order: 8
summary: "Analysis updates of CISA KEV catalog after 36 months."
draft: false
---
{{< lead >}}
*After 3 years since CISA released the first batch of KEV, here are what we know:*

 - *The peak periods for CISA to release KEV are concentrated in `five specific months`.*
 - *The `top-5 vendors` and the `top-5 vulnerable products` remain consistently.*
 - *Within the KEV catalog, the top-5 vendors hold `48.83%` and the top-5 vulnerable products hold `21.7%` from 1202 CVEs.*

{{< /lead >}}

> I want to take a moment to thank you for your support of the "CISA_KEV" series. 
> After careful consideration, I have decided to stop updating this series. 
> This decision allows me to focus on other projects and initiatives that I believe will better serve our community and my interests.

## Key Takeaways

The "CISA_KEV" series has been around for 36 months.
And we learn some patterns from the analysis, and see some consistencies here.

Those consistencies can provide several advantages for future security planning and vulnerability management:

 1. **Proactive Risk Mitigation:** Knowing that certain vendors and products are consistently vulnerable allows us to ***prioritize*** patching, monitoring, and hardening efforts for those systems.

 2. **Focused Security Investments:** Resources can be allocated more effectively by focusing on the vendors and products that consistently show up in KEV catalog, leading to better defense mechanisms and preparedness.

 3. **Predictive Analysis:** Over time, these consistencies may help predict potential vulnerabilities, allowing teams to act preemptively, reducing the window of exposure for new or emerging threats.

 4. **Vendor Accountability:** Persistent patterns in KEV catalog can be used to push vendors for quicker security fixes or to encourage adoption of more secure development practices.

 5. **Streamlined Incident Response:** Recognizing patterns in vulnerable products simplifies incident response planning, as security teams can develop standardized procedures to handle recurring risks.

In essence, these consistencies enable more strategic, data-driven decisions in cybersecurity management, potentially improving defenses against future threats.
 
> Although the top 5 vendors and products are consistently affected, the specific vulnerabilities may still vary, suggesting that while patterns exist, the nature of vulnerabilities is not necessarily consistent.

## Updates

CISA KEV has been released 36 months.
Today, there are total of ***1202*** (*+43*) CVE been added to CISA KEV catalog.

*CISA Catalog of Known Exploited Vulnerabilities [ ***2024.10.24/1202*** ]*

As of today, there are total of 1193 CVE have overdue, with another 9 more upcoming.  

Highlights (within CISA KEV catalog):
 - The top-5 vendors and top-5 vulnerable products remain the **same**.
 - From all the vendors (187), the top-5 vendors hold ***587*** (around 48.83%) of all the 1202 CVEs.
 - From all the vulnerable products (492), the top-5 vulnerable products hold ***261*** (or ~21.7%) of all the 1202 CVEs.
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
        data: [307, 75, 73, 72, 60, 615],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Microsoft|Apple|Cisco|Adobe|Google|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|307|75|73|72|60|615|

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
    labels: ['Windows', 'Multiple Products (Apple)', 'Flash Player', 'Chromium V8', 'Internet Explorer', 'others'],
    datasets: [{
        label: 'count',
        data: [126, 38, 33, 32, 32, 941],
        backgroundColor: [ '#FF638477', '#FF829d77', '#FFa1b577', '#FFc1ce77', '#FFe1ee77', '#3399CC99' ],
        borderColor: [ '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#3399CC' ],
        borderWidth: 1,
        hoverOffset: 5
    }]
  }

  {{< /chart >}}


|Windows|Multiple Products (Apple)|Flash Player|Chromium V8|Internet Explorer|others|
| :-: | :-: | :-: | :-: | :-: | :-: |
|126|38|33|32|32|941|

---


  {{< chart >}}
  type: "scatter",
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [ {
      type: "bar",
      label: '2024.10.24 (1202)',
      data: [28, 32, 132, 164, 241, 160, 70, 59, 69, 73, 134, 40],
      backgroundColor: ['#36A2EB33', '#36A2EB33', '#FF638433', '#FF638433', '#FF638433', '#FF638433', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33',
'#FF638433', '#36A2EB33'],
      borderColor: ['#36A2EB', '#36A2EB', '#FF6384', '#FF6384', '#FF6384', '#FF6384', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#FF6384', '#36A2EB'],
      borderWidth: 1
  }, {
      label: 'Mean:',
      data: [100.16666666666667, 100.16666666666667, 100.16666666666667, 100.16666666666667, 100.16666666666667, 100.16666666666667, 100.16666666666667,
100.16666666666667, 100.16666666666667, 100.16666666666667, 100.16666666666667, 100.16666666666667],
      borderWidth: 1,
      pointRadius: 0,
      type: "line"
    }]
  },

  options: {
    plugins: {
      legend: { display: false },
      title: { display: true, color: 'white', font: { size: 18, weight: 'bold' }, text: 'Distribution of KEV (by_month) vs mean = 100.16666666666667' }
    }
  }

  {{< /chart >}}


`mean_val=100.16666666666667`

|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|28|32|132|164|241|160|70|59|69|73|134|40|


