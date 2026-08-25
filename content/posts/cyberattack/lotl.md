---
title: "Living off the Land Attack"
date: 2026-06-11T07:21:40+08:00
tags: [ "attack", "lotl" ]
categories: [ "Posts"  ]
summary: "Attacking with legitimate administrative tools like PowerShell or WMIC."
draft: false
---
{{< lead >}}
*The term was officially coined and popularized in 2013 by security researchers Christopher Campbell and Matt Graeber during a presentation at the DerbyCon hacker conference.*
{{< /lead >}}

**Living off the land** (LotL) or LOLbins is a cyberattacks techniques using native, legitimate tools within the victims's system to sustain and advance an attack.

> *The term "Living off the Land" (LotL) is a metaphor borrowed from wilderness survival and pioneer history, where a person survives outdoors by using only the natural resources available in their immediate environment (like hunting animals, gathering berries, or using timber) rather than bringing outside supplies.*

## Attack 

Here is exactly how the metaphor translates to hacking:

The Analogy Breakdown

 - **In the physical world**: A survivalist doesn't bring groceries; they look around the forest and use what is already there to survive.

## LOTL Attack

An attacker doesn't download external malicious files, hacking tools, or custom malware onto the target computer. 
Instead, they look around the OS and use legitimate, or any pre-installed administrative tools (like PowerShell, `wmic.exe`, or Remote Desktop) to carry out their attack.

Why Attackers "Live off the Land"?

Cybercriminals use this strategy for three primary reasons:

 1. **To blend in** 

    Standard security tools look for known viruses or unauthorized software. 
    When a hacker uses a built-in Windows tool like `wmic.exe`, standard Antivirus software ignores it because it looks like a normal network administrator doing their daily job.

 1. **To bypass application whitelisting** 

    Many secure corporate networks block users from running unapproved applications. 
    By using pre-approved tools built by Microsoft, the hacker instantly bypasses these restrictions.

 1. **To hide their footprint** 

    Downloading files leaves a digital trail on the hard drive. Running commands inside built-in tools often leaves very little evidence behind.


## Links 

 - For Windows binaries, visit [Living Off The Land Binaries, Scripts, and Libraries](https://lolbas-project.github.io) (LOLBAS) Project
 - GitHub: [LOLBAS](https://github.com/LOLBAS-Project/LOLBAS)
 - For UNIX binaries, visit [GTFOBins](https://gtfobins.org/)
 - GitHub: [GTFOBins](https://github.com/GTFOBins/GTFOBins.github.io)
 - [Identifying and Mitigating Living Off the Land Techniques](https://www.cyber.gov.au/about-us/view-all-content/alerts-and-advisories/identifying-and-mitigating-living-off-the-land-techniques)
 


