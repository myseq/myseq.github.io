---
title: "SSH Passphrase Management"
date: 2026-05-13T02:24:40+08:00
tags: [ "passphrase", "ssh" ]
categories: [ "Posts"  ]
series: [ "SSH" ]
series_order: 2
summary: "Add a passphrase to an existing SSH key pair."
draft: false
---
{{< lead >}}
*Adding a passphrase to an SSH key is a security best practice that helps protect it from unauthorized use.*
{{< /lead >}}

> There will be no change to our public key file.

## SSH Passphrase

SSH passphrase management is simple.
Because we use the __same command__ for all the task below:

 * To add a new passphrase
 * To remove a passphrase (*using* ___ENTER___)
 * To change an existing passphrase

> Replace `~/.ssh/id_ed25519` with the path to your actual private key file, such as `~/.ssh/id_rsa`.

```console
$ ssh-keygen -p -f ~/.ssh/id_ed25519
```

And follow the prompts:

 - __Enter old passphrase:__ If the key currently has no passphrase, just press `Enter`. Or type the current one if any.
 - __Enter new passphrase:__ Type the passphrase you want to add.
 - __Enter same passphrase again:__ Retype it to confirm.

A shortcut to state empty passphrase (without hitting the ENTER key twice):

```console
$ ssh-keygen -f ~/.ssh/id_ed25519 -p -N ""
```

### Where It Stores?

By default, the passphrase for your private SSH key **is not stored anywhere** as a separate text file.
Instead, it is used to __encrypt the private key file itself__.

The ___secret___ lives at 2 places:

 - **Inside Private Key File:** After a passphrase is set, there will be headers like `ENCRYPTED` or `Proc-Type: 4,ENCRYPTED` added to private key file, which indicate the data inside is scrambled.

 - **In our brain:** Ideally, the passphrase only exists in our memory (and sometimes computer RAM).

### Helper Storage

This is optional.
We can have our computer to "remember" the passphrase so we don't have to type it every time.
It is being stored in on of these helper tools:

 - **SSH Agent**: This stores the *decrypted* version of the private key in computer RAM.

 - **macOS Keychain**: This is a feature selected "Remember password in my keychain".

 - **Linux Keyring**: GNOME Keyring can store the passphrase to automatically unlock the private key.

