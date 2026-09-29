---
title: "Network Interfaces"
date: 2026-09-13T17:47:16+08:00
tags: [ "101", "cli", "linux", "network" ]
categories: [ "Posts"  ]
summary: "Learn Linux network interfaces in quick way."
draft: false
---
{{< lead >}}
*Different methods to list network interfaces in Linux.*
{{< /lead >}}


## Naming

| Name Pattern | Meaning |
| :----------- | :------ |
| lo | Loopback - virtual interface `127.0.0.1/8` |
| eth0,eth1 | Classic wired Ethernet naming | 
| wlan0,wlan1 | Classic WiFi naming |
| enp3s0,wlp2s0 | "Preditable Network Interface Names" - stable names that don't change when hardware is added/removed |

## Cmdline

Below we've listed 10 methods to list network interfaces on Linux OS. 
This is helpful for troubleshooting, configuration, and hardware checking.

| #  | Method | Command | Best For |
| -: | :----- | :------ | :------- |
| 1  | **ip command** | `ip addr` | Modern all-purpose chaeck of IP state and names. | 
| 2  | **nmcli** | `nmcli device status` | Clean and easy-to-read summary. Requires NetworkManager running. |
| 3  | **netstat** | `netstat -i` | Viewing transmission/reception stats (packets, bytes); older net-tools package | 
| 4  | **ifconfig** | `ifconfig -a` | Legacy method for IPs and state; deprecated, often not installed by default | 
| 5  | **/proc/net/dev** (file) | `cat /proc/net/dev` | Low-level kernel stats (packets, errors); good for scripting/monitoring | 
| 6  | **/sys/class/net** (directory) | `cat /proc/net/dev` | Quick, simple list of interface names only | 
| 7  | **hwinfo** | `sudo hwinfo --short --network` | Hardware summary — driver details and configuration |
| 8  | **lshw** | `sudo lshw -class network -short` | Checking physical hardware (e.g., confirming a new network card is recognized) |
| 9  | **iwconfig** | `iwconfig` | Wireless-specific info (signal strength, ESSID, access point MAC) — Wi-Fi only |
| 10 | **lspci** | `lspci \| egrep -i 'network\|ethernet\|wireless\|wi-fi'` | Filtering PCI devices to find network-related hardware | 






