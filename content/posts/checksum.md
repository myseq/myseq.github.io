---
title: "Checksum"
date: 2021-09-11T00:12:55+08:00
tags: [ "cli", "crypto", "hashing", "win10", "win11" ]
categories: [ "Posts"  ]
summary: "md5sum equivalent in Windows."
draft: false
---
{{< lead >}}
*A handy cmdline to make a checksum of a file like `md5sum` in Linux.*
{{< /lead >}}

There is a built-in utility in Windows OS to make a checksum of a file.

For this, the `certutil` is a built-in cmdline tool that can generate different hashes for a file.

### Checksum

**MD5** hash checksum (`md5sum`):

```
C:\> certutil -hashfile c:\windows\explorer.exe md5
MD5 hash of c:\windows\explorer.exe:
24ad59abaf730e71bc865922d8596008
CertUtil: -hashfile command completed successfully.
```

**SHA256** hash checksum (`sha256sum`):

```
C:\> certutil -hashfile c:\windows\explorer.exe sha256
SHA256 hash of c:\windows\explorer.exe:
988a56d897915315eef9ca679b3bc8adfcecf5e227aea99aaa1817620520e97e
CertUtil: -hashfile command completed successfully.
```

### Hash Algorithms

`certutil` supports 7 hash algorithms:

``` {title="Hash Algorithm"}
MD2 MD4 MD5 SHA1 SHA256 SHA384 SHA512
```

Get help:

```cmd {title="Command Prompt"}
C:\Users\xx> certutil -hashfile -?
Usage:
  CertUtil [Options] -hashfile InFile [HashAlgorithm]
  Generate and display cryptographic hash over a file

Options:
  -Unicode          -- Write redirected output in Unicode
  -gmt              -- Display times as GMT
  -seconds          -- Display times with seconds and milliseconds
  -v                -- Verbose operation
  -privatekey       -- Display password and private key data
  -pin PIN                  -- Smart Card PIN
  -sid WELL_KNOWN_SID_TYPE  -- Numeric SID
            22 -- Local System
            23 -- Local Service
            24 -- Network Service

Hash algorithms: MD2 MD4 MD5 SHA1 SHA256 SHA384 SHA512

CertUtil -?              -- Display a verb list (command list)
CertUtil -hashfile -?    -- Display help text for the "hashfile" verb
CertUtil -v -?           -- Display all help text for all verbs
```

