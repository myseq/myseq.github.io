---
title: "Google Pinyin"
date: 2025-04-04T13:13:34+08:00
tags: [ "google", "pinyin", "win10", "win11" ]
categories: [ "Posts"  ]
summary: "Google Pinyin IME"
draft: false
---
{{< lead >}}
*Google Pinyin IME:*
 - *Simplified Chinese:* **谷歌拼音输入法** 
 - *Traditional Chinese:* **谷歌拼音輸入法** 
{{< /lead >}}

## Pinyin Input

An excellent tool that was made publicly available on April 4, 2007.
Aside from Pinyin input, it also includes stroke count method input. 

As of March 2019, Google Pinyin has been *discontinued* and the download page `tools.google.com/pinyin/` has been deleted. 


```json 
{
  "package": {
      "name": "GooglePinyinInstaller.exe",
      "description": "Google Pinyin IME",
      "version": "2.7.25.128",
      "publisher": "Google China"
  }
}
```

### Download

However, Google Pinyin IME can still be obtained from <https://dl.google.com/pinyin/v2/GooglePinyinInstaller.exe> (*as of August 17, 2024*).

```bash {title="Hash values"}
% md5sum GooglePinyinInstaller.exe
8cb727cea58a127ae955460ccc165a15  GooglePinyinInstaller.exe

% sha1sum GooglePinyinInstaller.exe    
6447a9277445befde4e70217b830285194883f67  GooglePinyinInstaller.exe
```

> Or, download from [local copy](/ime/GooglePinyinInstaller.exe).

### Dump Info


```pwsh {title="Dump information"}
C:\Downloads> certutil -hashfile GooglePinyinInstaller.exe
SHA1 hash of GooglePinyinInstaller.exe:
6447a9277445befde4e70217b830285194883f67
CertUtil: -hashfile command completed successfully.

C:\Downloads> certutil -dump GooglePinyinInstaller.exe
GooglePinyinInstaller.exe: Lang 04b00804 (1200.2052)  File 2.7:25.128  Product 2.7:25.128
PKCS7 Message:
  CMSG_SIGNED(2)
  CMSG_SIGNED_DATA_PKCS_1_5_VERSION(1)
  Content Type: 1.3.6.1.4.1.311.2.1.4 SPC_INDIRECT_DATA_OBJID

PKCS7 Message Content:
================ Begin Nesting Level 1 ================
  0000  ...
  005a
    0000  30 58 30 33 06 0a 2b 06  01 04 01 82 37 02 01 0f   0X03..+.....7...
    0010  30 25 03 01 00 a0 20 a2  1e 80 1c 00 3c 00 3c 00   0%.... .....<.<.
    0020  3c 00 4f 00 62 00 73 00  6f 00 6c 00 65 00 74 00   <.O.b.s.o.l.e.t.
    0030  65 00 3e 00 3e 00 3e 30  21 30 09 06 05 2b 0e 03   e.>.>.>0!0...+..
    0040  02 1a 05 00 04 14 26 ee  94 64 46 e0 a9 fe b4 e9   ......&..dF.....
    0050  c8 e4 d4 92 b3 fb 71 4f  95 10                     ......qO..
----------------  End Nesting Level 1  ----------------

Signer Count: 1
Signing Certificate Index: 1
dwFlags = CA_VERIFY_FLAGS_CONSOLE_TRACE (0x20000000)
dwFlags = CA_VERIFY_FLAGS_DUMP_CHAIN (0x40000000)
ChainFlags = CERT_CHAIN_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT (0x40000000)
HCCE_LOCAL_MACHINE
CERT_CHAIN_POLICY_BASE
-------- CERT_CHAIN_CONTEXT --------
ChainContext.dwInfoStatus = CERT_TRUST_HAS_PREFERRED_ISSUER (0x100)
ChainContext.dwErrorStatus = CERT_TRUST_IS_NOT_TIME_VALID (0x1)
ChainContext.dwRevocationFreshnessTime: 211 Days, 12 Hours, 9 Minutes, 58 Seconds

SimpleChain.dwInfoStatus = CERT_TRUST_HAS_PREFERRED_ISSUER (0x100)
SimpleChain.dwErrorStatus = CERT_TRUST_IS_NOT_TIME_VALID (0x1)
SimpleChain.dwRevocationFreshnessTime: 211 Days, 12 Hours, 9 Minutes, 58 Seconds

CertContext[0][0]: dwInfoStatus=102 dwErrorStatus=1
  Issuer: CN=VeriSign Class 3 Code Signing 2010 CA, OU=Terms of use at https://www.verisign.com/rpa (c)10, OU=VeriSign Trust Network, O="VeriSign, Inc.", C=US
  NotBefore: 2014-01-29 08:00
  NotAfter: 2016-01-30 07:59
  Subject: CN=Google Inc, OU=Digital ID Class 3 - Java Object Signing, OU=Digital ID Class 3 - Java Object Signing, O=Google Inc, L=Mountain View, S=California, C=US
  Serial: 2912c70c9a2b8a3ef6f6074662d68b8d
  Cert: fcac7e666cc54341ca213becf2eb463f2b62adb0
  Element.dwInfoStatus = CERT_TRUST_HAS_KEY_MATCH_ISSUER (0x2)
  Element.dwInfoStatus = CERT_TRUST_HAS_PREFERRED_ISSUER (0x100)
  Element.dwErrorStatus = CERT_TRUST_IS_NOT_TIME_VALID (0x1)
    CRL 3cd6:
    Issuer: CN=VeriSign Class 3 Code Signing 2010 CA, OU=Terms of use at https://www.verisign.com/rpa (c)10, OU=VeriSign Trust Network, O="VeriSign, Inc.", C=US
    ThisUpdate: 2026-04-25 01:46
    NextUpdate: 2027-06-04 01:46
    CRL: b540a742f34bca1ad6b1541a7fd372025389a138
  Issuance[0] = 2.16.840.1.113733.1.7.23.3
  Application[0] = 1.3.6.1.5.5.7.3.3 Code Signing

CertContext[0][1]: dwInfoStatus=102 dwErrorStatus=1
  Issuer: CN=VeriSign Class 3 Public Primary Certification Authority - G5, OU="(c) 2006 VeriSign, Inc. - For authorized use only", OU=VeriSign Trust Network, O="VeriSign, Inc.", C=US
  NotBefore: 2010-02-08 08:00
  NotAfter: 2020-02-08 07:59
  Subject: CN=VeriSign Class 3 Code Signing 2010 CA, OU=Terms of use at https://www.verisign.com/rpa (c)10, OU=VeriSign Trust Network, O="VeriSign, Inc.", C=US
  Serial: 5200e5aa2556fc1a86ed96c9d44b33c7
  SubjectAltName: Directory Address:CN=VeriSignMPKI-2-8
  Cert: 495847a93187cfb8c71f840cb7b41497ad95c64f
  Element.dwInfoStatus = CERT_TRUST_HAS_KEY_MATCH_ISSUER (0x2)
  Element.dwInfoStatus = CERT_TRUST_HAS_PREFERRED_ISSUER (0x100)
  Element.dwErrorStatus = CERT_TRUST_IS_NOT_TIME_VALID (0x1)
    CRL 19:
    Issuer: CN=VeriSign Class 3 Public Primary Certification Authority - G5, OU="(c) 2006 VeriSign, Inc. - For authorized use only", OU=VeriSign Trust Network, O="VeriSign, Inc.", C=US
    ThisUpdate: 2026-09-09 08:00
    NextUpdate: 2027-01-01 07:59
    CRL: 143ad96b5dbb9c61c0fd5c61c91ca2f60c171624
  Issuance[0] = 2.16.840.1.113733.1.7.23.3
  Application[0] = 1.3.6.1.5.5.7.3.2 Client Authentication
  Application[1] = 1.3.6.1.5.5.7.3.3 Code Signing

CertContext[0][2]: dwInfoStatus=10c dwErrorStatus=0
  Issuer: CN=VeriSign Class 3 Public Primary Certification Authority - G5, OU="(c) 2006 VeriSign, Inc. - For authorized use only", OU=VeriSign Trust Network, O="VeriSign, Inc.", C=US
  NotBefore: 2006-11-08 08:00
  NotAfter: 2036-07-17 07:59
  Subject: CN=VeriSign Class 3 Public Primary Certification Authority - G5, OU="(c) 2006 VeriSign, Inc. - For authorized use only", OU=VeriSign Trust Network, O="VeriSign, Inc.", C=US
  Serial: 18dad19e267de8bb4a2158cdcc6b3b4a
  Cert: 4eb6d578499b1ccf5f581ead56be3d9b6744a5e5
  Element.dwInfoStatus = CERT_TRUST_HAS_NAME_MATCH_ISSUER (0x4)
  Element.dwInfoStatus = CERT_TRUST_IS_SELF_SIGNED (0x8)
  Element.dwInfoStatus = CERT_TRUST_HAS_PREFERRED_ISSUER (0x100)
  Application[0] = 1.3.6.1.5.5.7.3.2 Client Authentication
  Application[1] = 1.3.6.1.5.5.7.3.3 Code Signing
  Application[2] = 1.3.6.1.5.5.7.3.4 Secure Email
  Application[3] = 1.3.6.1.5.5.7.3.1 Server Authentication
  EV[0] = 2.16.840.1.113733.1.7.23.6
  EV[1] = 2.16.840.1.114412.2.1
  EV[2] = 2.23.140.1.3

Exclude leaf cert:`
  Chain: 43a613b1c596d70263da751ddf53421c032375f6
Full chain:
  Chain: b29bdc94a46f5f8a6641aba45903e9ee39106772
  Issuer: CN=VeriSign Class 3 Code Signing 2010 CA, OU=Terms of use at https://www.verisign.com/rpa (c)10, OU=VeriSign Trust Network, O="VeriSign, Inc.", C=US
  NotBefore: 2014-01-29 08:00
  NotAfter: 2016-01-30 07:59
  Subject: CN=Google Inc, OU=Digital ID Class 3 - Java Object Signing, OU=Digital ID Class 3 - Java Object Signing, O=Google Inc, L=Mountain View, S=California, C=US
  Serial: 2912c70c9a2b8a3ef6f6074662d68b8d
  Cert: fcac7e666cc54341ca213becf2eb463f2b62adb0
A required certificate is not within its validity period when verifying against the current system clock or the timestamp in the signed file. 0x800b0101 (-2146762495 CERT_E_EXPIRED)
------------------------------------
Expired certificate

Signer Info[0]:
Signature matches Public Key
CMSG_SIGNER_INFO_PKCS_1_5_VERSION(1)
CERT_ID_ISSUER_SERIAL_NUMBER(1)
    Serial Number: 2912c70c9a2b8a3ef6f6074662d68b8d
    Issuer: CN=VeriSign Class 3 Code Signing 2010 CA, OU=Terms of use at https://www.verisign.com/rpa (c)10, OU=VeriSign Trust Network, O=VeriSign, Inc., C=US
    Subject: CN=Google Inc, OU=Digital ID Class 3 - Java Object Signing, OU=Digital ID Class 3 - Java Object Signing, O=Google Inc, L=Mountain View, S=California, C=US
Hash Algorithm:
    Algorithm ObjectId: 1.3.14.3.2.26 sha1 (sha1NoSign)
    Algorithm Parameters: NULL
Encrypted Hash Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.1 RSA
    Algorithm Parameters: NULL
Encrypted Hash:
    0000  1c 20 0e 70 de 98 fa 8b  29 26 10 38 53 4a 7e 80
    0010  32 59 d6 6a 24 80 42 81  09 0e 44 8c db ea 87 31
    0020  01 87 5d ab 48 6b 87 dc  ff 2c 33 64 89 d8 c0 8a
    0030  f6 70 41 8b 36 cb 72 d6  92 63 7b 3b 29 0b 62 f4
    0040  9b 7f bd 08 ac bb 96 a2  87 e3 b7 69 93 95 a2 71
    0050  8d 97 ec 00 29 22 5e 48  56 d1 f3 e8 41 40 31 ba
    0060  a9 97 35 c7 07 ba df 3d  90 83 dd 32 73 d7 99 c0
    0070  34 01 3b 6d 96 5d 7e bd  3f 2f 89 c3 52 7c cf b8
    0080  1d 8d 57 96 56 b3 47 55  04 fa dc 3a df 83 8b 2c
    0090  6b cf 96 02 f0 63 d1 93  56 d0 11 d4 99 75 75 0a
    00a0  fa ff 7c 0d ac 15 19 67  6a 2f c9 a8 c3 e6 f9 14
    00b0  a8 1e 53 c0 fe 06 38 b1  8d d8 74 8b eb 5e 95 7f
    00c0  72 6b ce fe 55 11 4f a6  b5 3b 45 a8 27 1d af 87
    00d0  13 37 47 47 d6 ff 0b 67  39 f7 8d 4a 13 47 42 38
    00e0  fb 32 d6 48 78 af f1 2a  22 bf 0e 50 9a da 23 75
    00f0  9c 46 6a dc 0a e0 cc 8d  9a d3 55 18 6f 68 64 d3

Authenticated Attributes[0]:
  4 attributes:

  Attribute[0]: 1.3.6.1.4.1.311.2.1.12 (SPC_SP_OPUS_INFO_OBJID)
    Value[0][0], Length = 2
    Description: (null)

  Attribute[1]: 1.2.840.113549.1.9.3 (Content Type)
    Value[1][0], Length = c
    1.3.6.1.4.1.311.2.1.4 SPC_INDIRECT_DATA_OBJID

  Attribute[2]: 1.3.6.1.4.1.311.2.1.11 (SPC_STATEMENT_TYPE_OBJID)
    Value[2][0], Length = e
    1.3.6.1.4.1.311.2.1.21 SPC_INDIVIDUAL_SP_KEY_PURPOSE_OBJID

  Attribute[3]: 1.2.840.113549.1.9.4 (Message Digest)
    Value[3][0], Length = 16
    Message Digest:
        2ab24cf51024df8e98c492d5dfd24f460ad22773

Unauthenticated Attributes[0]:
  1 attributes:

  Attribute[0]: 1.2.840.113549.1.9.6 (Counter Sign)
    Value[0][0], Length = 1f8
    Counter Signature:
Signer Info:
CMSG_SIGNER_INFO_PKCS_1_5_VERSION(1)
CERT_ID_ISSUER_SERIAL_NUMBER(1)
    Serial Number: 0ecff438c8febf356e04d86a981b1a50
    Issuer: CN=Symantec Time Stamping Services CA - G2, O=Symantec Corporation, C=US
    Subject: CN=Symantec Time Stamping Services Signer - G4, O=Symantec Corporation, C=US
Hash Algorithm:
    Algorithm ObjectId: 1.3.14.3.2.26 sha1 (sha1NoSign)
    Algorithm Parameters: NULL
Encrypted Hash Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.1 RSA
    Algorithm Parameters: NULL
Encrypted Hash:
    0000  75 77 8b 49 f0 2c 47 ba  e9 cb df 67 bc b2 26 e7
    0010  46 16 51 80 0c 4e 15 25  b6 ce ca aa 86 14 6a dd
    0020  27 9f 9e d2 46 7d b2 fd  38 eb 00 fa c1 b9 50 b7
    0030  b0 63 7e ab 68 65 a2 a3  ba 7b af e0 47 8a 6c 98
    0040  94 55 46 b0 73 a9 a6 d0  63 44 f2 ab 89 ea ea 01
    0050  78 ff cb ba cb b4 a3 4b  84 af c9 c6 d1 2f ce b7
    0060  e2 56 5a 4d b1 7c ec 2b  da fe 71 ed be e2 1f 8a
    0070  39 68 b2 9d bd 1e 2b 03  68 60 1c e8 77 6a aa 91
    0080  5d 9a 24 a2 f8 3c 0c 16  6a 43 6d 15 bf be 73 da
    0090  07 e0 55 0b 95 37 43 de  f2 f7 03 bf 45 a8 2b 62
    00a0  f8 84 9a ad a6 46 38 90  8c d2 d1 67 91 5c a8 bd
    00b0  47 ac 6a c2 b6 79 52 34  53 f2 6b 84 d5 07 5f 31
    00c0  fa 56 d2 9d b8 83 4f cf  43 5f 54 86 92 a6 9d 7c
    00d0  82 78 53 34 fa 60 b1 8a  e5 59 40 9e 2b c5 7f ae
    00e0  17 50 8a 66 b2 cc 13 e8  d1 56 8c b6 01 a2 36 71
    00f0  ce 1b 19 31 e2 48 c8 89  08 0a 85 fd fc ce 78 f5

Authenticated Attributes:
  3 attributes:

  Attribute[0]: 1.2.840.113549.1.9.3 (Content Type)
    Value[0][0], Length = b
    1.2.840.113549.1.7.1 PKCS 7 Data

  Attribute[1]: 1.2.840.113549.1.9.5 (Signing Time)
    Value[1][0], Length = f
    Signing Time:  2014-06-19 15:43

  Attribute[2]: 1.2.840.113549.1.9.4 (Message Digest)
    Value[2][0], Length = 16
    Message Digest:
        5ba5a59a3cd00b4fb9a836e0ffe5c70bd78fc639

Unauthenticated Attributes:
  0 attributes:

Computed Hash: c104dd751f8ecf8c2e69430197385c66707eae69
No Recipient
Computed Hash: c104dd751f8ecf8c2e69430197385c66707eae69

Certificates:
================ Begin Nesting Level 1 ================
Element 0:
X509 Certificate:
Version: 3
Serial Number: 5200e5aa2556fc1a86ed96c9d44b33c7
Signature Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.5 sha1RSA
    Algorithm Parameters:
    05 00
Issuer:
    CN=VeriSign Class 3 Public Primary Certification Authority - G5
    OU=(c) 2006 VeriSign, Inc. - For authorized use only
    OU=VeriSign Trust Network
    O=VeriSign, Inc.
    C=US
  Name Hash(sha1): b9e9b287028503f8eca5fb42e13e0f49c72426e2
  Name Hash(md5): c6cbcafa17955c4cfd41eca0c654c361

 NotBefore: 2010-02-08 08:00
 NotAfter: 2020-02-08 07:59

Subject:
    CN=VeriSign Class 3 Code Signing 2010 CA
    OU=Terms of use at https://www.verisign.com/rpa (c)10
    OU=VeriSign Trust Network
    O=VeriSign, Inc.
    C=US
  Name Hash(sha1): d2a99306e4cf1303daddce46c29cdc2e30077956
  Name Hash(md5): fec6c9cc38154ef419655490eac86c8b

Public Key Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.1 RSA
    Algorithm Parameters:
    05 00
Public Key Length: 2048 bits
Public Key: UnusedBits = 0
    0000  30 82 01 0a 02 82 01 01  00 f5 23 4b 5e a5 d7 8a
    0010  bb 32 e9 d4 57 f7 ef e4  c7 26 7e ad 19 98 fe a8
    0020  9d 7d 94 f6 36 6b 10 d7  75 81 30 7f 04 68 7f cb
    0030  2b 75 1e cd 1d 08 8c df  69 94 a7 37 a3 9c 7b 80
    0040  e0 99 e1 ee 37 4d 5f ce  3b 14 ee 86 d4 d0 f5 27
    0050  35 bc 25 0b 38 a7 8c 63  9d 17 a3 08 a5 ab b0 fb
    0060  cd 6a 62 82 4c d5 21 da  1b d9 f1 e3 84 3b 8a 2a
    0070  4f 85 5b 90 01 4f c9 a7  76 10 7f 27 03 7c be ae
    0080  7e 7d c1 dd f9 05 bc 1b  48 9c 69 e7 c0 a4 3c 3c
    0090  41 00 3e df 96 e5 c5 e4  94 71 d6 55 01 c7 00 26
    00a0  4a 40 3c b5 a1 26 a9 0c  a7 6d 80 8e 90 25 7b cf
    00b0  bf 3f 1c eb 2f 96 fa e5  87 77 c6 b5 56 b2 7a 3b
    00c0  54 30 53 1b df 62 34 ff  1e d1 f4 5a 93 28 85 e5
    00d0  4c 17 4e 7e 5b fd` a4 93  99 7f df cd ef a4 75 ef
    00e0  ef 15 f6 47 e7 f8 19 72  d8 2e 34 1a a6 b4 a7 4c
    00f0  7e bd bb 4f 0c 3d 57 f1  30 d6 a6 36 8e d6 80 76
    0100  d7 19 2e a5 cd 7e 34 2d  89 02 03 01 00 01
Certificate Extensions: 10
    2.5.29.19: Flags = 1(Critical), Length = 8
    Basic Constraints
        Subject Type=CA
        Path Length Constraint=0

    2.5.29.32: Flags = 0, Length = 69
    Certificate Policies
        [1]Certificate Policy:
             Policy Identifier=2.16.840.1.113733.1.7.23.3
             [1,1]Policy Qualifier Info:
                  Policy Qualifier Id=CPS
                  Qualifier:
                       https://www.verisign.com/cps
             [1,2]Policy Qualifier Info:
                  Policy Qualifier Id=User Notice
                  Qualifier:
                       Notice Text=https://www.verisign.com/rpa

    2.5.29.15: Flags = 1(Critical), Length = 4
    Key Usage
        Certificate Signing, Off-line CRL Signing, CRL Signing (06)

    1.3.6.1.5.5.7.1.12: Flags = 0, Length = 61
    Logotype

    0000  30 5f a1 5d a0 5b 30 59  30 57 30 55 16 09 69 6d   0_.].[0Y0W0U..im
    0010  61 67 65 2f 67 69 66 30  21 30 1f 30 07 06 05 2b   age/gif0!0.0...+
    0020  0e 03 02 1a 04 14 8f e5  d3 1a 86 ac 8d 8e 6b c3   ..............k.
    0030  cf 80 6a d4 48 18 2c 7b  19 2e 30 25 16 23 68 74   ..j.H.,{..0%.#ht
    0040  74 70 3a 2f 2f 6c 6f 67  6f 2e 76 65 72 69 73 69   tp://logo.verisi
    0050  67 6e 2e 63 6f 6d 2f 76  73 6c 6f 67 6f 2e 67 69   gn.com/vslogo.gi
    0060  66                                                 f
0000: 30 5f                                     ; SEQUENCE (5f Bytes)
0002:    a1 5d                                  ; OPTIONAL[1] (5d Bytes)
0004:       a0 5b                               ; OPTIONAL[0] (5b Bytes)
0006:          30 59                            ; SEQUENCE (59 Bytes)
0008:             30 57                         ; SEQUENCE (57 Bytes)
000a:                30 55                      ; SEQUENCE (55 Bytes)
000c:                   16 09                   ; IA5_STRING (9 Bytes)
000e:                   |  69 6d 61 67 65 2f 67 69  66                       ; image/gif
                        |     ; "image/gif"
0017:                   30 21                   ; SEQUENCE (21 Bytes)
0019:                   |  30 1f                ; SEQUENCE (1f Bytes)
001b:                   |     30 07             ; SEQUENCE (7 Bytes)
001d:                   |     |  06 05          ; OBJECT_ID (5 Bytes)
001f:                   |     |     2b 0e 03 02 1a
                        |     |        ; 1.3.14.3.2.26 sha1 (sha1NoSign)
0024:                   |     04 14             ; OCTET_STRING (14 Bytes)
0026:                   |        8f e5 d3 1a 86 ac 8d 8e  6b c3 cf 80 6a d4 48 18  ; ........k...j.H.
0036:                   |        2c 7b 19 2e                                       ; ,{..
003a:                   30 25                   ; SEQUENCE (25 Bytes)
003c:                      16 23                ; IA5_STRING (23 Bytes)
003e:                         68 74 74 70 3a 2f 2f 6c  6f 67 6f 2e 76 65 72 69  ; http://logo.veri
004e:                         73 69 67 6e 2e 63 6f 6d  2f 76 73 6c 6f 67 6f 2e  ; sign.com/vslogo.
005e:                         67 69 66                                          ; gif
                                 ; "http://logo.verisign.com/vslogo.gif"

    2.5.29.31: Flags = 0, Length = 2d
    CRL Distribution Points
        [1]CRL Distribution Point
             Distribution Point Name:
                  Full Name:
                       URL=http://crl.verisign.com/pca3-g5.crl

    1.3.6.1.5.5.7.1.1: Flags = 0, Length = 28
    Authority Information Access
        [1]Authority Info Access
             Access Method=On-line Certificate Status Protocol (1.3.6.1.5.5.7.48.1)
             Alternative Name:
                  URL=http://ocsp.verisign.com

    2.5.29.37: Flags = 0, Length = 16
    Enhanced Key Usage
        Client Authentication (1.3.6.1.5.5.7.3.2)
        Code Signing (1.3.6.1.5.5.7.3.3)

    2.5.29.17: Flags = 0, Length = 21
    Subject Alternative Name
        Directory Address:
             CN=VeriSignMPKI-2-8

    2.5.29.14: Flags = 0, Length = 16
    Subject Key Identifier
        cf99a9ea7b26f44bc98e8fd7f00526efe3d2a79d

    2.5.29.35: Flags = 0, Length = 18
    Authority Key Identifier
        KeyID=7fd365a7c2ddecbbf03009f34339fa02af333133

Signature Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.5 sha1RSA
    Algorithm Parameters:
    05 00
Signature: UnusedBits=0
    0000  d3 91 48 a5 93 c7 2e 05  9a 08 1a 92 3d 9c 2c 8a
    0010  96 52 54 3d 1b 11 87 50  0d 12 af 63 53 82 c2 53
    0020  21 c8 5d ba 93 ed ac fa  91 ad 9c 5b 84 76 53 c5
    0030  9e 96 1b 8f 9b 7c 31 ce  3f 63 1b 75 fe 58 0e 74
    0040  7c 25 bb 58 e8 86 6f 33  91 21 b4 a1 f7 9a c5 e7
    0050  0d ae d9 26 eb 34 bd 20  a5 6f d6 37 e5 d8 3c ca
    0060  34 4c 8c 5d 1f 90 cb 20  4b cc 26 23 cf 10 9b 8f
    0070  28 40 3d b4 d4 36 65 3d  42 ac 8d d2 3d fc 5c 90
    0080  b1 cc 9d 61 e9 1e 9a 44  3f e9 23 be 09 06 22 37
    0090  e7 72 41 0c 08 6b 79 ed  a4 d4 fe 6b 14 58 fc 39
    00a0  51 59 15 60 05 45 e6 92  71 dc 6d 64 8c a9 d0 03
    00b0  73 26 85 0d e8 45 c6 d4  34 a1 bb 8c 63 4c b0 47
    00c0  14 91 1c 26 81 85 24 49  98 74 fe 5e 15 fa 53 0c
    00d0  0f e4 4f f0 b1 a9 70 ec  7c 1a 71 7f d1 6c 2d 4a
    00e0  38 47 df 7f 22 a0 7a ad  e5 0c cc bb c4 91 8c d9
    00f0  0f 64 a8 56 ad 01 b9 48  cb 61 c4 a4 34 e6 22 56
Non-root Certificate
Key Id Hash(rfc-sha1): cf99a9ea7b26f44bc98e8fd7f00526efe3d2a79d
Key Id Hash(sha1): 85c5d8cea6f966693fba2936fd9768b5c4bdffa8
Key Id Hash(bcrypt-sha1): 2ed9c5163fac51ddfed221373a846a0d96227365
Key Id Hash(bcrypt-sha256): fea3ef42daf78cec8bde180df7c19d45af6ba7d9436258c328326cca83d334cb
Key Id Hash(md5): 3c31c095e651fa664cbfb198e9c0c008
Key Id Hash(sha256): 4b741c5eacc3b518b0e6ef1ab3ae210e1bf7c82e803cd691216f90b0c7461d3a
Key Id Hash(pin-sha256): MWy0Y+x47k5N6o28r1cZT05OFePuB7xfHu9iGHiOK9c=
Key Id Hash(pin-sha256-hex): 316cb463ec78ee4e4dea8dbcaf57194f4e4e15e3ee07bc5f1eef6218788e2bd7
Cert Hash(md5): 4df6e0fc400cae9c052fae98c66d379f
Cert Hash(sha1): 495847a93187cfb8c71f840cb7b41497ad95c64f
Cert Hash(sha256): 0cfc19db681b014bfe3f23cb3a78b67208b4e3d8d7b6a7b1807f7cd6ecb2a54e
Signature Hash: 4843a82ed3b1f2bfbee9671960e1940c942f688d
----------------  End Nesting Level 1  ----------------
================ Begin Nesting Level 1 ================
Element 1:
X509 Certificate:
Version: 3
Serial Number: 2912c70c9a2b8a3ef6f6074662d68b8d
Signature Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.5 sha1RSA
    Algorithm Parameters:
    05 00
Issuer:
    CN=VeriSign Class 3 Code Signing 2010 CA
    OU=Terms of use at https://www.verisign.com/rpa (c)10
    OU=VeriSign Trust Network
    O=VeriSign, Inc.
    C=US
  Name Hash(sha1): d2a99306e4cf1303daddce46c29cdc2e30077956
  Name Hash(md5): fec6c9cc38154ef419655490eac86c8b

 NotBefore: 2014-01-29 08:00
 NotAfter: 2016-01-30 07:59

Subject:
    CN=Google Inc
    OU=Digital ID Class 3 - Java Object Signing
    OU=Digital ID Class 3 - Java Object Signing
    O=Google Inc
    L=Mountain View
    S=California
    C=US
  Name Hash(sha1): 7a6505db3190cea7840cb9ba0f931f41d824353f
  Name Hash(md5): a3c4f1c341bb7d1e5bbbb30305430444

Public Key Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.1 RSA
    Algorithm Parameters:
    05 00
Public Key Length: 2048 bits
Public Key: UnusedBits = 0
    0000  30 82 01 0a 02 82 01 01  00 be 19 70 5b 27 a5 d0
    0010  5b 05 97 4b b1 ef 49 e8  8f f1 e8 3e 1b 75 81 db
    0020  62 a3 85 da 75 1b e2 b0  fd 86 11 d2 c8 65 35 ed
    0030  78 6a 35 7c a7 25 4d cd  2a 82 16 c1 f3 a8 9b a5
    0040  3b 5f 30 77 91 d9 f8 10  53 05 e4 00 d8 8b 6d 1b
    0050  96 a0 bc a2 b3 49 3a 0f  96 f7 e6 38 59 e6 51 dd
    0060  b5 f3 08 78 44 dc cf 2b  61 aa 1b eb 3a 5c 83 f6
    0070  ce 91 ae 09 f5 fe 41 15  94 1b 13 de 7e 4c 99 bb
    0080  95 57 98 a5 dd 6a 82 7a  c8 37 a7 3f 75 d8 b7 94
    0090  dd bd f4 f8 fc 16 e4 c8  2e 82 88 3a 15 53 ee cf
    00a0  2e 32 f8 6e a0 e4 64 7f  69 3c 6a 75 89 d7 be 54
    00b0  f4 c8 71 3d 92 0e 10 07  fc bd fc 78 51 eb 18 7c
    00c0  62 22 7f be 8e c6 98 8b  47 c8 83 6a 30 78 0b 0b
    00d0  51 07 92 1b 1d 40 5f f7  e0 cc ad 35 fb 17 fa ac
    00e0  41 8e 6f b9 6a 87 0a 0b  41 65 e3 82 88 c3 91 4b
    00f0  68 c0 4d 76 44 33 c4 83  4d 5c b5 45 f1 78 1f 90
    0100  a8 3c 4e 65 ba 6b 78 de  ff 02 03 01 00 01
Certificate Extensions: 9
    2.5.29.19: Flags = 0, Length = 2
    Basic Constraints
        Subject Type=End Entity
        Path Length Constraint=None

    2.5.29.15: Flags = 1(Critical), Length = 4
    Key Usage
        Digital Signature (80)

    2.5.29.31: Flags = 0, Length = 39
    CRL Distribution Points
        [1]CRL Distribution Point
             Distribution Point Name:
                  Full Name:
                       URL=http://csc3-2010-crl.verisign.com/CSC3-2010.crl

    2.5.29.32: Flags = 0, Length = 3d
    Certificate Policies
        [1]Certificate Policy:
             Policy Identifier=2.16.840.1.113733.1.7.23.3
             [1,1]Policy Qualifier Info:
                  Policy Qualifier Id=CPS
                  Qualifier:
                       https://www.verisign.com/rpa

    2.5.29.37: Flags = 0, Length = c
    Enhanced Key Usage
        Code Signing (1.3.6.1.5.5.7.3.3)

    1.3.6.1.5.5.7.1.1: Flags = 0, Length = 65
    Authority Information Access
        [1]Authority Info Access
             Access Method=On-line Certificate Status Protocol (1.3.6.1.5.5.7.48.1)
             Alternative Name:
                  URL=http://ocsp.verisign.com
        [2]Authority Info Access
             Access Method=Certification Authority Issuer (1.3.6.1.5.5.7.48.2)
             Alternative Name:
                  URL=http://csc3-2010-aia.verisign.com/CSC3-2010.cer

    2.5.29.35: Flags = 0, L`ength = 18
    Authority Key Identifier
        KeyID=cf99a9ea7b26f44bc98e8fd7f00526efe3d2a79d

    2.16.840.1.113730.1.1: Flags = 0, Length = 4
    Netscape Cert Type
        Signature (10)
    1.3.6.1.4.1.311.2.1.27: Flags = 0, Length = 8
    SpcFinancialCriteria
        Financial Information=Not Available

Signature Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.5 sha1RSA
    Algorithm Parameters:
    05 00
Signature: UnusedBits=0
    0000  9e 35 2c 20 0f 28 6d d0  d1 c8 c1 7c e1 0e 29 56
    0010  bf 69 02 85 ae 11 55 07  c4 2b 94 fd b2 d9 95 35
    0020  22 37 11 d1 b2 4a f7 3b  9f b7 4a 75 12 02 bb fc
    0030  95 39 21 0c 47 11 19 66  12 a0 3a 2f fd da d0 fc
    0040  08 c4 b0 ac a5 dd ab de  1d 72 4b cb cc 53 e7 57
    0050  ed 61 ae 5a d4 ba 2f 09  41 1d 5d 12 42 1f b7 ad
    0060  33 3e 10 24 d1 16 8a 0c  82 14 64 eb 13 2f 0d 0c
    0070  7d 25 64 15 00 5a cd 7b  66 87 80 76 af 0a a3 c7
    0080  7e e5 aa 7f 4c fa 10 b6  20 ba 3a 91 00 8a 72 7f
    0090  08 e0 e1 64 d7 fc 1b 61  1e 46 7a de b1 5d 95 f3
    00a0  00 d4 dc 35 54 49 b3 df  c4 d7 e8 fa 01 1f a1 cb
    00b0  f8 01 36 b9 90 93 18 29  c3 90 b1 90 c4 6c 0b d7
    00c0  fc ff c3 7b 8a 1b c1 86  f8 c9 e0 a5 15 86 2b c7
    00d0  04 39 62 39 39 d9 33 ac  4d bc dd 74 5d cf 05 e4
    00e0  e2 f9 f8 37 e1 dc` 1d 03  ae 8e d6 5d ac ed 90 8d
    00f0  3c 3e 78 8f c9 f7 ef 80  b5 93 24 92 be 92 e9 d8
Non-root Certificate
Key Id Hash(rfc-sha1): fe6aaef2a414dfc1bb152b08ab3b586c086b4aba
Key Id Hash(sha1): ed882f4e3c11b04e93c24bfce552ce50d4795cac
Key Id Hash(bcrypt-sha1): f127f5aa3b54603f01d9276cc9923321bb011583
Key Id Hash(bcrypt-sha256): 4c4b0079b2c3ac13d22f714972290a7ef4f9de56273bdda3cc25af327ca5c7f5
Key Id Hash(md5): 64c86ce87b2959f545802172efc08c5e
Key Id Hash(sha256): 4365c47f17727f2da65892b1f34c0cf418b0138b519b6864dd17300f21aa3144
Key Id Hash(pin-sha256): wvYWvP5BaxewfsAyxdhQfdY2FP6nMcun3YG5eHe6jw8=
Key Id Hash(pin-sha256-hex): c2f616bcfe416b17b07ec032c5d8507dd63614fea731cba7dd81b97877ba8f0f
Cert Hash(md5): c576f4a854906489e58dde48e108aaf4
Cert Hash(sha1): fcac7e666cc54341ca213becf2eb463f2b62adb0
Cert Hash(sha256): 3207fdfd5cf1884b6cd08dac408f018042f7b2ca74be6c6cd29c4b90bcd5634e
Signature Hash: 670418bba696da1a0c4ffe2848906dfb9756bc52
----------------  End Nesting Level 1  ----------------
================ Begin Nesting Level 1 ================
Element 2:
X509 Certificate:
Version: 3
Serial Number: 0ecff438c8febf356e04d86a981b1a50
Signature Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.5 sha1RSA
    Algorithm Parameters:
    05 00
Issuer:
    CN=Symantec Time Stamping Services CA - G2
    O=Symantec Corporation
    C=US
  Name Hash(sha1): 62f363d561829618959d81537278fcb99184dda9
  Name Hash(md5): d9b75894f3ff854b24c78b881b37c425

 NotBefore: 2012-10-18 08:00
 NotAfter: 2020-12-30 07:59

Subject:
    CN=Symantec Time Stamping Services Signer - G4
    O=Symantec Corporation
    C=US
  Name Hash(sha1): 37ce9a494ba0eb9b9c33215670a02c33c6d82a8d
  Name Hash(md5): 3991364f501ae0d9b37200e3fff56ed0

Public Key Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.1 RSA
    Algorithm Parameters:
    05 00
Public Key Length: 2048 bits
Public Key: UnusedBits = 0
    0000  30 82 01 0a 02 82 01 01  00 a2 63 0b 39 44 b8 bb
    0010  23 a7 44 49 bb 0e ff a1  f0 61 0a 53 93 b0 98 db
    0020  ad 2c 0f 4a c5 6e ff 86  3c 53 55 0f 15 ce 04 3f
    0030  2b fd a9 96 96 d9 be 61  79 0b 5b c9 4c 86 76 e5
    0040  e0 43 4b 22 95 ee c2 2b  43 c1 9f d8 68 b4 8e 40
    0050  4f ee 85 38 b9 11 c5 23  f2 64 58 f0 15 32 6f 4e
    0060  57 a1 ae 88 a4 02 d7 2a  1e cd 4b e1 dd 63 d5 17
    0070  89 32 5b b0 5e 99 5a a8  9d 28 50 0e 17 ee 96 db
    0080  61 3b 45 51 1d cf 12 56  0b 92 47 fc ab ae f6 66
    0090  3d 47 ac 70 72 e7 92 e7  5f cd 10 b9 c4 83 64 94
    00a0  19 bd 25 80 e1 e8 d2 22  a5 d0 ba 02 7a a1 77 93
    00b0  5b 65 c3 ee 17 74 bc 41  86 2a dc 08 4c 8c 92 8c
    00c0  91 2d 9e 77 44 1f 68 d6  a8 74 77 db 0e 5b 32 8b
    00d0  56 8b 33 bd d9 63 c8 49  9d 3a c5 c5 ea 33 0b d2
    00e0  f1 a3 1b f4 8b be d9 b3  57 8b 3b de 04 a7 7a 22
    00f0  b2 24 ae 2e c7 70 c5 be  4e 83 26 08 fb 0b bd a9
    0100  4f 99 08 e1 10 28 72 aa  cd 02 03 01 00 01
Certificate Extensions: 8
    2.5.29.19: Flags = 1(Critical), Length = 2
    Basic Constraints
        Subject Type=End Entity
        Path Length Constraint=None

    2.5.29.37: Flags = 1(Critical), Length = c
    Enhanced Key Usage
        Time Stamping (1.3.6.1.5.5.7.3.8)

    2.5.29.15: Flags = 1(Critical), Length = 4
    Key Usage
        Digital Signature (80)

    1.3.6.1.5.5.7.1.1: Flags = 0, Length = 67
    Authority Information Access
        [1]Authority Info Access
             Access Method=On-line Certificate Status Protocol (1.3.6.1.5.5.7.48.1)
             Alternative Name:
                  URL=http://ts-ocsp.ws.symantec.com
        [2]Authority Info Access
             Access Method=Certification Authority Issuer (1.3.6.1.5.5.7.48.2)
             Alternative Name:
                  URL=http://ts-aia.ws.symantec.com/tss-ca-g2.cer

    2.5.29.31: Flags = 0, Length = 35
    CRL Distribution Points
        [1]CRL Distribution Point
             Distribution Point Name:
                  Full Name:
                       URL=http://ts-crl.ws.symantec.com/tss-ca-g2.crl

    2.5.29.17: Flags = 0, Length = 21
    Subject Alternative Name
        Directory Address:
             CN=TimeStamp-2048-2

    2.5.29.14: Flags = 0, Length = 16
    Subject Key Identifier
        46c669a30e4a141ed54cda5263173f5e36bc0de6

    2.5.29.35: Flags = 0, Length = 18
    Authority Key Identifier
        KeyID=5f9af56e5ccccc749ad4dd7def3fdbec4c802edd

Signature Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.5 sha1RSA
    Algorithm Parameters:
    05 00
Signature: UnusedBits=0
    0000  75 04 d8 1c bc c3 e0 92  7f 3c 1d c5 ac 74 69 bd
    0010  9a 53 63 68 22 3e bf c9  7f cf b9 3f 49 89 2c 57
    0020  30 a5 e8 cf 5b 19 6a eb  71 13 09 20 dc b9 7b 2e
    0030  2b 33 79 a1 51 b4 3d f0  5d 88 82 b1 86 c3 51 94
    0040  78 fe c3 bb 22 db 1b 49  2f 2c 9c 15 af 01 a9 5a
    0050  f4 b2 e1 2c 8f 29 a8 0d  38 2e 00 6d 81 13 ca 16
    0060  e2 5b 9b 3d 09 5b 7f f1  2b 16 0c b6 9c fd f4 69
    0070  ac 7b 80 b4 79 1c fc 10  71 09 da 3a b1 9a 38 ea
    0080  b0 0d 6e 41 46 45 0e 5e  4f 6e 76 5c dd fc 11 d1
    0090  80 0e 91 29 88 c4 4b f1  aa a3 20 04 28 cd b5 78
    00a0  e6 78 43 1f 37 bd de 5c  b6 dc 74 95 cd 0f 71 c6
    00b0  20 dd e9 b2 df b2 e9 c6  16 89 7c 6c 35 a4 05 f7
    00c0  0e 67 c3 e6 0d 6d 64 49  e4 33 63 26 2c f4 bf 6d
    00d0  b4 32 b6 da 06 68 21 cb  79 e3 ce dd 1c 03 40 9a
    00e0  9f 25 4e 86 aa 03 94 d4  a0 dc 25 de b2 18 6f 07
    00f0  27 84 a3 78 37 30 62 8f  f0 4c 00 2a 91 b4 3b 78
Non-root Certificate
Key Id Hash(rfc-sha1): 46c669a30e4a141ed54cda5263173f5e36bc0de6
Key Id Hash(sha1): 816657064acfd34c32318c7fd79486d13b01cb0c
Key Id Hash(bcrypt-sha1): 09ee0147a5fad4928ecea9fcb12db13908cef7a2
Key Id Hash(bcrypt-sha256): 4052a70745e5fac97c14c6e524ec65798a92c518d648e738bf8025bce730305d
Key Id Hash(md5): 625efd0e9b0a5790333d8edf4069dde8
Key Id Hash(sha256): fd7f37ba8e2535c18097eb9de3acb25797bcc083fbd5cc257807baa10f7ba60c
Key Id Hash(pin-sha256): ECVdZ0wMofsxRFP+g04hTOUPyttk2nec9wy7Xutqr3c=
Key Id Hash(pin-sha256-hex): 10255d674c0ca1fb314453fe834e214ce50fcadb64da779cf70cbb5eeb6aaf77
Cert Hash(md5): 0832b65cc3e3a49bc381ba95e1b58737
Cert Hash(sha1): 65439929b67973eb192d6ff243e6767adf0834e4
Cert Hash(sha256): 0374881c9b74d31f28dc580b0f2b9d2b14a97ce31cbec2a05aeb377dcddcc2b0
Signature Hash: 4cba8eae47b6bf76f20b3504b98b8f062694a89b
----------------  End Nesting Level 1  ----------------
================ Begin Nesting Level 1 ================
Element 3:
X509 Certificate:
Version: 3
Serial Number: 7e93ebfb7cc64e59ea4b9a77d406fc3b
Signature Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.5 sha1RSA
    Algorithm Parameters:
    05 00
Issuer:
    CN=Thawte Timestamping CA
    OU=Thawte Certification
    O=Thawte
    L=Durbanville
    S=Western Cape
    C=ZA
  Name Hash(sha1): 09d5304b06b43d3a73c75cf55a59bf3b33190d96
  Name Hash(md5): 6454a4aa36f9b5cc8338e5a67fabff17

 NotBefore: 2012-12-21 08:00
 NotAfter: 2020-12-31 07:59

Subject:
    CN=Symantec Time Stamping Services CA - G2
    O=Symantec Corporation
    C=US
  Name Hash(sha1): 62f363d561829618959d81537278fcb99184dda9
  Name Hash(md5): d9b75894f3ff854b24c78b881b37c425

Public Key Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.1 RSA
    Algorithm Parameters:
    05 00
Public Key Length: 2048 bits
Public Key: UnusedBits = 0
    0000  30 82 01 0a 02 82 01 01  00 b1 ac b3 49 54 4b 97
    0010  1c 12 0a d8 25 79 91 22  57 2a 6f dc b8 26 c4 43
    0020  73 6b c2 bf 2e 50 5a fb  14 c2 76 8e 43 01 25 43
    0030  b4 a1 e2 45 f4 e8 b7 7b  c3 74 cc 22 d7 b4 94 00
    0040  02 f7 4d ed bf b4 b7 44  24 6b cd 5f 45 3b d1 44
    0050  ce 43 12 73 17 82 8b 69  b4 2b cb 99 1e ac 72 1b
    0060  26 4d 71 1f b1 31 dd fb  51 61 02 53 a6 aa f5 49
    0070  2c 05 78 45 a5 2f 89 ce  e7 99 e7 fe 8c e2 57 3f
    0080  3d c6 92 dc 4a f8 7b 33  e4 79 0a fb f0 75 88 41
    0090  9c ff c5 03 51 99 aa d7  6c 9f 93 69 87 65 29 83
    00a0  85 c2 60 14 c4 c8 c9 3b  14 da c0 81 f0 1f 0d 74
    00b0  de 92 22 ab ca f7 fb 74  7c 27 e6 f7 4a 1b 7f a7
    00c0  c3 9e 2d ae 8a ea a6 e6  aa 27 16 7d 61 f7 98 71
    00d0  11 bc e2 50 a1 4b e5 5d  fa e5 0e a7 2c 9f aa 65
    00e0  20 d3 d8 96 e8 c8 7c a5  4e 48 44 ff 19 e2 44 07
    00f0  92 0b d7 68 84 80 5d 6a  78 64 45 cd 60 46 7e 54
    0100  c1 13 7c c5 79 f1 c9 c1  71 02 03 01 00 01
Certificate Extensions: 7
    2.5.29.14: Flags = 0, Length = 16
    Subject Key Identifier
        5f9af56e5ccccc749ad4dd7def3fdbec4c802edd

    1.3.6.1.5.5.7.1.1: Flags = 0, Length = 26
    Authority Information Access
        [1]Authority Info Access
             Access Method=On-line Certificate Status Protocol (1.3.6.1.5.5.7.48.1)
             Alternative Name:
                  URL=http://ocsp.thawte.com

    2.5.29.19: Flags = 1(Critical), Length = 8
    Basic Constraints
        Subject Type=CA
        Path Length Constraint=0

    2.5.29.31: Flags = 0, Length = 38
    CRL Distribution Points
        [1]CRL Distribution Point
             Distribution Point Name:
                  Full Name:
                       URL=http://crl.thawte.com/ThawteTimestampingCA.crl

    2.5.29.37: Flags = 0, Length = c
    Enhanced Key Usage
        Time Stamping (1.3.6.1.5.5.7.3.8)

    2.5.29.15: Flags = 1(Critical), Length = 4
    Key Usage
        Certificate Signing, Off-line CRL Signing, CRL Signing (06)

    2.5.29.17: Flags = 0, Length = 21
    Subject Alternative Name
        Directory Address:
             CN=TimeStamp-2048-1

Signature Algorithm:
    Algorithm ObjectId: 1.2.840.113549.1.1.5 sha1RSA
    Algorithm Parameters:
    05 00
Signature: UnusedBits=0
    0000  b6 7e 83 19 51 a3 12 22  6a 38 a6 5e 06 16 2a 87`
    0010  49 77 1d 3f 57 d9 dd ea  41 8e 08 21 83 6a 37 c7
    0020  c7 6e 96 25 62 40 79 e9  18 65 a8 4c 57 1d 7a e2
    0030  fc 7a 2a 5c 08 a6 31 d0  b2 4d 0c ce ad 00 96 59
    0040  eb 8e c3 1a b0 9b b1 2a  f8 11 39 ae a9 47 6f 12
    0050  0b 73 23 8d 69 f9 e8 30  7c 58 eb 6d f5 6e 44 09
    0060  92 1c ea 8d 16 9f 52 a6  5f 37 5d 06 82 4f bb 1d
    0070  09 e3 fa b5 68 ef aa 30  59 7f ef 79 8f 9b 09 03
Non-root Certificate
Key Id Hash(rfc-sha1): 5f9af56e5ccccc749ad4dd7def3fdbec4c802edd
Key Id Hash(sha1): e8bfd9a3081f84dbb7e47e807a6273297b0f4151
Key Id Hash(bcrypt-sha1): 82c295603ac180c2794f6c10daa290a4bbf73115
Key Id Hash(bcrypt-sha256): 3039ec9b20fcbecf4a7629afb9a4e24bfa9540130868316748ef9d5e50a07f2c
Key Id Hash(md5): 697fe322b8ec6061221b65edeaa9c057
Key Id Hash(sha256): b5470f9ce2d93b71d459bcc44c94d210add087f3cb102c0d8224458ac935e057
Key Id Hash(pin-sha256): oGumzLGyzl2o91wqGSYl0m7wwzZ3wViPyem6aWf2UBI=
Key Id Hash(pin-sha256-hex): a06ba6ccb1b2ce5da8f75c2a192625d26ef0c33677c1588fc9e9ba6967f65012
Cert Hash(md5): 7ba369ee9abd81e0fc7674e9709e151d
Cert Hash(sha1): 6c07453ffdda08b83707c09b82fb3d15f35336b1
Cert Hash(sha256): 0625fee1a80d7b897a9712249c2f55ff391d6661dbd8b87f9be6f252d88ced95
Signature Hash: 365b7a9c21bd9373e49052c3e7b3e4646ddd4d43
----------------  End Nesting Level 1  ----------------
No CRLs
CertUtil: -dump command completed successfully.
```


## Links 

 - Download [Google Pinyin](https://dl.google.com/pinyin/v2/GooglePinyinInstaller.exe)


