---
title: "Effective Annual Yield"
date: 2025-10-16T11:34:20+08:00
tags: [ "101", "bank", "rate" ]
categories: [ "Others"  ]
summary: "Comparing the interest rate between banks with EAY."
authors:
  - "zd"
draft: false
---
{{< lead >}}
*3 banks with different rate and compounding frequency*.
*Here's how to compare them.*
{{< /lead >}}

> I need to compare the interest rate between 3 banks. 

> "H bank" offers 2.5% interest rate p.a. and will pay to my account monthly. 
> "G bank" offers 2.0% interest rate p.a. and will pay to my account daily. 
> "R bank" offers 4.0% interest rate p.a. and will pay to my account daily. 

> Are there big differences?


## Effective Annual Yield

To compare the interest rates effectively, we need to calculate the **effective annual yield (EAY)** for each bank, as the compounding frequency (monthly vs. daily) impacts the actual return. The formula for EAY is:

{{< katex >}}

% EAY (KaTeX block notation)
$$
 EAY = \left(1 + \frac{r}{n}\right)^n - 1 
$$

{{< katex >}}
where \(r\) is the nominal annual interest rate, and \(n\) is the number of compounding periods per year (12 for monthly, 365 for daily).


### Calculations
1. **H Bank**: 2.5% p.a., compounded monthly \( r = 0.025 \), \( n = 12 \)
$$
   EAY = \left(1 + \frac{0.025}{12}\right)^{12} - 1 \approx 0.025305 \text{ or } 2.5305\%
$$

1. **G Bank**: 2.0% p.a., compounded daily \( r = 0.02 \), \( n = 365 \)
$$
   EAY = \left(1 + \frac{0.02}{365}\right)^{365} - 1 \approx 0.020201 \text{ or } 2.0201\%
$$

1. **R Bank**: 4.0% p.a., compounded daily \( r = 0.04 \), \( n = 365 \)
$$
   EAY = \left(1 + \frac{0.04}{365}\right)^{365} - 1 \approx 0.040811 \text{ or } 4.0811\%
$$

### Comparison
- **H Bank**: 2.5305% EAY
- **G Bank**: 2.0201% EAY
- **R Bank**: 4.0811% EAY

### Differences
- **R Bank** offers the highest effective yield (4.0811%), significantly outperforming both H Bank (2.5305%) and G Bank (2.0201%).
- The difference between R Bank and H Bank is ~1.55% p.a., and between R Bank and G Bank is ~2.06% p.a.
- H Bank outperforms G Bank by ~0.51% p.a., despite G Bank’s daily compounding, because H Bank’s nominal rate is higher.
- For a $10,000 deposit over one year:
  - R Bank: ~$408.11 interest
  - H Bank: ~$253.05 interest
  - G Bank: ~$202.01 interest
  - R Bank earns ~$155 more than H Bank and ~$206 more than G Bank annually.

## Conclusion

Yes, there are significant differences. **R Bank** provides the best return due to its higher nominal rate and daily compounding. H Bank is better than G Bank, but the gap between R Bank and the others is substantial.

**EAY comparison**:

{{< chart >}}
"type": "bar",
"data": {
  "labels": ["H Bank", "G Bank", "R Bank"],
  "datasets": [{
    "label": "Effective Annual Yield (%)",
    "data": [2.5305, 2.0201, 4.0811],
    "backgroundColor": [ 'rgba(75,192,192,0.2)', 'rgba(153,102,255,0.2)', 'rgba(54, 162, 235, 0.2)'],
    "borderColor": [ 'rgb(75, 192, 192)', 'rgb(153, 102, 255)', 'rgb(54, 162, 235)' ],
    "borderWidth": 1
  }]
},
"options": {
  "scales": {
    "y": {
      "beginAtZero": true,
      "title": { "display": true, "text": "Effective Annual Yield (%)" }
    },
    "x": {
      "title": { "display": true, "text": "Banks" }
    }
  },
  "plugins": { "legend": { "display": false } }
}

{{< /chart >}}


