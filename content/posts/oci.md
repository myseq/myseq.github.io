---
title: "Oracle Cloud Infratructure"
date: 2026-04-21T21:21:21+08:00
tags: [ "2fa", "cloud", "free", "nginx", "oracle" ]
categories: [ "Posts"  ]
summary: "Setup a JUMP server with OCI."
authors:
  - "xx"
draft: false
---
{{< lead >}}
*Setup my public accessible jump server with Oracle Cloud Infrastructure.*
{{< /lead >}}

I need a SSH jump-server that:

 - listening on port 22022/tcp
 - having a presistent public IP address
 - can be accessed via URL domain name instead of IP address
 - Always *FREE*

So, I'm creating all these based on my post on [Oracle Cloud Free Tier](/posts/oracle_cloud_free_tier/).

> In case you need to register one, go signup at <https://signup.cloud.oracle.com/>

## Register OCI

Here's a simple steps to create an **Oracle Cloud Infrastructure (OCI) Always Free** account.

Prepare these before you start:

 - A valid credit card (for verification)
 - A mobile phone (for SMS verification)

Go to <https://www.oracle.com/cloud/free/> and click "Start for Free".
Enter the information for registration.

## Cloud Shell

If all we need is just a shell terminal access, we can click on the "**>_ Cloud Shell**" (at the top right).

We will get a persistent home directory to store our files.
But we can't install any package on this Cloud Shell.

## OCI Instance

To set up an Ubuntu instance with a persistent (Reserved) Public IP, we need to create the IP first.
This ensures we can assign it immediately during the instance creation process.

Create a Reserved Public IP:

 - From OCI Console, navigate to **Networking** > **IP Management** > **Reserved Public IPs**
 - Click **Reserve Public IP Address**
 - Enter a **Name**
 - Leave **IP Address Source** as "Oracle"
 - Click **Reserve Public IP Address**

Here's how I launch my Ubuntu Instance:

 - Goto **Compute** > **Instance**
 - Click **Create Instance**
 - Enter **Name** (like: orange)
 - Ensure **Placement** remains as "Always Free Eligible"
 - Select Image: Canonical Ubuntu
 - Select Shape: 
 - Networking: **Virtual Cloud Network**
   - Subnet: **Public Subnet**
   - Public IP Address: **No public IP address**
 - SSH Keys: Generate a key pair. Save the **Private Key** and **Public Key**

Next, let OCI continue to create the instance till it is running.
Last, we will attach the Reserved IP:

 - Select the Instance
 - Scroll down to **Resource** section and click **Attached VNICs**
 - Click the **Primary VNIC**
 - Click **IPv4 Addresses**
 - Click the 3-dot next to the esiting Private IP and select **Edit**
 - Under **Public IP Type**, change the selection to **Reserved Public IP**
 - Select **Select Existing Reserved Public IP** and pick the name created earlier
 - Click **Update**

## Security Check

By default, OCI blocks all incoming traffic. 
To access my Ubuntu server:

 - Go to **Networking** > **Virtual Cloud Networks** > **[VCN]**.
 - Click **Security Lists** > **Default Security List**.
 - Ensure there is an **Ingress Rule** for Port 22 (SSH).
 - Create aditional rules for port 80 (HTTP web) and 22022 (alternate SSH)


## Oracle 2FA Recovery

Here's a short instruction in case you need to reset your 2FA with Oracle Cloud.

Prepare these information before you start calling support.

 - email
 - tenant name (account name)
 - phone number
 - credit card expiry date and last 4 digis

Then:

 1. Goto <https://www.oracle.com/corporate/contact/>
 1. Click "Open live char" under "char with sales"
 1. Click "Get support"
 1. Select "Always free Cloud Infrastructure"
 1. Click "Cloud Support Chat"
 1. Start the chat
 1. Select "Password reset or can't sign in"
 1. Select 'no"
 1. Click "chat with live agent"
 1. Paste the info to the chat when asked by the agent to do so.

> If the information matches, your account will be reset in 4 hours time.

## DuckDNS

Goto <https://www.duckdns.org> and sign-in with your Google account.

Select a hostname and register with DuckDNS.

Back to the Ubuntu Instance.
Create a file at `~/duckdns/duck.sh`

```conf
echo url="https://www.duckdns.org/update?domains=<your_host>&token=<your duckdns_key>&ip=" | curl -k -o ~/duckdns/duck.log -K -
```

Make sure it is executable: `chmod 700 ~/duckdns/duck.sh`

And finally create a cron job:

```console
% crontab -e
*/5 * * * * ~/duckdns/duck.sh >/dev/null 2>&1
% crontab -l
*/5 * * * * ~/duckdns/duck.sh >/dev/null 2>&1
%
```

## Jump Server

Here're some of my notes in setting up the shell in Jump Server.

```console
$ git clone https://github.com/myseq/dotfiles.git
$ sudo apt install -y zsh vim-nox
$ sudo passwd ubuntu
New passowrd:
Confirm password:
$ chsh
/usr/bin/zsh
$ echo "source $HOME/dotfiles/shellstartup" .zshrc
$ exit
```

Install packages:

```console
% sudo apt install cockpit glances htop tmux
%
```


Edit SSHD configuration to support 22022/tcp

```console
% cat /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
Port 22
Port 22022
PasswordAuthentication no
PrintMotd yes
%
% sudo systemctl daemon-reload
% sudo systemctl reload ssh
%
```

Install Nginx as HTTP web and reverse proxy.

```console
% sudo apt install curl gnupg2 ca-certificates lsb-release ubuntu-keyring
% curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg > /dev/null
% echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/ubuntu $(lsb_release -cs) nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
% sudo apt update
% nginx -v
nginx version: nginx/1.30.0
```


