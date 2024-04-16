---
title: "Basic Technologies in Cloud Computing"
date: 2024-04-09T06:03:25+08:00
tags: [ "101", "cloud", "aws", "azure", "gcp"  ]
categories: [ "Posts"  ]
summary: "Understanding the basic technologies in cloud computing is the key to manage modern infrastructure."
draft: false
---
{{< lead >}}
*Explore the basic technologies in public cloud platform: Amazon Web Services (AWS), Microsoft Azure, and Google Cloud Platform (GCP).*
{{< /lead >}}

## Compute

 - At on-prem, or traditional data center, **Compute** is referring to the physical server.
 - At cloud, **Compute** is referring to `virtual machine` or `container` or `serverless`.
 - typically, `virtual machine` isn't the go-to technology to use nowadays.
 - `serverless` solution is easier to be used (called endpoint).


| Compute Technologies | AWS | Azure | GCP |
| :----------- | :-- | :---- | :-- |
| Serverless | Lambda | Azure Functions | Google Cloud Functions |
| Virtual Machine | EC2 | Virtual Machine | Compute Engine | 
| Hosted Container | Fargate | Container Instances | Cloud Run | 
| Container Orchestration  | EKS | AKS | Kubernetes Engine | 

## Storage

 - For storing data as ***object***.
 - Can apply *labels and filters* to the object.
 - typically used for long-term storage, like PDF and word files (unstructure data).

| Object Storage | AWS | Azure | GCP |
| :------------- | :-- | :---- | :-- |
| Storage | S3 | Blob Storage | Cloud Storage |

## Database

 - For structure data which allows for querying and complex transaction.
 - Optimized for frequent access.
 - More specialized DB such as knowledge graphs, vector DB.

| Database | AWS | Azure | GCP |
| :------- | :-- | :---- | :-- |
| Relational DB | MySQL/PostgreSQL | MySQL/PostgreSQL| MySQL/PostgreSQL |
| NoSQL | DynamoDB | CosmosDB | Firestore/datastore |
| Data warehouse | RedShift | Synapse Analytics | BigQuery |

## AL/ML

 - Solutions for vision-focused, generative AI, etc.
 - Still new.

| AI/ML | AWS | Azure | GCP |
| :------- | :-- | :---- | :-- |
| Pre-built AI | Amazon Rekognition, Amazon Translate, Amazon Comprehend | Azure Cognitive, Azure Machine Learning | Google Cloud Vision AI, Google Cloud Translation, Google Cloud Natural Language | 
| ML | SageMaker | Azure Machine Learning | Vertext AI |
| AutoML Tools | SageMaker Autopilot, Amazon Kendra | Azure Automated ML | AutoML Vision, AutoML Natural Language |




