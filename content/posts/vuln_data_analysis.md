---
title: "Data Analysis Story for VM"
date: 2024-01-23T16:14:03+08:00
tags: [ "data", "analytics", "python", "vulnmgmt" ]
categories: [ "Posts" ]
summary: "How can you tell if your remediation work effectively? Is it efficient in addressing new vulnerability released every month?"
draft: false
---
{{< lead >}}
Demonstrate the methodolgy how data analytic can be used in Vulnerability Management by producing the story points about the effectiveness of current remediation work, and is it efficient in addressing the new vulnerability released every month. 
{{< /lead >}}

Today, I'll show 3 basic data analytic that we can used in analyzing our vulnerability data.
And how can the result can be turned into a story for Vulnerability Management.

## Context

We start with a scenario where below is what we have in our vulnerability database.

|   | Hostname | Vuln_Count |
|---| :------: | ---------: |
| 1 | "a"      |          3 |
| 2 | "b"      |         50 |
| 3 | "c"      |         33 |
| 4 | "d"      |         80 |
| 5 | "e"      |         33 |
| 6 | "f"      |          3 |
| 7 | "g"      |         33 |

Questions:

 - What kind of analysis can be (easily) performed based on the data above?
 - Does the remediation work faster than the new vulnerability released?
 - How can we tell a story based on the output (analyzed result)?

## Data Analysis

We'll perform 3 types of analysis: mean, median and mode.

As a start, we can structure the data in Python code below.

```python
host_vuln = { "a": 3, "b": 50, "c": 33, "d": 80, "e": 33, "f": 3, "g": 33 }
```

Then, we need to understand 3 terms below.

Mean
: The average of all numbers. (aka arithmetric mean)

Median
: The middle number in a group of numbers.

Mode
: The number that occurs often within a set of numbers.


### Code (quick)

```python
host_vuln = { "a": 3, "b": 50, "c": 33, "d": 80, "e": 33, "f": 3, "g": 33 }

vulns = list(host_vuln.values())
total = sum(vulns)
hosts = len(host_vuln)

get_mean = total / hosts
get_mode = 0

vulns.sort()
if hosts % 2 == 0:
    median1 = vulns[hosts//2]
    median2 = vulns[hosts//2 -1]
    g_median = ( median1 + median2 ) / 2
else:
    g_median = vulns[hosts//2]

from collections import Counter
data = Counter(vulns)
get_mode = dict(data)
mode = [ k for k,v in get_mode.items() if v == max(list(data.values()))]
if len(mode) == hosts:
    get_mode = 'No mode found.'
else:
    get_mode = ','.join(map(str,mode))

hostvuln2 = dict(sorted(host_vuln.items(), key=lambda x:x[1]))

print(f'')
print(f'Host_count : {hosts}')
print(f'Total_vuln : {total}')
print(f'Mean   : {get_mean}')
print(f'Median : {g_median}')
print(f'Mode   : {get_mode}')
print(f'')
print(f'{host_vuln}')
print(f'{hostvuln2}')
```

And here is the output:

```bash
Host_count : 7
Total_vuln : 235
Mean   : 33.57142857142857
Median : 33
Mode   : 33

{'a': 3, 'b': 50, 'c': 33, 'd': 80, 'e': 33, 'f': 3, 'g': 33}
{'a': 3, 'f': 3, 'c': 33, 'e': 33, 'g': 33, 'b': 50, 'd': 80}
```

### Analysis

Now, we have output:
 - mean is ***33.57***
 - median is ***33***
 - mode is ***33***

First, compare the 3 outpus.

In this scenario, all the 3 outputs are either the same or very close.
This indicates that the data is symmetrically distributed. 
And this mean the collected data is good.

If you were to draw a line chart based on a symmtrical distribution, it should look like a centrally placed "bell curve".

In the case of all the 3 outputs are significantly different, it indicates that the data may not have a symmetric distribution.

This also signals that the data has certain chracteristics, such as ***skewness***, or the present of ***outliers***, or a ***multimodal*** distribution.

 1. Skewed Distribution
    - The `mean` value tend to be pulled in the direction of the skewness.
    - Refer to the `median` value (for measure of central tendency), as itis less affected by ***extreme*** values.
 2. Outliers
    - `mean` value is influenced heavily by some extreme values.
    - The `median` and `mode` values are more robust here.
 3. Multimodal Distribution
    - Sometimes, multiple modes (more than one peak) may exist.
    - The `mean` and `median` values might provide better indication.

Nevertheless, the analysis should allow us to select a more robust value (from mean/median/mode) as a reference.
(In this case, we select the `mean` value or 33.57 as the benchmark for this month)

## Establish Story 

And we can start to dig out the story points before making the conclusion.

### Story_1

**Current Performance**. 
: This should tell the overall performance of the remediation by showing the following table.

| Benchmark/(33) | Host_Count | Percentage | 
| :-: | :-: | --: |
| <= 33 | 5 | ~71% |
| >  33 | 2 | ~29% |

*(Story points)* Based on our vulnerability data:
 - ***71%*** of the hosts has met our minimum benchmark.
 - Hosts are being patched and covered ***symmetrically***. All the 3 outputs are alighed and found no host with extreme vulnerability count or not being patched.

### Story_2 

**Regular Comparison**. 
: Every time we collect the vulnerability data, we can established a benchmark.
: And this benchmark value is ***dynamic***. 

This means we may have different values each time we collect them.

In this scenario, we can start builing a regular table to show the difference. See below.

| |Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|
| -: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
|Total_Vuln|128|138|320|227|433|246|185|189|187|254|245|235|
|Benchmark|44|38|42|57|53|46|45|49|47|54|45|33|
| Hosts (%)|3|3|3|2|3|3|4|4|4|4|4|5 (71%)|


  {{< chart >}}
  type: "scatter",
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    datasets: [ {
      type: "bar",
      label: 'Monthly_Vulns',
      data: [128, 138, 320, 227, 433, 246, 185, 189, 187, 254, 245, 235],
      backgroundColor: ['#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#36A2EB33', '#FF638433'],
      borderColor: ['#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#36A2EB', '#FF6384'],
      borderWidth: 1
  }, {
      label: 'Benchmark:',
      data: [128, 224, 120, 127, 233, 146, 85, 89, 57, 34, 35, 33],
      borderWidth: 1,
      pointRadius: 0,
      type: "line"
    }]
  },

  options: {
    plugins: {
      legend: { display: false },
      title: { display: true, color: 'white', font: { size: 18, weight: 'bold' }, text: 'Remediation Performance (Dec)' }
    }
  }

  {{< /chart >}}

*(Story points)* Based on our vulnerability data, we see ***Improvement*** in our KPI:
 - The latest vulnerability benchmark is generally lower than the past results. This indicates that the remediation is generally faster than the new vulnerability released.  
 - Vulnerability benchmarks are consistent based on the past 3 months results. This indicates that the remediation work is consistent without any exception. 
 - Highest number of hosts are meeting the minimum requirement (comparing to past results).

> The total "**vulnerabilities count**" is just a metric, not a KPI.
> Because the number is greatly depending by the number of vulnerabilities released by vendors at that month.

> See the link, **Vulneability Data Analytics**, below to tell the differences between metrics and KPI.

### Story_3

**Deep Dive Analysis**. 
: We can address the highest risk hosts by dive into the analysis of vulnerability data by different teams/hosts. 

For example:

 - Rate the performance of different remediation teams.
 - Provide the top-X hosts with most vulnerabilities.
 - Provide the top-X vulnerabilities. 

| Performance | Teams/Hosts |
|------------:|-------|
| High | "a", "f" |
| Medium | "c", "e", "g" |
| Low | "b", "d" |

*(Story points)* Based on the performance, we will perform deep dive analysis into:
 - The hosts "b" and "d" on why they have the highest vulnerability count.
 - The patching methodology used by team "b" and "d", and provide improvement.
 - The CVE with highest vulnerability instances.

Further Deep Dive Analysis
: Focus on different business units (teams), applications, OS platforms, etc.
: Focus on hosts with highest risk score (or vulnerability count).
: Focus on top-X highest severity vulnerability.
: Restrict the dataset to Critical/High severity vulnerability only.

### Summary

The full story can be summerized as :

 - ***71%*** of the hosts has met our minimum benchmark.
 - Hosts are being patched and covered ***symmetrically***.
 - The remediation work has efficiently to ***address new vulnerability*** released. 
 - ***Remediation*** is consistent based on the lastest 3-month results.
 - ***Highest*** number of hosts are meeting the minimum requirements.

## Links

 - [Vulnerability Data Analytics](https://myseq.github.io/posts/vulnerability_data_analytics/)

