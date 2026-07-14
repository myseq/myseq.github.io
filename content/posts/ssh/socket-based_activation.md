---
title: "SSH Socket-Based"
date: 2026-07-07T13:57:40+08:00
tags: [ "socket", "ssh" ]
categories: [ "Essential", "Posts"  ]
series: [ "SSH" ]
series_order: 5
summary: "Using socket activation is recommended wherever possible."
draft: false
---
{{< lead >}}
*While `systemd` socket activation for SSH can be an adjustment, it ultimately provides better efficiency.*
{{< /lead >}}


## Why/What is Socket-Based?

**Socket-based SSHD** refers to a feature where the OpenSSH daemon is not running in the background constantly. 
Instead, `systemd` monitors the SSH port (Port 22) and only starts the actual SSH service when an incoming connection attempt is detected.

> Since Ubuntu 22.10, Canonical has continued in optimizing SSH (OpenSSH) by using `systemd` **socket-based** activation instead of running standalone service.

### The Difference

 - **Traditional** (`ssh.service`): The `sshd` service runs continuously in the background from boot, actively consuming memory and system resources whether anyone is connecting or not.

 - **Socket-based** (`ssh.socket`): `systemd` handles the waiting. It wakes up, triggers sshd, and hands off the connection only when a user attempts to log in.

### The Benefits

The main benefit is **resource efficiency**.

 - **Reduced memory footprint** by saving system resources (3~5 MiB) as `sshd` isn't running 24/7.
 - **Improved parallelization** in faster boot times and better efficiency in service management by allowing `systemd` to handle the initial socket setup.


## Managing Socket-Based SSH

We still manage SSH with `systemctl` command on either traditional (`ssh.service`) or socket-based (`ssh.socket`).

```console
% systemctl status [ ssh.service | ssh.socket ]
% systemctl stop [ ssh.service | ssh.socket ]
% systemctl start [ ssh.service | ssh.socket ]
% systemctl restart [ ssh.service | ssh.socket ]
```

To revert back to `ssh.service`:

```console
% sudo systemctl disable --now ssh.socket
% sudo systemctl enable --now ssh.service
```

To switch to socket-based `ssh.socket`:

```console
% sudo systemctl disable --now ssh.service
% sudo systemctl enable --now ssh.socket
```

### Customize SSH Port

By default, SSH listens on `port 22` even in socket-based.

To change SSH port to `22022` (and close 22), we used to do:

```config
#/etc/ssh/sshd_config
#Port 22
Port 22022
```

But for socket-based SSH configuration, we need to:

```console
% sudo mkdir -p /etc/systemd/system/ssh.socket.d
% sudo cat > /etc/systemd/system/ssh.socket.d/listen.conf <<EOF
[Socket]
ListenStream=
ListenStream=22022
EOF
```

> Note that the first line `ListenStream=` is needed to disable the port 22.

Reload and restart: `sudo systemctl daemon-reload` and `sudo systemctl restart ssh`


## Links 

 - [Understanding SSH Scoket-Based Activation](https://dev.to/saishanmukkha/understanding-ssh-socket-based-activation-in-ubuntu-2404-28m)

