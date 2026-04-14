---
title: "Basic Network Architecture"
date: 2022-09-01T12:00:44+08:00
tags: [ "architecture", "network", "diagram" ]
categories: [ "Posts", "Essential" ]
summary: "A simple network diagram."
draft: false
---
{{< lead >}}
*A simple network architecture design based on ***layered approach***.*
{{< /lead >}}


## Architecture

Here's a typical layered achitecture design, with DMZ and Backend networks, and connected via firewalls.

{{< mermaid >}}
%%{init: {'theme': 'forest'}}%%
flowchart TD
    %% Nodes
    Internet("fa:fa-globe Internet")
    Firewall1("fa:fa-shield Firewall")
    DMZ["DMZ Network"]
    Firewall2("fa:fa-shield Firewall")
    Backend["Backend Network"]
    
    DNS("fa:fa-server DNS Server")
    Web("fa:fa-server WEB Server")
    
    AppServer("fa:fa-server App Server")
    Database("fa:fa-database Database")

    %% Grouping nodes in Subgraphs
    subgraph DMZ
        DNS
        Web
    end

    subgraph Backend
        AppServer
        Database
    end

    %% Edge connections between nodes
    Internet --> Firewall1 --> DMZ
    DMZ --> Firewall2 --> Backend

{{< /mermaid >}}

## Network Diagram

This is a network diagram that based on the architecture above.

{{< mermaid >}}
%%{init: {'theme': 'forest'}}%%
graph TB

  External("fa:fa-globe Internet/cloud")
  FW{{"fa:fa-shield Enterprise FW"}}

  subgraph Backend [DC Backend]
     direction LR
     AppSvr(("fa:fa-server App Server"))
     DBSvr1[("fa:fa-database Database")]
     DBSvr2[("fa:fa-database Database")]
     DBSvr1 ~~~ AppSvr ~~~ DBSvr2
  end

  subgraph office
     direction TB
     ITOPS("fa:fa-user IT Ops")
     Users("fa:fa-users Users")
     Users ~~~ ITOPS
  end

  subgraph DMZ
    direction TB
    DNS("fa:fa-server DNS_Server")
    WEB("fa:fa-server WEB_Server")
    DNS ~~~ WEB
  end

  subgraph DC [Data Center]
    direction LR
    FW <---> DMZ
    office ---> FW
  end

  External <---> DC <---> Backend


{{< /mermaid >}}


> Both diagrams are created with `mermaid.js`.


## Links

 - [Mermaid Docs](https://mermaid.js.org/intro/)



