---
title: "Agentic AI vs. Generative AI"
date: 2025-05-04T09:05:22+08:00
tags: [ "ai", "llm", "rag" ]
categories: [ "Posts", "Simplify"  ]
summary: "Moving from GenAI to Agentic AI."
draft: false
---
{{< lead >}}
*Agentic AI doesn't just grasp our goals - it creatively paves the way to achieve them.*
{{< /lead >}}

Few months back, I posted an article about [AI Agent + LLM + RAG](/posts/agent_llm_rag/).

It seems too complicated. 
And today I want to simplify it further after I learn more about AI.

*Let's start with ...*

## Generative AI

There are 2 generations of Generative AI (GenAI): **LLM** and **RAG**.

We can call the 1st generation of AI as: **Rule-based LLM** or simply just **LLM**.

Because it:

 - understands NLP and provides answer just like human. 
 - produces output in response to static prompts.


Next, **Retrieval Augmented Generation** (RAG).

It is a technique that enhances LLMs by allowing them to access and incorporate external knowledge-bases.


{{< mermaid >}}
---
title: Generative AI (GenAI)
config:
  look: handDrawn
  layout: elk
---
%%{init: {
    'theme': 'base',
    'themeVariables': {
      'clusterBkg': '#212529',
      'clusterBorder': '#fff',
      'titleColor': '#fff',
      'textColor': '#fff',
      'primaryColor': '#303030',
      'primaryTextColor': '#222',
      'secondaryColor': '#282828',
      'secondaryTextColor': '#fff',
      'lineColor': '#FFC107'
    }}}%%

flowchart TB

    subgraph RAG
        direction TB

        P2(**Prompt ?**)
        A2(**Answer =**)
        L2[***LLM*** 🦙]
        V2[(**VectorDB** 🛢️)]

        P2 -.-> A2
        P2 --> L2
        L2 --> A2
        V2 --> L2
        A2 -.-> P2

    end

    subgraph LLM
        direction TB

        P1(**Prompt ?**)
        A1(**Answer =**)
        L1[***LLM*** 🦙]

        P1 -.-> A1
        P1 --> L1
        L1 --> A1
        A1 -.-> P1

    end

    linkStyle 0,4,5,8  stroke:#8080ff,stroke-width:1px
    linkStyle 3 stroke:#ffc107,stroke-width:2px


{{< /mermaid >}}


In short, ***GenAI*** is nothing but an AI that can creates contents, such as text, image, or audio, based on pre-trained data.


## AI Agent and Agentic AI

*AI Agent* is a program that takes input, thinks and acts to complete a task using tools, memory, and knowledge.


What is *Agentic AI*?

In fact, **Agentic AI** is referring to a software system that capable of **autonomously** making **decisions** and taking **action** to achieve a set of **objectives**.

This system has advanced memory functions that allow them to remember past actions and outcomes.
It can learn from new experiences and feedback, continuously improving its performance over time.

Agentic AI has 3 core behaviors: **Autonomy[^1], Adaptability[^2], and Proactivity[^3]**.

[^1]: It operates independently with minimal or no human intervention.

[^2]: It adjusts its behavior and strategies based on changes in its 
    environment and new goals.
    (This includes change/update the prompt-query, refines strategies, 
    selecting tools, in order to adapt to context.)

[^3]: It anticipates future scenarios and takes preemptive actions to
    address potential challenges.

> Automation vs. Autonomy
>> Automation involves performing perdefined, rule-based tasks where every step is known and predicatable.
>> Autonomy adapts and decides based on the situation.

Below show how an Agentic AI works. 

{{< mermaid >}}
---
title: Agentic AI (3rd Gen)
config:
  look: handDrawn
  layout: elk
---
%%{init: {
    'theme': 'base',
    'themeVariables': {
      'clusterBkg': '#212529',
      'clusterBorder': '#fff',
      'titleColor': '#fff',
      'textColor': '#fff',
      'primaryColor': '#303030',
      'primaryTextColor': '#222',
      'secondaryColor': '#282828',
      'secondaryTextColor': '#fff',
      'lineColor': '#FFC107'
    }}}%%

flowchart LR

    subgraph Agentic AI

        P(**Prompt ?**)
        A(**Answer =**)
        L[***LLM*** 🦙]
        V[(**VectorDB** 🛢️)]
        T[**Tools** 🛠️]

        P -.-> A
        P --> L
        L --> A
        V --> L
        L <--> T
        A -.-> P

    end

    linkStyle 0,5 stroke:#8080ff,stroke-width:1px
    linkStyle 3,4 stroke:#ffc107,stroke-width:2px


{{< /mermaid >}}

See the additional **Tools**?
This is the *secret recipe* to move from GenAI to *Agentic AI*. 

Tools may comprise multiple AI agents and MCP servers. 

Agentic AI:

 - focuses on **making decisions** rather than on creating content.
 - sets to optimize particular **goals or objectives** and do not rely on human prompts.
 - can carry out **complex sequences of activities**, independently searching databases or triggering workflows to complete tasks.
 - has strategic thinking and the ability to respond in real time to the environment.
 - focuses on **goal-driven** behavior and **autonomous**, real-time **decicsion making**.


## Comparison

Below is a simple comparisons on *GenAI, AI Agent and Agentic AI*.


| System Type | GenAI (LLM) | AI Agent | Agentic AI |
| ----------- | ----------- | -------- | ---------- |
| Main tasks | Answers based on pre-trained knowledge | Takes inputs, decides and completes task | Handles multi-step goals with planning and coordination |
| Tool usage | No external tool | Uses tools to complate a task | Can uses multiple tools or agents |
| Autonomous Decision | No decision making | Makes decisions to complete the task | Plans, decides, and adapts over time |


Here's an example.

Question: *What is the price of Emirates flight from New York to London tomorrow?*

***GenAI*** won't be able to answer this because it has a knowledge cut-off date.

On the other hand, an ***AI Agent*** with API access to Emirates will be able to take further actions besides checking the flights/prices.
For instance, it can help to make the flight booking if it has been granted to access the credit card info.

Finally, if we need someone who can *book a flight for my 7-day trip to London in May and the weather should be sunnny all days.*
*My flight budget is $2000.* Here comes the ***Agentic AI*** which can complete multi-step tasks and plan the goals for us:

 1. Check weather to find 7 days in May
 1. Compare airlines for different flights
 1. Make booking that fits the budget $2000
 1. Suggest for hotel and airport taxi
 1. Suggest trip for local visits
 1. Suggest trip for shopping plan


## Key Takeways

First, the most significant difference between Agentic AI and GenAI is ***autonomy***. 
This means it not only *understand* our ***objectives***, but it will find ways to *achieve* them ***innovatively***.

> Agentic AI doesn't just grasp our goals - it creatively paves the way to achieve them.

Second, GenAI focuses on *creating contents* and Agentic AI focuses on ***making decisions***.

Third, RAG vs Agent/MCP:

 - RAG does embedding and Agent does query via MCP
 - RAG is one-way to LLM and Agentic AI can be two-way connecting to LLM.


