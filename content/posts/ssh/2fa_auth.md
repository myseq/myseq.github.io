---
title: "Two-Factor Authentication"
date: 2026-07-19T02:34:40+08:00
tags: [ "2fa", "auth", "mfa", "ssh" ]
categories: [ "Posts"  ]
series: [ "SSH" ]
series_order: 6
summary: ""
draft: true
---
{{< lead >}}

{{< /lead >}}


## Use Two-Factor Authentication (2FA/MFA)
Adding a one-time code (such as from Google Authenticator) makes stolen keys or passwords useless by themselves.

Step 1: Install the needed module:

sudo apt install libpam-google-authenticator
Step 2: For each user, run:

google-authenticator
This will provide a QR code to scan with your authentication app and offer backup codes. Answer prompts to secure the setup.

Step 3: Configure PAM to require the authenticator. Edit /etc/pam.d/sshd and add AT THE TOP:

auth required pam_google_authenticator.so
Step 4: In /etc/ssh/sshd_config, set:

ChallengeResponseAuthentication yes AuthenticationMethods publickey,keyboard-interactive
This means both a valid SSH key and the one-time code are needed to connect.

Step 5: Save, restart SSH, and test with your authenticator app and private key.

## Links

 - https://www.interserver.net/tips/kb/hardening-ssh-access-on-ubuntu-vps-the-ultimate-guide/



