---
title: "AI Agent + LLM + RAG"
date: 2025-02-19T11:46:40+08:00
tags: [ "101", "ai", "aiagent", "architecture", "code", "diagram", "llm", "mermaid", "rag" ]
categories: [ "Posts"  ]
summary: "An architecture diagram on AI agent, LLM, and RAG."
authors:
  - "zd"
draft: false
---
{{< lead >}}
*This diagram is written in `mermaid.js` format.*
{{< /lead >}}

## Diagram

Below is a graph showing the relationship on how AI agent, multimodal LLM and RAG work together.

{{< mermaid >}}
---
title: Architecture of AI Agent + Multimodal LLM + RAG
config:
  look: handDrawn
  layout: elk
---
%%{init: {
    'theme': 'base',
    'themeVariables': {
      'textColor': '#fff',
      'primaryColor': '#303030',
      'primaryTextColor': '#222',
      'secondaryColor': '#282828',
      'secondaryTextColor': '#fff',
      'lineColor': '#FFC107'
    }}}%%
%% Title: Architecture of AI Agent + Multimodal LLM + RAG %%
graph TD
    %% User Input Flow %%
    U[**User** 👤] -->|***Query:***<br/>📝🖼️🔊🎥| A(**AI Agent** 🤖)

    %% AI Agent Processing %%
    A -->|***Fetches Knowledge***| R(**RAG Module** 📚)
    R -->|***Retrieves Data***| K("**Knowledge Base** 🏛️")
    K -->|***Provides Context***| R
    R -->|***Relevant Context/Info***| A  
    A -->|***Combined Query & Context***| M(**Multimodal LLM** 🧠) 

    %% Multimodal LLM Encoders & Core Processing %%
    M --> |***Inputs:*** <br/>📝🖼️🔊🎥| E(**Multimodal LLM Encoders**)
    E --> |***Embeddings*** <br/>📝🖼️🔊🎥| L(**LLM Core** 🧠)
    L --> |***Contextualized Representation***| E

    %% Multimodal LLM Processing %%
    M -->|***Consolidated Response***| A

    %% AI Agent Delivers Final Output %%
    A -->|***Final Response*** 🎯| U

    %% Optional Feedback Loop %%
    L -.->|***Feedback***| R
    K<-.->kb(**structured databases** 🛢, <br/>**unstructured text doc** 📝, <br/>**code repositories** ✨)

{{< /mermaid >}}


## Illustration

This diagram illustrates the architecture and data flow of a multimodal AI agent enhanced with Retrieval Augmented Generation (RAG).
Let's break down the components and their interactions:

**1. User Input Flow:**

* The process begins with the **User (👤)** providing a **Query**. 
This query can take various forms, including text (📝), images (🖼️), audio (🔊), or video (🎥).

**2. AI Agent Processing:**

* The **AI Agent (🤖)** acts as the central orchestrator. 
It receives the user's query and performs two key actions:
    * It **Fetches Knowledge** by interacting with the **RAG Module (📚)**.
    * It ultimately sends a **Combined Query & Context** to the **Multimodal LLM (🧠)** (after receiving information from the RAG module).

**3. RAG Flow (Retrieval Augmented Generation):**

* The **RAG Module (📚)** is responsible for retrieving relevant information from the **Knowledge Base (🏛️)**.
* The **Knowledge Base (🏛️)** can consist of various sources, including:
    * **Structured databases (🛢)**
    * **Unstructured text documents (📝)**
    * **Code repositories (✨)**
* The RAG module **Retrieves Data** from these sources and **Provides Context** back to the AI Agent.  
* The **Relevant Context/Info** is then passed from the RAG Module back to the **AI Agent**.

**4. Combining Query and Context:**

* The AI Agent receives the relevant context from the RAG module.
It *combines* this retrieved information with the original user query. 
This combined information (query + retrieved context) is crucial and forms the input for the Multimodal LLM.

**5. Multimodal LLM Encoders & Core Processing:**

* The **Multimodal LLM (🧠)** receives the **Combined Query & Context** from the AI Agent.
* It utilizes **Multimodal LLM Encoders** to process the different input modalities (text, image, audio, video).
The encoders transform these inputs into **Embeddings**, which are numerical representations that capture the meaning of the input.
* These embeddings are then passed to the **LLM Core (🧠)**, which is the heart of the language model.
The LLM Core processes the embeddings and generates a **Contextualized Representation**, combining the information from the user query and the retrieved context.

**6. Multimodal LLM Processing:**

* The LLM Core generates a **Consolidated Response** based on the contextualized representation.
This response is then sent back to the AI Agent.

**7. AI Agent Delivers Final Output:**

* The **AI Agent (🤖)** receives the consolidated response from the Multimodal LLM and delivers the **Final Response (🎯)** to the **User (👤)**.

**8. Optional Feedback Loop:**

* Optionally, there can be a **Feedback** loop where the output of the LLM Core or the user's response is used to refine future retrievals by the RAG Module.
This allows the system to learn and improve over time.


>This emphasizes that the AI Agent *combines* the user query and the retrieved context *before* sending it to the Multimodal LLM.
>The flow of information from the RAG module back to the AI Agent and then the combined information to the LLM.


## Diagram Code

In case you are interested, below are the source code to generate the diagram.

```javascript
graph TD
    %% User Input Flow %%
    U[**User** 👤] -->|***Query:***<br/>📝🖼️🔊🎥| A(**AI Agent** 🤖)

    %% AI Agent Processing %%
    A -->|***Fetches Knowledge***| R(**RAG Module** 📚)
    R -->|***Retrieves Data***| K("**Knowledge Base** 🏛️")
    K -->|***Provides Context***| R
    R -->|***Relevant Context/Info***| A  
    A -->|***Combined Query & Context***| M(**Multimodal LLM** 🧠) 

    %% Multimodal LLM Encoders & Core Processing %%
    M --> |***Inputs:*** <br/>📝🖼️🔊🎥| E(**Multimodal LLM Encoders**)
    E --> |***Embeddings*** <br/>📝🖼️🔊🎥| L(**LLM Core** 🧠)
    L --> |***Contextualized Representation***| E

    %% Multimodal LLM Processing %%
    M -->|***Consolidated Response***| A

    %% AI Agent Delivers Final Output %%
    A -->|***Final Response*** 🎯| U

    %% Optional Feedback Loop %%
    L -.->|***Feedback***| R
    K<-.->kb(**structured databases** 🛢, 
        <br/>**unstructured text doc** 📝, 
        <br/>**code repositories** ✨)

```


