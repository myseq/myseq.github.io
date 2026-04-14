+++
title = "Encrypted Shell Script"
date = "2023-01-04T19:07:19+08:00"
author = ""
tags = [ "bash", "crypto", "tools" ]
categories = [ "Posts" ]
summary = "We can encrypt our BASH shell script to protect some confidential configuration."
draft = false
+++

In this tutorial, let's see how to encrypt our shell script with an opensource tool called `shc`. But, personally, I won't call `shc` a security tool. It is just an obfuscation tool. 

## What is `shc`?

`shc` is called a "generic script compiler". It takes a shell script, convert it to C source code, and compile it as binary executable.

`shc` is not a compiler. It rather encodes and encrypts a shell script , and generate C source code. It also has an additioanal capability to apply expiration date while generating the C source code. It also strips the binary after compilation. Upon execution, the `compiled+encrypted` binary will first decrypt and execute the code with the shell -c option.

## Installation

We can install `shc` directly, or we can build it from source.
```console
$ sudo apt install shc
```

To build from the soruce:
```shell
$ git clone https://github.com/neurobin/shc.git
$ cd shc
$ ./cofngiure 
$ make 
$ sudo make install
```

## Usage

For example, we would like to encrypt a shell scipt called `check_online.sh`.
```shell
$ shc -v -f check_online.sh
shc shll=bash
shc [-i]=-c
shc [-x]=exec '%s' "$@"
shc [-l]=
shc opts=
shc: cc   check_online.sh.x.c -o check_online.sh.x
shc: strip check_online.sh.x
shc: chmod ug=rwx,o=rx check_online.sh.x
$
$ file check_online.sh.x
check_online.sh.x: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=377c5f8b2d1cd55f759bf613fef92824d2b4ab3a, for GNU/Linux 3.2.0, stripped
$
```

To add expiration date to the script:
```shell
$ shc -v -e 01/01/2023 -m "Contact author to use this script" -f check_online.sh
shc -e Sun Jan  1 00:00:00 2023
shc -e Sun Jan  1 00:00:00 2023
shc shll=bash
shc [-i]=-c
shc [-x]=exec '%s' "$@"
shc [-l]=
shc opts=
shc: cc   check_online.sh.x.c -o check_online.sh.x
shc: strip check_online.sh.x
shc: chmod ug=rwx,o=rx check_online.sh.x
$ ./check_online.sh.x yahoo.com 
./check_online.sh.x: has expired!
Contact author to use this script
```

## Troubleshoot

In case you see the "shc: invalid first line in script" error, it means the original shell script has a missing "shebang", like `#!/bin/bash` or `#!/bin/sh`.


## Links

- [Shell Script Compiler](https://github.com/neurobin/shc)

