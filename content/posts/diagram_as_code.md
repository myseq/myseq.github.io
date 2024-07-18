---
title: "Diagram As Code"
date: 2024-06-13T13:04:28+08:00
tags: [ "ascii", "code", "diagram", "gitops", "tools" ]
categories: [ "Posts"  ]
summary: "Having code for aesthetics in DaC allows us to achieve a balance between control and efficiency."
draft: false
---
{{< lead >}}
Creating diagrams using a text-based format (code) instead of traditional drawing tools.
And this gives us the ability to manage out diagrams in a version control system alongside other project files.
{{< /lead >}}

## Why DaC?

Diagram as code (DaC) is particularly useful for creating technical diagrams, such as software architecture diagrams or system flowcharts.

Some benefits include:

 1. **Improved maintainability:** Can easily update the code to reflect any change.

 1. **Collaboration:** Easier for teams to work on diagrams together.

## DaC Tools

Here, I'm sharing 2 DaC tools: `Python/Go library` and `Mermaid`, that I use before.
`Python/Go library` is a more comprehensive tool and is good for creating complex network diagram.
And `Mermaid` is a simple JS library, and is often used with Markdown document.

And I'm also like to introduce a tool called `ASCII flow` that does the opposite, which render the output as ASCII diagram.

### Diagrams (Python/Go library)

This is a `Python` library that let us draw cloud system architecture in code. 
It was created for rapid prototyping new designs without separate diagramming tools.

`Diagrams` supports visualizing infrastructure across major providers and stacks: AWS, Azure, GCP and K8s.
It can model on-premise nodes, SaaS services, and even programming frameworks and languages.

> If you prefer `Go`, there is `Go-Diagrams` too.

### Mermaid

`Mermaid`, a Javascript library, uses **markdown-style** text definition to create diagrams, flowcharts and visualizations.
The goal is to help documentation keep pace with developement. 

It enables even non-programmers to create detailed visuals through the [Mermaid Live Editor](https://mermaid.live/).

See the my blog post at [Diagramming with Mermaid](/posts/diagram_with_mermaid/).

### ASCII Flow

`ASCII FLow` allows us to draw diagrams visually or in text and then render the output as ASCII art.
It is a client-side only eb-based application for drawing ASCII diagrams.

There is a online version at [asciiflow.com](https://asciiflow.com/#/).
Or get the [source at GitHub](https://github.com/lewish/asciiflow).


