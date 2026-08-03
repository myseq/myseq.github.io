---
title: "Two-Factor Authentication"
date: 2026-07-19T02:34:40+08:00
tags: [ "2fa", "auth", "mfa", "ssh" ]
categories: [ "Posts" ]
series: [ "SSH" ]
series_order: 6
summary: "Secure remote SSH server by setting up two-factor authentication without relying on terminal QR code rendering."
draft: false
---
{{< lead >}}
*Protect your SSH server with two-factor authentication (2FA).*
*Require both an SSH key and a temporary code to log in.*
{{< /lead >}}

## Use Two-Factor Authentication (2FA/MFA)

Passwords and SSH keys can be stolen. 
Adding a one-time code keeps your server safe even if a key leaks.

### Step 1: Install the PAM Module

Install the Google Authenticator PAM package on your remote server:

```bash
sudo apt update
sudo apt install libpam-google-authenticator
```

### Step 2: Set Up 2FA via Text (No QR Code Needed)

Terminal QR codes often break or render poorly over remote SSH connections. 
Run the setup tool with flags to output plain text details instead:

```bash
google-authenticator -t -d -f -r 3 -R 30 -W
```

What these flags do:
- `-t`: Use time-based tokens (TOTP).
- `-d`: Disallow reuse of the same token.
- `-f`: Force writing the configuration to `~/.google_authenticator`.
- `-r 3 -R 30`: Limit logins to 3 attempts every 30 seconds (rate limiting).
- `-W`: Enable window skew to allow minor clock differences.

The command outputs text similar to this:

```text
Your new secret key is: JX7X2K3L4M5N6O7P
Your verification code is 123456
Your emergency scratch codes are:
  12345678
  87654321
  ...
```

1. Copy the **secret key** and manually add it to your authenticator app.
2. Save the **emergency scratch codes** in a secure location.

### Step 3: Configure PAM for SSH

Open the PAM configuration file:

```bash
sudo vi /etc/pam.d/sshd
```

Add this line **at the very top** of the file:

```text
auth required pam_google_authenticator.so
```

Save and close the file (`Ctrl+O`, `Enter`, `Ctrl+X`).

### Step 4: Configure the SSH Daemon

Open your SSH configuration file:

```bash
sudo nano /etc/ssh/sshd_config
```

Ensure the following directives are configured:

```text
KbdInteractiveAuthentication yes
AuthenticationMethods publickey,keyboard-interactive
```

*(Note: On older Ubuntu releases, use `ChallengeResponseAuthentication yes` instead of `KbdInteractiveAuthentication yes`.)*

Save and close the file.

### Step 5: Restart SSH and Test

Restart the SSH daemon to apply changes:

```bash
sudo systemctl restart ssh
```

> **Warning:** Do not close your current terminal window yet. 
> Open a new terminal session to test logging in with both your SSH key and your 2FA code.

## Links

- [Hardening SSH Access on Ubuntu VPS](https://www.interserver.net/tips/kb/hardening-ssh-access-on-ubuntu-vps-the-ultimate-guide/)

