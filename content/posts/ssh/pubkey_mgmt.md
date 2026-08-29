---
title: "SSH Public Keys Management"
date: 2026-09-02T15:32:50+08:00
tags: [ "asymmetric", "hardening", "ssh", "sysadm" ]
categories: [ "Essential", "Posts"  ]
series: [ "SSH" ]
series_order: 10
summary: "SSH public key management with `authorized_keys`."
draft: false
---
{{< lead >}}
{{< /lead >}}

Goto previous post in case you haven't know the difference between SSH **public key** and **host key**.

{{< article link="/posts/ssh/pubkey_hostkey/" >}}

## Why Public Key Mgmt?

Many may not know why we need to manage SSH public keys.

Short answer: ***securing public facing SSH server for vendor/partner access.***

By merely deploying SSH server (encrypting traffic) and using strong crypto (RSA-4096 or ED25519) are not enough.

Simply granting a shell access (via SSH) to vendor to upload/download files is at **high risk**.
With a shell access, it is hard to prevent an unhappy employee to plant a backdoor access, or hopping to another host (via tunnelling).

How about "X11-Forwarding", IP address restriction? 
How about expiry and key rotation?

And this is the reason why we need to manage the SSH public key for our SSH server.
There are 2 ways to manage SSH public keys at SSH server.

 1. SSH Account Management
 1. Centralized Management

## SSH Account Mgmt

This is useful when there is only 1 OpenSSH server with a few (less than 10) SSH accounts to be secured.

> Many default OpenSSH server has the default configuration inside `/etc/ssh/sshd_config` as `#AuthorizedKeysFile     .ssh/authorized_keys .ssh/authorized_keys2`.

Users (vendors) create their SSH key pair. 
And they will share their SSH public over to our SSH server via `ssh-copy-id`. 

Once it is successful, the user's public key will appear at user's $HOME folder (`~/.ssh/authorized_keys`).

```
ssh-ed25519 AAAAC3NzaC1....7H6pWwt+pmCmWujjYgNIYw9v user@vendor
```

From here, we can see that the `user@vendor` has created the SSH key pair using `ED25519`.
There is no option configured and it grants full account access with this key.

And it also tell us that only 1 SSH client (one line) can access to this account now. 

{{< alert >}}
*If we see more than 1 line in `authorized_keys`, this means the user might have created a second set SSH key to access this account.*
{{< /alert>}}

Below here is the `authorized_key` formatting, and we will add options to harden the public key access:

```
[options]  key-type  base64-key-material  comment
```

> Assumming we've hardened the SSHD server to only use Public Key authentication and disable user/password authentication.  

Then we can start restrict the access (manually).

### File Mgmt-Only

For example, we want to restrict the user access from specific address only, and only upload or download the files.
Then we can modify it file `~/.ssh/autheorized_keys` as below:

```
restrict,from="10.0.22.21",command="internal-sftp" ssh-ed25519 AAAAC3....NIYw9v user@vendor
```

With this, we've restrict the user access:

 - from the source IP address `10.0.22.21` only. (More IP addr can be appended with comma separated or using CIDR `10.0.22.0/24`)
 - session straight into OpenSSH's built-in SFTP service. (User can upload/move files but never get a shell)
 - `restrict`: deny-by-default to turn off port forwarding, agent forwarding, X11, PTY allocation.

### Key Expiration

This is mainly used for the situation where key rotation is a MUST in company policy.

```
expiry-time="202612312359",restrict,from="10.0.22.21",command="internal-sftp" ssh-ed25519 AAAAC3....NIYw9v user@vendor
```

With this, we've forced a standard public key to expire by `2026-12-31 23:59`.
And the server will automatically reject this key at midnight on Dec 31, 2026.

### Prevent User Tampering

Imagine if the public keys are stored in `~/.ssh/`, users can modify own files to add backdoors or share accounts.
Thus, we can restrict the `authorized_keys` to be `root`-owned to stops users from changing authorized keys.

```
% chmod 400 ~/.ssh/authorized_keys
% sudo chown root ~/.ssh/authorized_keys
% ls -l ~/.ssh/authorized_keys 
-r-------- 1 root vendors 495 Jul 14 00:52 /home/user/.ssh/authorized_keys
```

## Centralized Mgmt

Whenever we have more than 10 accounts, we might want to consider managing SSH public key centrally instead of modifying individual `authorized_keys`.

Centralized management means a centralized directory will be used by OpenSSH server to store public keys outside of standard user home directories.

And `sysadm` can use the `/etc/ssh/authorized_keys/` path for centralized key management and hardened system security.

Benefits:

 - Prevent user tampering. 
 - Bypass the bootstrap issue when encrypted home folders (`eCRyptfs`) blocks the server from reading the `~/.ssh/authorized_keys`.
 - Automation with Ansible on key deployment, audit, revoke access keys.

Edit in `/etc/ssh/sshd_config`:

```
#AuthorizedKeysFile .ssh/authorized_keys .ssh/authorized_keys2
AuthorizedKeysFile /etc/ssh/authorized_keys/%u
```

 - `%u` tells the server to look for a file explicitly matching the connecting **username** (e.g., /etc/ssh/authorized_keys/john).
 - `%U` can alternatively be used to look for a file named after the user's numeric user ID.

### File Permissions

SSH enforces strict security checks via `StrictModes`. 
If directory or file permissions are too open, the SSH daemon will reject the connection and throw an error. 

Secure your directory structure using these root commands:

```bash
# 1. Create the central keys directory
sudo mkdir -p /etc/ssh/authorized_keys

# 2. Set directory ownership to root and strict permissions
sudo chown root:root /etc/ssh/authorized_keys
sudo chmod 755 /etc/ssh/authorized_keys

# 3. Create and restrict a specific user's public key file
sudo touch /etc/ssh/authorized_keys/username
sudo chown root:root /etc/ssh/authorized_keys/username
sudo chmod 644 /etc/ssh/authorized_keys/username
```

### Chroot

Update the subsystem line in `/etc/ssh/sshd_config`:

```
Subsystem sftp internal-sftp
```

Goto the end of the file `/etc/ssh/sshd_config`:

```
# Enforce restrictions for members of the 'sftpusers' group
Match Group sftpusers
    #ChrootDirectory %h
    ChrootDirectory /var/sftp/%u        # %u = username
    ForceCommand internal-sftp -u 0027  # sftp onyl; umask sets group-readable files
    AllowTcpForwarding no
    X11Forwarding no
    PermitTTY no
    PasswordAuthentication no
    PubkeyAuthentication yes
```

 - `Match Group sftpusers`: Applies these rules only to users belonging to the `sftpusers` Linux group.
 - `ChrootDirectory %h`: Locks the user into their specific home directory (`%h`). In this case, I prefer to use a hardcoded path like `/var/sftp/%u`.
 - `ForceCommand internal-sftp`: Ignores any command requested by the client (like a bash shell login) and strictly forces the internal SFTP engine.
 - `AllowTcpForwarding no` & `X11Forwarding no`: Blocks the user from opening secure network tunnels through your server.

{{< alert >}}
**Important**: The `Match` block must go at the end because any configurations added after it will only apply to that specific group or user.
{{< /alert >}}

To correctly set up a user named `john`, we need to:

 - create the group and user with no shell access
 - lock down the home folder (owned by `root` with permission `755`)
 - create a writable folder inside chroot jail where `john` can upload files.

```bash
sudo groupadd sftpusers
sudo useradd -g sftpusers -s /sbin/nologin -m john

#sudo passwd john
#sudo chown root:root /home/john
#sudo chmod 755 /home/john
#sudo mkdir /home/john/uploads
#sudo chown john:sftpusers /home/john/uploads
#sudo chmod 750 /home/john/uploads

sudo mkdir -p /var/sftp/john/uploads
sudo chown root:root /var/sftp/john               # jail root: owned by ROOT
sudo chmod 755 /var/sftp/john                     # 
sudo chown john:sftpusers /var/sftp/john/uploads  # writable folder
sudo chmod 750 /var/sftp/john/uploads
```

Finally, test (`sudo sshd -t`) and restart SSH (`sudo systemctl restart ssh`).


## Links 

 - Linux manual page: [sshd(8)](https://man7.org/linux/man-pages/man8/sshd.8.html)
 - SSH Certificates: [A Complete Guide](https://infisical.com/blog/ssh-certificates-guide)
 - SANS: [Securing Your SSH authorized_keys File](https://isc.sans.edu/diary/Securing+Your+SSH+authorizedkeys+File/31986)
 - Sysax: [SFTP Server Control Panel](https://www.sysax.com/topics/sftp/sftp-server-configuration/)
 - Sysax: [Distributing authorized_keys](https://www.sysax.com/topics/ssh-key-management/distributing-authorized-keys/)

