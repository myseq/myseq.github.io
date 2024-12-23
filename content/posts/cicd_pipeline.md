---
title: "CI/CD Pipeline 101"
date: 2024-12-19T12:55:03+08:00
tags: [ "101", "cicd", "dast", "sast", "sca", "webapp" ]
categories: [ "Posts"  ]
summary: "CI/CD pipelines 101 for security pros."
draft: false
---
{{< lead >}}
*CI/CD pipeline is where you combine version control (Git), continuous integration and continuous deployment.*
{{< /lead >}}

> *An excellent page about CI/CD from Evan Grace (Tenable).*
> *See the full blog post in the link section.*

IMO, so far this is the only article to explain what is CI/CD well.
This makes me to write a post about [CI/CD](/tags/cicd/) for my own reference.

The post is about introducing [Tenable Web Application Scanning](https://www.tenable.com/products/web-app-scanning).
And this requires some level of understanding about:

 - What is CI/CD pipeline?
 - How webapp scanning works with CI/CD and version control?


## Continuous Integration

The `Continuous Integration` builds an application for testing and staging uses.
It builds an application and runs tests on a schedule or after the code changes.

During `continuous integration`, it involves:

 - build and compile the source codes.
 - run simple application testing.
 - run dynamic application security testing (DAST).
 - software composition analysis (SCA)
 - static application security testing (SAST)
 - `Jenkins` the first main and widely adopted CI tool.

In short, it saves time to manually assign tasks out for multiple testings. 

## Continuous Deployment

The `Continuous Deployment` builds an application for **production use** rather than just for quick testing.

It automates the process:

 - Deploy codes from staging to production.
 - Handle the roll-back if needed.

In short, `continuous deployment` allows for changes to be made in the source code, and sent to production automatic.
The purpose is to save time in changing live servers for IT team. 

## WebApp Scan

 - Tenable Web Application Scanning can scan any pipeline, including:
   - Bamboo 
   - CircleCI
   - GitHub Actions
   - GitLab 
   - Jenkins
   - Azure DevOps

## Links 

 - [Web App Scanning 101](https://www.tenable.com/blog/web-app-scanning-101-what-security-pros-need-to-know-about-cicd-pipelines)
 - [Tenable Web App Scanning CI/CD Application Scan Overview](https://docs.tenable.com/web-app-scanning/Content/WAS/GettingStarted/Integrations/CI-CD/Overview.htm)
 - See the [CI/CD Pipeline Scanning Demo](https://demo.tenable.com/share/lajsp7ujjmzb)

