---
title: "Secret Sharing with SSH Key"
date: 2026-08-10T15:30:13+08:00
tags: [ "asymmetric", "cli", "crypto", "ssh" ]
categories: [ "Essential", "Posts"  ]
series: [ "SSH" ]
series_order: 8
summary: "Encrypt content with an RSA SSH key, just like PGP/GPG."
draft: false
---
{{< lead >}}
*Technically, we can encrypt our content using an SSH key pair, but only if the key pair uses* ***RSA algorithm***.
{{< /lead >}}

> *I'll be sharing some less commonnly used feature/topic in SSH starting from part 8 ([SSH series](/series/ssh/)).*

Asymmetric encryption (public/private keys) is slow and cannot handle large content in nature.
Thus, standard cryptographic practice requires a two-step process:
*encrypt the data with a fast symmetric key, then encrypt that symmetric key with a SSH public key.*

## Encryption

Even with an RSA key, SSH keys are not natively designed for file encryption. 
And we must convert the key format so that standard tools like `openssl` can read it.


### PKCS8 Format


First, we generate a new RSA SSH key pair for testing.
Then, we export the public SSH key to a standard PKCS8 format (`rsa4096_public_key.pem`). 

```console
% ssh-keygen -t rsa -b 4096 -C "rsa4k@testing"
...
Your identification has been saved in /home/xx/.ssh/id_rsa
Your public key has been saved in /home/xx/.ssh/id_rsa.pub

% ssh-keygen -e -f ~/.ssh/id_rsa.pub -m PKCS8 > rsa4096_public_key.pem 
% cp ~/.ssh/id_rsa ./rsa4096_private_key.pem
% ssh-keygen -p -f rsa4096_private_key.pem -m PEM
```

We also need the SSH private key for decryption later.

So we make a copy of the OpenSSH private key `rsa4096_private_key.pem` from `id_rsa`.
And we convert it from OpenSSH private key format to RSA private key format.

### Secret Key

Generate a temporary random secret key called `temp_secret.key`.

```console
% openssl rand -out temp_secret.key 64
```

### Content Encryption

Now, we encrypt our content (`content.txt`) and produce `ciphertext.enc` using the secret key (`temp_secret.key`).

```console
% openssl aes-256-cbc -in content.txt -out ciphertext.enc \
   -pass file:temp_secret.key
% file ciphertext.enc
ciphertext.enc: openssl enc'd data with salted password
```

### Public Key

We also encrypt the secret key (`temp_secret.key`) with exported SSH public key (`rsa4096_public_key.pem`).

```console
% openssl pkeyutl -encrypt -pubin -inkey rsa4096_public_key.pem \
   -in temp_secret.key -out secret.key.enc
% file secret.key.enc 
secret.key.enc: data
% ls *.enc
ciphertext.enc  secret.key.enc
```

## Decryption

The decryption involves 2 steps.

### Secret Key

To extract the temporary secret key from `secret.key.enc` with RSA private key (`rsa4096_private_key.pem`).

```console
% openssl pkeyutl -decrypt -inkey rsa4096_private_key.pem \
   -in secret.key.enc -out temp2_secret.key
% diff temp_secret.key temp2_secret.key
```

In this case, `temp2_secret.key` is the same as the `temp_secret.key`.

### Content Decryption

```console
% openssl aes-256-cbc -d -in ciphertext.enc -out plain.txt \
    -pass file:temp2_secret.key
% diff plain.txt content.txt 
```

In this case, `plain.txt` is the same as the `content.txt`.
And we just successfully decrypt the file (`ciphertext.enc`) back to plain text document.

> *Modern SSH key formats like ED25519 or ECDSA cannot be natively used for direct file encryption because they are mathematically designed strictly for digital signatures, not encryption.*


## Short POC

 1. Preparation and SSH keys conversion to PEM.

```console
% lorem > content.txt
% ssh-keygen -f id_rsa.pub -e -m PKCS8 > rsa_pub.pem
% cp ~/.ssh/id_rsa .
% ssh-keygen -f id_rsa -m PEM -p -N ""    
% mv id_rsa rsa_pvt.pem
```

 2. Encrypt the `content.txt`.

```console
% openssl rsautl -pubin -inkey rsa_pub.pem -encrypt -pkcs \
   -in content.txt -out cipher.enc
The command rsautl was deprecated in version 3.0. Use 'pkeyutl' instead.
```

 3. Decrypt the `cipher.enc` to `plain.txt`.

```console
% openssl rsautl -inkey rsa_pvt.pem -decrypt -in cipher.enc -out plain.txt
The command rsautl was deprecated in version 3.0. Use 'pkeyutl' instead.
% diff plain.txt content.txt   
% ls 
cipher.enc  content.txt  id_rsa.pub  plain.txt  rsa_pub.pem  rsa_pvt.pem
```

## Tools

 1. age
    
    `age` is a simple, modern and secure file encryption tool, format and Go library. 
    
    It features small explicit keys, post-quantum support, no config options, and UNIX-style composability.

 1. jass

    `jass` let us encrypt/decrypt data using SSH keys. 



## Links 

 - File Encryption with [age](https://github.com/FiloSottile/age) (GitHub)
 - File Encryption with [jass](https://github.com/jschauma/jass) (GitHub)
 - [Sharing Secrets Using SSH Keys I](https://www.netmeister.org/blog/sharing-secrets-using-ssh-keys.html)
 - [Sharing Secrets Using SSH Keys II](https://www.netmeister.org/blog/jass.html)
 

