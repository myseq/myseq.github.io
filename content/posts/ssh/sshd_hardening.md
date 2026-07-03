---
title: "OpenSSH Hardening"
date: 2026-06-23T07:21:40+08:00
tags: [ "hardening", "ssh", "ubuntu" ]
categories: [ "Essential", "Posts"  ]
summary: "SSH Hardening: First Line of Defense on Ubuntu VPS."
series: [ "SSH" ]
series_order: 4
draft: false
---
{{< lead >}}
*The default settings of SSH prioritize accessibility, not security.*
{{< /lead >}}

Starting with `OpenSSH 8.2`, SSH supports **directory-based configuration**. 
This means OpenSSH reads the `Include /etc/ssh/sshd_config.d/*.conf` line in the main `/etc/ssh/sshd_config` file first.

> Cloud providers (like AWS, Azure or DigitalOcean) use `cloud-init` to securely inject initial SSH keys.

For example, in `Ubuntu`, `etc/ssh/sshd_config.d/50-cloud-init.conf` is an auto-generated file created by cloud-init during the initial setup of cloud instance.
It dictates specific SSH behavior.

If we make edits to `/etc/ssh/sshd_config` (such as trying to disable `PasswordAuthentication`).
But it doesn't seem to take effect.
It is likely being overridden by conflicting settings in `/etc/ssh/sshd_config.d/50-cloud-init.conf`

This guide will walk through step-by-step SSH hardening on Ubuntu VPS.

{{< alert >}}
*In this post, we are using `ubuntu` as username.*
{{< /alert >}}

Let's move on to `Ubuntu` server hardening.

## SSH Daemon (sshd)

> Here, we don't **backup** SSHD configuration.
> Because we won't make any change and simply **override** the default configuration.

Instead, we can make safe edits to SSH config by defining our own hardening file/rules: 
`/etc/ssh/sshd_config.d/99-hardening-settings.conf`

```console
% sudo cat > /etc/ssh/sshd_config.d/99-hardening-settings.conf <<EOF
# Disable OS Banner (before login)
DebianBanner no

# Add an additional port
#Port 22
Port 22022

#AddressFamily any
#ListenAddress ::
AddressFamily inet
ListenAddress 0.0.0.0

# Disable root login entirely
PermitRootLogin no

# Disable password authentication 
PasswordAuthentication no

# Disable empty passwords
PermitEmptyPasswords no

# Disable keyboard-interactive and challenge-response auth (s/key or PAM-based prompts)
ChallengeResponseAuthentication no

# Disable Pluggable Authentication Module (PAM)
## UsePAM can ensure locked account cannot login
UsePAM yes

# Use key-based authentication
PubkeyAuthentication yes

# Use only SSH protocol 2
Protocol 2

# Limit authentication attempts per connection
MaxAuthTries 3

# Set connection timeout 
ClientAliveInterval 600
ClientAliveCountMax 2

# Disable X11 forwarding (not needed)
X11Forwarding no

# Disable TCP forwarding unless you specifically need it
AllowTcpForwarding no

# Only allow specific users to connect via SSH
AllowUsers ubuntu opc

# Use strong key exchange algorithms, ciphers, and MACs
KexAlgorithms curve25519-sha256,curve25519-sha256@libssh.org
Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com,aes128-gcm@openssh.com
MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com

# Max login time (in seconds) after connecting - prevent rbute-force or DoS
LoginGraceTime 20

# Limit the open multiplexed shell login sessions per network (default 10)
MaxSessions 3

# To print the Message of the Dar upon successful login
PrintMotd yes

# Disable custom environment variables from client
PermitUserEnvironment no

EOF
```

Basically, the hardening settings include:

 - Disable the OS banner
 - Change the default SSH port
 - Disable password authentication method
 - Disable direct root-login
 - Disable empty password
 - Enforce public key authentication method
 - Enforce strong key exchange algorithm
 - Prevent brute-force or DoS attacks

{{< alert icon="fire" cardColor="#e63946" iconColor="#1d3557" textColor="#f1faee" >}}
> Do not close the existing SSH session.
> Test the new configuration with another new terminal instead.
{{< /alert >}}

Then, follow by testing and restart the OpenSSH Server.

```console
% sudo sshd -t 
% sudo systemctl restart ssh
```

{{< alert >}}
**Remember:** *Before disabling `root`, ensure your non-root user (`ubuntu`) is in the `sudo` group.* 

*Check with `groups ubuntu` or add with `sudo usermod -aG sudo ubuntu`.*
{{< /alert >}}


And (optional) try validate it by copying public key from local machine to `Ubuntu` server at TCP port `22022`.

```console
% ssh-copy-id -i ~/.ssh/ided25519.pub -p 22022 username@ubuntu_server_ip
```

## Firewall Lockdown

Update firewall rules.

```console
% sudo ufw allow 22022/tcp
% sudo ufw limit 22022/tcp
% sudo ufw logging medium
% sudo ufw status numbered
```

And ensure all the rules are correct!
Or delete any unnecessary rules with:

```console
% sudo ufw delete RULE_NUMBER
```

## Install Fail2Ban

`Fail2Ban` monitors log files for repeated authentication failures.
It automatically *bans* offending IP addresses by adding firewall rules. 

{{< alert >}}
**Tip:** *It's essential for any internet-facing server.*
{{< /alert >}}

Start by install and setup a local `fail2ban`.

```console
% sudo apt install fail2ban
% sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

Add the following configuration to `/etc/fail2ban/jail.local`:

```config
[DEFAULT]
# Ban duration: 1 hour for first offense
bantime = 3600

# Time window for counting failures
findtime = 600

# Number of failures before ban
maxretry = 5

# Use UFW as the ban action
banaction = ufw

[sshd]
enabled = true
port = 22022
filter = sshd
logpath = /var/log/auth.log
maxretry = 4
bantime = 7200
findtime = 300
```

This configuration:

 - Bans IPs for 1 hour by default (2 hours for SSH specifically)
 - Looks at a 5-minute window for SSH (10 minutes default)
 - Triggers after 4 failed SSH attempts (5 for other services)
 - Uses UFW to implement the bans (`ufw status`)

Then enable and start `Fail2Ban`:

```console
% sudo systemctl enable fail2ban
% sudo systemctl start fail2ban
%
% sudo systemctl restart fail2ban
```

Check the overall status and SSHD jail:

```console
% sudo fail2ban-client status
% sudo fail2ban-client status sshd
Status for the jail: sshd
|- Filter
|  |- Currently failed: 0
|  |- Total failed:     0
|  `- File list:        /var/log/auth.log
`- Actions
   |- Currently banned: 3
   |- Total banned:     3
   `- Banned IP list:   186.13.24.118 64.89.161.56 71.173.193.16
```

To manually *unban* an IP:

```console
% sudo fail2ban-client set sshd unbanip 127.0.0.2
```

## Troubleshooting 

Test the configuration file for any syntax errors:

```console
% sudo sshd -t
```

{{< alert >}}
**Tip!** Must be `sudo sshd -t` to avoid annoying error like `sshd: no hostkeys available -- exiting.`.
{{< /alert >}}

If no errors are reported, restart the SSH service:

```console
% sudo systemctl restart ssh
```

Another way to *debug* the validity of the configuration file.

This is to output the *effective configuration* to stdout.

```console
% sudo sshd -T
```


## Links

 - [Ubuntu 24.04 VPS Security Hardening Guide](https://massivegrid.com/blog/ubuntu-vps-security-hardening-guide/)
 - [How To Harden OpenSSH on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-harden-openssh-on-ubuntu-20-04)
 - [Hardening SSH Access on Ubuntu VPS](https://www.interserver.net/tips/kb/hardening-ssh-access-on-ubuntu-vps-the-ultimate-guide/)

