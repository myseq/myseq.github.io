---
title: "NodeJS 101"
date: 2025-06-30T23:45:35+08:00
tags: [ "101", "nodejs", "ubuntu" ]
categories: [ "Posts"  ]
summary: "See how I setup node.js on Ubuntu 22.04 (Jammy)"
authors:
  - "xx"
draft: false
---
{{< lead >}}
***Node.js*** *is designed to build scalable network applications as an asynchronous event-driven Javascript runtime.*
{{< /lead >}}

## NodeJS Releases

Same as others, `Node.js` has 3 major releases including **Current**, **LTS**, and **End-of-Life**.
And `Node.js` has taken the approach to make all its **LTS** to have *even-numbered* releases.

For example, as of today, *maintenance LTS* is at v20.x, and *active LTS* is at **v22.x**.
Older LTS (EOL) versions include v12.x, v16.x, v18.x.

See [Node.js Releases](https://nodejs.org/en/about/previous-releases) for more details.

**Ubuntu's** default repositories include `Node.js` (v12.22.9 as of today), offering a *consistent experience across systems*. 
While not the latest, this version is *stable and suitable* for quick experimentation with Node.js.

Default repositories always prioritize stability over the latest features.
This makes then often lag behind the current `Node.js` releases (v22.x).

> Because of that, I choose to install `Node.js` via NodeSource PPA[^1] instead of default repositories.

[^1]: **Personal Package Archive (PPA):** It's a software repository that allows developers to distribute software packages outside of the official repositories.

## Quickstart

PPAs have more versions of `Node.js` available than the official Ubuntu repositories.
In this case, I install `Node.js` v20.x in my Ubuntu OS for some experiments.

First, I download the setup script (`nodesource_setup.sh`).

> Refer to the [NodeSource documentation](https://github.com/nodesource/distributions/blob/master/README.md) for more information on the available versions.

Then, I just run the setup script with `sudo`.

```console
xx@pf22:~$ curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
xx@pf22:~$ sudo apt install -y nodejs
```

Next, just run the commands to verify the installation.

```console
xx@pf22:~$ node -v
v20.19.3
xx@pf22:~$ npm -v
10.8.2
xx@pf22:~$ npx -v
10.8.2
```

## Quick Uses

Here, I'll show 2 use cases here.

First, I'll install a web server `http-server` with `npm`.
Then follow by running it with `npx`.

```console
xx@pf22:~$ npm i http-server

added 48 packages in 2s

15 packages are looking for funding
  run `npm fund` for details
xx@pf22:~$ npx http-server
Starting up http-server, serving ./

http-server version: 14.1.1

http-server settings:
CORS: disabled
Cache: 3600 seconds
Connection Timeout: 120 seconds
Directory Listings: visible
AutoIndex: visible
Serve GZIP Files: false
Serve Brotli Files: false
Default File Extension: none

Available on:
  http://127.0.0.1:8080
  http://10.255.255.254:8080
  http://172.20.124.23:8080
Hit CTRL-C to stop the server

```

In second example, I'll run (with `npx`) a package without local installation. 

```console
xx@pf22:~$ npx -y cowsay "Ubuntu Shell"
 ______________
< Ubuntu Shell >
 --------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
xx@pf22:~$
```

## Links

 - [About Node.js](https://nodejs.org/en/about)
 - [Node.js Releases](https://nodejs.org/en/about/previous-releases)

