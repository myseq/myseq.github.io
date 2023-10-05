+++
title =  "The Myth of Cloud Agnosticism"
date = 2023-05-12T08:01:06+08:00
author = "zd"
tags = [ "cloud", "sans", "iac", "webcast" ]
categories = [ "Posts", "Simplify" ]
summary = "Why securing multiple clouds using Terraform is harder than you think?"
draft = false
+++

## My Notes
Here are my notes taken from the SANS webcast.

 * Top 6 CSP includes: AWS, Azure, Google Cloud, Alibaba Cloud, Oracle Cloud, IBM Cloud.
 * Terraform allows to define cloud infrastructure as code and supports all the top 6 CSPs. 
 * It is practically impossible to consistently apply security controls across CSPs using any single tool including Terraform.

> *Organizations look to so-called “cloud-agnostic” technologies to manage this complexity*.

 * Cloud infra includes highly specific services and platform, and these platform are not interoperable.
   - different API call schemes are used to create infra in each CSP
   - fundamental security concepts differ across the CSP
   - users *must understand* the conceptual differences between clouds and between syntactical in at diff TF providers.
 * Cloud IAM control, is the most important subject across CSP.
   - limit access to managed services
   - IAM is more useful than network control in clouds.
   - AWS IAM logic flow Vs. Azure RBAC eval logic Vs. Google Cloud Policy eval 
 * CSP may break integration (on purpose) to maintain as market leader.
 * Other than IaC, application integration is another barrier to cloud agnisticism.
   - native clouds services are more secure than written in-house.
   - either have to re-write the apps for interoperability, or not relying on native cloud services, like S3, DynamoDB, IAM.
 * Webcast was conducted at May 10, which is Happy _SEC510_ day! 


 * Possible solutions and recommendations:
   * dapr.io (ack Cloud Native Computing Foundation project)
   * Use multi-region instead of multi-CSP for ***redundancy and simplicity.***

> Creating one-core application that works on multi-cloud is nearly impossible and unnecessary. (by chance)

 * multi-cloud solutions:
   * Terraform
   * [Pulumi](https://github.com/pulumi/pulumi)
   * [Cloudify](https://cloudify.co/) - an open source cloud and network functions virtualization (NFV) orchestration platform. Acting as a type of middleware, to provide users a simple way to deploy applications or services in a cloud computing environment.
 * vendor specific:
   * [CloufFormation](https://aws.amazon.com/cloudformation/)
   * ARM - [Azure Resource Manager](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/overview)


## Links
 - [SANS Webcast](https://www.sans.org/webcasts/why-securing-multiple-clouds-using-terraform-harder-than-you-think)
 - [Cloud Agnostic or Devout?](https://www.sans.org/blog/cloud-agnostic-or-devout/)
 - Poster: [Secure Service Configuration in AWS, Azure, & GCP](https://www.sans.org/posters/secure-service-configuration-in-aws-azure-gcp/)
 - [SEC510: Public Cloud Security: AWS, Azure, and GCP](https://www.sans.org/cyber-security-courses/public-cloud-security-aws-azure-gcp/)


