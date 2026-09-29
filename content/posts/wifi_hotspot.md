---
title: "Windows WiFi Hotspot"
date: 2020-09-30T00:22:42+08:00
tags: [ "cli", "wifi", "win10" ]
categories: [ "Posts"  ]
summary: "Sharing Internet connection in Windows 10."
draft: false
---
{{< lead >}}
*Setting up WiFi hotspot can be handy for sharing Internet connection with others.*
{{< /lead >}}

Here, I'll demonstrate how to *setup* WiFi hotspot with cmdline.
Then manage the hotspot in Windows with cmdline.

## Setup

First, start `cmd` as admin.

```cmd {title="Administrator: Command Prompt" hl_lines=[1]}
C:\Users\xx> netsh wlan set hostednetwork mode=allow ssid=hotspot key=wifipassword
The hosted network mode has been set to allow.
The SSID of the hosted network has been successfully changed.
The user key passphrase of the hosted network has been successfully changed.
```


## Management

Then, we can start/stop the hotspot using `netsh` cmdline.

```cmd {title="Administrator: Command Prompt" lineNos=inline hl_lines=[1,4]}
C:\Users\xx> netsh wlan start hostednetwork
The hosted network started.

C:\Users\xx> netsh wlan stop hostednetwork
The hosted network stopped.
```


