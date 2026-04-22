+++
title = "Multipass"
date = "2022-05-15T22:16:03+08:00"
author = "zd"
tags = [ "cli", "multipass" ]
categories = [ "Blogger" ]
summary = "Orchestrates virtual Ubuntu instances with Multipass."
draft = false
+++

## Introduction

**Multipass** is simple a docker alternative from Canonical projects. It is a lightweight cross-platform VM manager, and is designed for developers who want a fresh Ubuntu environment with a single command.

A cloud-init can be used for post-install configuration, such as setup SSH public key or mounting a disk.

It is so fun 😜😜 and I love its' simplicity.

## Log Journal 

### 2022.05.15 : Installation

Multipass is a lightweight virtual machine manager developed by Canonical, the company behind Ubuntu. It allows you to easily create, manage, and launch virtual machines on your local machine or in the cloud, using a simple command-line interface.

Multipass provides a fast and efficient way to test and develop software on multiple operating systems without the need to set up and maintain a full-fledged virtualization infrastructure. It uses the lightweight KVM virtualization technology to create isolated environments that run independently of the host system.

With Multipass, we can quickly spin up new virtual machines, and customize the configuration of each virtual machine, such as CPU, memory, disk space, and network settings.

```shell
$ sudo snap install multipass --classic 
$ sudo snap refresh multipass --channel stable
```

###  2022.05.16: Customized VM at launch with `cloud-init`

Multipass is great. With `cloud-init`, it is getting better.

With cloud-init we can customize our virtual machine at launch when we create them with Multipass.

First, create a `cloud-init.yaml` file with the content below:
```yaml
ssh_authorized_keys:
  - ssh-rsa AAAAB3NzaC1yc2EAAAAD........./FAC8DD2xi2pZZc3Dnv/6iE= xx@pf
```

Next, create the VM and login to the shell. 
```shell
$ multipass launch --name jimny --cloud-init cloud-init.yaml
$ multipass shell jimny
```

### 2022.09.28 : Advanced Setup with Multipass

We can pre-configure all the actions every time a new VM instance is created via `cloud-init`. Create a YAML file called `cloud_init.yaml` below:
```yaml
users:
  - default
  - name: xx
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh_authorized_keys:
      - ssh-rsa <rsa keys in one line>
package_update: true
package_upgrade: true
packages:
  - nodejs
  - python3
```

Then, create a new VM instance, login the shell, and checkfor Nodejs and python3 packages.
```shell
$ multipass launch -c 2 -m 2G -d 10G -n jimny --cloud-init cloud_init.yaml
$
$ multipass info jimny
$ multipass shell jimny
ubuntu@jimny:~$ apt list python3 nodejs
```

### 2022.09.29 : Multipass Local Privileged Mounts

To access the host storage from the guest VM instance, we need to setup one-time configuration. First, find out the current configured value:
```shell
$ multipass get local.privileged-mounts
```

If it is false, then set the value to true:
```shell
$ multipass set local.privileged-mounts=true
```

Then, share the host's local folder (c:\Temp) to guest VM. And check if it is successful.
```shell
$ multipass mount c:\temp jimny:temp
$ multipass info jimny
$ multipass umount jimny:temp
```

### 2022.10.01 : Multipass Images

To show Multipass images:
```shell
$ multipass find --format json
{
    "errors": [
    ],
    "images": {
        "18.04": {
            "aliases": [
                "bionic"
            ],
            "os": "Ubuntu",
            "release": "18.04 LTS",
            "remote": "",
            "version": "20220921"
        },
        ....
        ....
        ....
}

$ multipass version --format json
{
    "multipass": "1.10.1+win",
    "multipassd": "1.10.1+win"
}
``` 

### 2022.10.24 : Multipass is Exposing SSH private key to everyone.

It is so convenience to use the command 'multipass shell jimny' whenever we need to access to VM created. 

But, how can we login without password? Where is the SSH private key?

Actually it is using SSH public key authentication for login to VM. 

For my case, I'm using WSL, and the SSH private key is stored at `C:\ProgramData\Multipass\data\ssh-keys\id_rsa`

So, in theory, we can always do the following to login to any VM created by Multipass.
```powershell
PS> ssh -i C:\ProgramData\Multipass\data\ssh-keys\id_rsa ubuntu@jimny
```

However, you will always hit with permission error. Not because of no permission, but everyone has a READ permission to the private key.  To fix this, you need an administrator privilege to fix it:
```cmd
C:\cd C:\ProgramData\Multipass\data\ssh-keys

C:\ProgramData\Multipass\data\ssh-keys> icacls id_rsa /inheritance:r /grant "$(whoami):F" /grant "NT AUTHORITY\SYSTEM:F"
```

Make sure it is executed successfully and you should be able to use the SSH private key for authentication.
```powershell
PS> ssh -i C:\ProgramData\Multipass\data\ssh-keys\id_rsa ubuntu@jimny
```


## Links
 - [Multipass](https://multipass.run/)
 - https://myseq.blogspot.com/2022/05/first-try-on-multipass.html
 - https://myseq.blogspot.com/2022/05/customizing-vm-at-launch-with-cloud-init.html
 - https://myseq.blogspot.com/2022/09/my-third-try-on-multipass.html
 - https://myseq.blogspot.com/2022/09/multipass-local-privileged-mounts.html
 - https://myseq.blogspot.com/2022/10/multipass-images.html
 - https://myseq.blogspot.com/2022/10/multipass-private-ssh-key-is-exposing.html


