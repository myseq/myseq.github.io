---
title: "Patching Ubuntu"
date: 2026-11-01T16:57:08+08:00
tags: [ "hardening", "oneliner",  "ubuntu" ]
categories: [ "Essential", "Posts"  ]
summary: "Patching Ubuntu OS with one-liner."
draft: false
---
{{< lead >}}
`sudo apt upgrade && [ -e /var/run/reboot-required ] && sudo reboot`
{{< /lead >}}

## Manual Patching

This is an easier-to-read form:

```shell
sudo apt update &&
sudo apt upgrade -y &&
if [ -e /var/run/reboot-required ]; then
    sudo reboot
fi
```

It's functionally clear: **update --> upgrade --> reboot only if it is required**

For a one-liner:

`sudo apt update && sudo apt upgrade -y && { [ ! -e /var/run/reboot-required ] || sudo reboot; }`

## Complete Patching

`apt upgrade` will not remove installed packages to resolve dependency changes. 
For a complete OS update behavior, use:

```shell
sudo apt update &&
sudo apt full-upgrade -y &&
if [ -e /var/run/reboot-required ]; then
    sudo reboot
fi
```

Use `full-upgrade -y` on workstation is generally resonable. 
For **production server**, run without `-y` first, review package removals, and reboot during a maintenance windows.

And check why a reboot is required with:

```shell
cat /var/run/reboot-required.pkgs
```

