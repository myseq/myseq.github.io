+++
title =  "Tunnelling with SSH Port Forwarding"
date = 2023-09-05T21:18:55+08:00
author = "zd"
tags = [ "101", "cli", "ssh" ]
categories = [ "Posts" ]
summary = "Quick notes on tunnelling with SSH port forwarding."
draft = false
+++

## SSH Tunnelling

`SSH Tunnelling` is often used to create an encrypted connection between local machine and a remote server which relay traffic. Through the secure tunnel, it can protect unencrypted traffic, such as VNC or database connection, from being eavesdropping.

Depends on the situation, there are 3 ways to create tunnelling with SSH port forwarding. 
 - Local port forwarding
 - Remote port forwarding
 - Dynamic port forwarding

Choosing which tunnelling depends on the firewall configuration. Refer to the `prerequisite` sections below.

### SSH Local Port Forwarding

SSH `local port forwarding` allows you to securely access a service running on a remote server through an encrypted SSH tunnel.

> `Prerequisite`
> ***Local port forwarding*** can only be used provided you can successfully establish a SSH connection (22/tcp) to the SSH server through the firewall. This means the firewall has to grant access to to SSH server on port 22/tcp.

{{< mermaid >}}
graph
  fw1{{fw_allow}}
  fw2{{fw_block}}

  subgraph main[Prerequisite: Firewall Requirement]
    direction RL

    subgraph grant[Success: Allow incoming SSH port]
      direction LR
      client1 --> |22/tcp| fw1 --> |dport:22| sshd1
    end

    subgraph fail[FAIL: incoming SSH port is blocked]
      direction LR
      client2 --> |22/tcp| fw2 --> sshd2
    end

  end

  linkStyle default stroke-width:4px
  linkStyle 0 stroke:yellow
  linkStyle 1 stroke-width:3px,stroke:green
  linkStyle 2 stroke:yellow
  linkStyle 3 stroke:red

  classDef Allow color:#0ff
  classDef Block color:#f00

  class grant Allow
  class fail Block
{{< /mermaid >}}

Here's the cmdline to create a SSH local port forwarding:
`ssh -L [bind_addr]:<port>:<host>:<host_port> <ssh_server>`

Below is the diagram to show how `local port forwarding` connection works:

 1. Established the secure tunnel [blue]
 2. Connect from *client(\*)* to web1:8080 (or web2:9090) in clear text traffic [yellow]

{{< mermaid >}}
graph BT
  ssh_1(["web1:8080
        ssh_svr:22"])
  fw_1{{firewall}}
  cli_1((client:8080))
  cli_2((client:9090))
  fw_2{{firewall}}
  ssh_2["ssh_svr:22"]
  web2(["web2:9090"])



  subgraph main[Local Port Forwarding]
    direction BT

    subgraph DC[Datacenter]
      direction BT
      fw_1 ==> |dport:22| ssh_1
      ssh_1 -.-> |dport:8080| ssh_1

      fw_2 ==> |dport:22| ssh_2
      ssh_2 -.-> |dport:9090| web2
    end

    subgraph Home[Remote]
      direction BT
      cli_1 === |22/tcp| fw_1
      cli_1 -.-> |dport:8080| cli_1

      cli_2 === |22/tcp| fw_2
      * -.-> |dport:9090| cli_2
    end

  end

  linkStyle default stroke-width:4px,stroke:red
  linkStyle 0 stroke-width:4px,stroke:blue
  linkStyle 1 stroke-width:5px,stroke:yellow
  linkStyle 2 stroke-width:4px,stroke:blue
  linkStyle 3 stroke-width:4px,stroke:yellow
  linkStyle 4 stroke-width:4px,stroke:blue
  linkStyle 5 stroke-width:4px,stroke:yellow
  linkStyle 6 stroke-width:4px,stroke:blue
  linkStyle 7 stroke-width:4px,stroke:yellow

  classDef main font-size:20px,color:#f66
  classDef Group1 color:#0ff
  classDef Group2 color:#0f0

  class main main
  class DC Group1
  class Home Group2
{{< /mermaid >}}

The flow diagram on the left, is a typical way how remote worker can establish remote access with `local port forwarding`. However, it can be extended to the flow diagram at the right, to allow other to access web server (web2 at port 9090/tcp).

#### Scenario 1 (left)

Run the below cmdline at client, and point the (client) browser to `http://localhost:8080`, should be connecting to `http://web1:8080`

> `ssh -L 8080:web1:8080 user@ssh_svr`

#### Scenario 2 (right)

Run the below cmdline at client, and allow other's to browse at `http://client:9090`, should be connecting to `http://web2:9090`

> `ssh -L 0.0.0.0:9090:web2:9090 user@ssh_svr`


### SSH Remote Port Forwarding

SSH `remote port forwarding` allows remote server to access a service running on local machine/network through an encrypted SSH tunnel.

> `Prerequisite`
> ***Remote port forwarding*** is only useful when you have a SSH server that locates at the Internet and is accessible by both client and remote worksapce. 


Here’s the cmdline to create a SSH remote port forwarding:
`ssh -R [bind_addr]:<port>:<host>:<host_port> <ssh_server>`

Below is the diagram to show how `remote port forwarding` connection works:

 1. Established the secure tunnel [blue]
 2. Connect from remote to web:8080 in clear text traffic [yellow]

{{< mermaid >}}
graph
  direction LR
  sshd(["sshd:22
        fport:80"])
  client(["client"])
  demo["web:8080"]
  remote((remote))

  subgraph main[Remote Port Forwarding: remote -> web:8080]

    subgraph intra[Intranet]
      client --> |8080/tcp| demo
    end

    subgraph cloud[Internet]
      sshd
      remote --> |80/tcp| sshd
    end

    client --> |22/tcp| sshd

  end

  linkStyle default stroke-width:4px
  linkStyle 0 stroke:yellow
  linkStyle 1 stroke:yellow
  linkStyle 2 stroke:blue

  classDef Block color:#0ff
  classDef Title color:#f66

  class main Title
  class cloud,intra Block

{{< /mermaid >}}

#### Scenario

Run the cmdline below at the **client** to establish the tunnel. Then the **remote** workspace can browse to http://fport:80 and the traffic will be redirected to http://web:8080.

> `ssh -R 0.0.0.0:80:web:8080 user@sshd`
> In this case, the fport can be the same IP address as sshd.

### SSH Dynamic Port Forwarding

SSH `dynamic port forwarding` provides greater flexibility for client to connect into Intranet (or datacenter) via SOCKS proxy server.

> `Prerequisite`
> ***Dynamic port forwarding*** turns on the SOCKS proxy at SSH server. It allows the client browser to connect to ***any*** server behind SSHD server with the SOCKs proxy config. And all these must require access to SSHD server at port 22/tcp, (similar to local port forwarding setup). 
>
> SOCK DNS setup: 
> At Firefox browser, setup `about:config > network.proxy.socks_remote_dns;true`

Here's the cmdline to create a SSH dynamic port forwarding:
`ssh -D [bind_addr]:<port> <ssh_server>`

Below is the diagram to show how `dynamic port forwarding` connection works:

  1. Established the secure tunnel [blue]
  2. Setup SOCK proxy at browser by pointing to client and SOCK port.
  3. Ensure SOCK DNS is configured (see above).

{{< mermaid >}}
graph
  client(["client:1080"])
  local(["client:1080"])
  sshd(["sshd:22"])
  http(["web:80"])
  https(["web:443"])
  fw{{firewall}}

  subgraph main[Dynamic Port Forwarding: client -> http or https]
    direction BT
           
    subgraph DC[Intranet]
      direction BT
      fw --> |dport:22| sshd 
      sshd --> |80/tcp| http
      sshd --> |443/tcp| https
    end

    subgraph cloud[Remote]
      direction BT
      client === |22/tcp| fw
      * --> |1080/tcp| client
      local === |22/tcp| fw
      local -.-> |1080/tcp| local
    end 
    
  end

  linkStyle default stroke-width:4px
  linkStyle 0 stroke:blue
  linkStyle 1 stroke:yellow
  linkStyle 2 stroke:cyan
  linkStyle 3,5 stroke:blue
  linkStyle 4,6 stroke:cyan

  classDef Title color:#f66
  classDef subTitle color:#0ff
  
  class main Title
  class cloud,DC subTitle
  
{{< /mermaid >}}

#### Scenario

Run the cmdline below at the **client** to establish the tunnel. Then configure the browser SOCK proxy and pointing to socks://client:1080 with **remote SOCK DNS** setup (for SSHD server to resolve the destination dynamically), then the browser will able to browse to any HTTP/HTTPS server behind the SSHD server. 

> `ssh -D 1080 user@sshd`

## Additional Tips

To disable remote shell when creating tunnel (port forwarding), use `-N`.

To make SSH session into background, add the `-f`.

Additional 2 options can be applied while creating tunnel (port forwarding) as below:
  - `ssh -f -n -N ... user@ssh_server`

> ```
>    -f    To run/put SSH request at background. 
>
>    -N    To disable remote shell cmd execution. 
>
>    -n    Redirects stdin from /dev/null (no input from stdin). 
>          Must used together with -f (backfround).
> ```


### Tunnelling Detection

Due to the nature of how SSH protocol works, it is possible for firewall, such as Palo Alto firewall (PAN-OS), to allow SSH traffic but blocking the SSH tunnelling. 

> *The firewall checks the traffic between the client and server to see if it is routed normally or if it uses SSH port forwarding (SSH tunneling). If the firewall identifies SSH port forwarding, the firewall blocks the tunneled traffic and restricts it according to the configured Security policy. The firewall only looks for SSH port forwarding, it does not perform content and threat inspection on SSH tunnels.*

  - PAN-OS Adminitrator Guide: [SSH Proxy](https://docs.paloaltonetworks.com/pan-os/10-1/pan-os-admin/decryption/decryption-concepts/ssh-proxy)
  - Metallic Code: [Detecting SSH Tunnels](https://www.metalliccode.com/detecting-ssh-tunnels)
  - Trisul: [Traffic analysis of Secure Shell (SSH)](https://www.trisul.org/blog/traffic-analysis-of-secure-shell-ssh/#detecttunnel)
  - Trisul: [Detecting SSH Tunnels](https://www.trisul.org/blog/detecting-ssh-tunnels/)


### Tools for SSH Tunnelling

These are the tools used for automating SSH tunnelling creation.

  - [autossh](http://www.harding.motd.ca/autossh/)
  - [sshtunnel](https://github.com/pahaz/sshtunnel/)
  - Cloudflare: [Tunnel](https://www.cloudflare.com/products/tunnel/)
  - [ngrok](https://ngrok.com/)


## About SSH  Protocol Stack

SSH is organized as 3 protocols that run on top of TCP: SSH User Authentication Protocol, SSH Connection Protocol, SSH Transport Layer Protocol.

<details>
<summary><b>SSH Transport Layer</b></summary>

 - responsbile for server authentication, confgidentiality, integrity and compression.
 - focus on the 3 functions: Host Keys, Packet Exchange, and Key Generation.
</details>

<details>
<summary><b>SSH User Authentication Protocol</b></summary>

 - responsbile for authenticates user/client to the server.
 - focus on main 3 functions: Message Types and Formats, Message Exchange and Authentication Methods.
</details>

<details>
<summary><b>SSH Connection Protocol</b></summary>

 - responsible for multiplexes the encrypted tunnel into several logical channel.
 - focus on main 3 functions: Channel Mechanism, Channel Types and Port Forwarding.
</details>


```
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|         SSH_User_Auth         |         SSH_Connection        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
+                      SSH_Transport_Layer                      +
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                              TCP                              |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                               IP                              |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

Here's the cmd that I generate the SSH protocol stack above:
`$ protocol "SSH_User_Auth:16,SSH_Connection:16,SSH_Transport_Layer:64,TCP:32,IP:32" -n`


## Links
 - [SSH Protocol Stack](https://www.chiragbhalodia.com/2022/05/ssh-and-ssh-protocol-stack.html)
 - [Trisul-scripts](https://github.com/trisulnsm/trisul-scripts)
 - HoldMyBeer: [Detecting SSH Brute Forcing with Zeek](https://holdmybeersecurity.com/2019/04/17/detecting-ssh-brute-forcing-with-zeek/)
 - Mozilla [OpenSSH Security Guide](https://infosec.mozilla.org/guidelines/openssh): Providing a sane baseline policy recommendation for SSH configuration parameters (eg. Ciphers, MACs, and KexAlgos).


