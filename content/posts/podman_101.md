+++
title =  "Podman 101"
date = 2023-08-04T10:34:10+08:00
author = "zd"
tags = [ "101", "podman", "cli", "tools" ]
categories = [ "Posts" ]
summary = "Docker alternative with Podman."
draft = false
+++

## Install Podman
   1. Launch an Ubuntu instance with Multipass
   2. Install podman
   3. Setup and configure podman

### Start with new Ubuntu instance
```powershell
PS> multipass launch -n primary
PS> multipass shell primary
```

### Install Podman and Setup Registry
```bash
ubuntu@primary:~$ sudo apt update
ubuntu@primary:~$ sudo apt install podman

ubuntu@primary:~$ podman -v
ubuntu@primary:~$ sudo sed -i "s/# unqualified-search-registries.*/unqualified-search-registries\ =\ [\"docker.io\"]/" /etc/containers/registries.conf
ubuntu@primary:~$ podman info
```

### Setup and Configure Podman
```bash
ubuntu@primary:~$ sudo apt install podman-docker
ubuntu@primary:~$ docker -v
Emulate Docker CLI using podman. Create /etc/containers/nodocker to quiet msg.
podman version 3.4.4

ubuntu@primary:~$ pip3 install podman-compose
ubuntu@primary:~$ export PATH=$PATH:$HOME/.local/bin
ubuntu@primary:~$ podman-compose -v
podman-compose version: 1.0.6
['podman', '--version', '']
using podman version: 3.4.4
podman-compose version 1.0.6
podman --version
podman version 3.4.4
exit code: 0

```


## Using Podman

<details>
<summary>Some basic commands</summary>

```sh
ubuntu@primary:~$ podman search ubuntu
ubuntu@primary:~$ podman pull ubuntu
ubuntu@primary:~$ podman images
ubuntu@primary:~$ podman ps -a 
```

</details>
<details>
<summary>To run a container</summary>

```bash
ubuntu@primary:~$ podman run -dit --name jimny ubuntu
ubuntu@primary:~$ podman attach jimny
```

</details>
<details>
<summary>Create Image from Container</summary>

```bash
ubuntu@primary:~$ podman commit --author "xx" 044291b04ebd
```

</details>
<details>
<summary>Start, Stop, or Remove a Container</summary>

```bash
ubuntu@primary:~$ podman start 044291b04ebd
ubuntu@primary:~$ podman stop 044291b04ebd
ubuntu@primary:~$ podman rm 044291b04ebd
```

</details>

### Run `nuclei` scan against multiple websites with latest templates
```bash
ubuntu@primary:~$ docker pull projectdiscovery/nuclei:latest
ubuntu@primary:~$ docker images
ubuntu@primary:~$ docker run -it 145d6df485f8 --version
[INF] Nuclei Engine Version: v2.9.10
ubuntu@primary:~$ docker run -it 145d6df485f8 -update
ubuntu@primary:~$ docker run -it 145d6df485f8 -ut
ubuntu@primary:~$
ubuntu@primary:~$ echo htts://www.apache.org > urls.txt
ubuntu@primary:~$ echo https://nginx.org >> urls.txt
ubuntu@primary:~$ 
ubuntu@primary:~$ cat urls.txt | docker run -v /home/ubuntu/nuclei-templates:/go/src/app/ -i projectdiscovery/nuclei  -t ./technologies/nginx/nginx-version.yaml  -t ./technologies/apache/apache-detect.yaml
[apache-detect] [http] [info] https://www.apache.org [Apache]
[nginx-version] [http] [info] https://nginx.org [nginx/1.23.4]
ubuntu@primary:~$ 
```

### Run `testssl.sh` scan against `example.com`
```bash
ubuntu@primary:~$ podman podman run --rm -ti  drwetter/testssl.sh example.com

Resolving "drwetter/testssl.sh" using unqualified-search registries (/etc/containers/registries.conf)
Trying to pull docker.io/drwetter/testssl.sh:latest...
Getting image source signatures
Copying blob d332f0a45b59 done
Copying blob ad3b14100fb2 done
Copying blob 11774c69ea68 done
Copying config 86ebbcc949 done
Writing manifest to image destination
Storing signatures

###########################################################
    testssl.sh       3.2rc2 from https://testssl.sh/dev/

      This program is free software. Distribution and
             modification under GPLv2 permitted.
      USAGE w/o ANY WARRANTY. USE IT AT YOUR OWN RISK!

       Please file bugs @ https://testssl.sh/bugs/

###########################################################

 Using "OpenSSL 1.0.2-bad (1.0.2k-dev)" [~183 ciphers]
 on 77be7462cb16:/home/testssl/bin/openssl.Linux.x86_64
 (built: "Sep  1 14:03:44 2022", platform: "linux-x86_64")


 Start 2023-08-04 02:29:58                -->> 93.184.216.34:443 (example.com) <<--

 Further IP addresses:   2606:2800:220:1:248:1893:25c8:1946
 rDNS (93.184.216.34):   --
 Service detected:       HTTP


 Testing protocols via sockets except NPN+ALPN

 SSLv2      not offered (OK)
 SSLv3      not offered (OK)
 TLS 1      offered (deprecated)
 TLS 1.1    offered (deprecated)
 TLS 1.2    offered (OK)
 TLS 1.3    offered (OK): final
 NPN/SPDY   h2, http/1.1, http/1.0, h3, h3-29, h3-Q050, h3-Q046, h3-Q043 (advertised)
 ALPN/HTTP2 h2, http/1.1 (offered)

 Testing cipher categories

 NULL ciphers (no encryption)                      not offered (OK)
 Anonymous NULL Ciphers (no authentication)        not offered (OK)
 Export ciphers (w/o ADH+NULL)                     not offered (OK)
 LOW: 64 Bit + DES, RC[2,4], MD5 (w/o export)      not offered (OK)
 Triple DES Ciphers / IDEA                         not offered
 Obsoleted CBC ciphers (AES, ARIA etc.)            offered
 Strong encryption (AEAD ciphers) with no FS       offered (OK)
 Forward Secrecy strong encryption (AEAD ciphers)  offered (OK)


 Testing server's cipher preferences

Hexcode  Cipher Suite Name (OpenSSL)       KeyExch.   Encryption  Bits     Cipher Suite Name (IANA/RFC)
-----------------------------------------------------------------------------------------------------------------------------
SSLv2
 -
SSLv3
 -
TLSv1 (server order)
 xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
 xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
 x33     DHE-RSA-AES128-SHA                DH 2048    AES         128      TLS_DHE_RSA_WITH_AES_128_CBC_SHA
 x39     DHE-RSA-AES256-SHA                DH 2048    AES         256      TLS_DHE_RSA_WITH_AES_256_CBC_SHA
 x88     DHE-RSA-CAMELLIA256-SHA           DH 2048    Camellia    256      TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA
 x45     DHE-RSA-CAMELLIA128-SHA           DH 2048    Camellia    128      TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA
 x35     AES256-SHA                        RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA
 x84     CAMELLIA256-SHA                   RSA        Camellia    256      TLS_RSA_WITH_CAMELLIA_256_CBC_SHA
 x2f     AES128-SHA                        RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA
 x41     CAMELLIA128-SHA                   RSA        Camellia    128      TLS_RSA_WITH_CAMELLIA_128_CBC_SHA
 x9a     DHE-RSA-SEED-SHA                  DH 2048    SEED        128      TLS_DHE_RSA_WITH_SEED_CBC_SHA
 x96     SEED-SHA                          RSA        SEED        128      TLS_RSA_WITH_SEED_CBC_SHA
TLSv1.1 (server order)
 xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
 xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
 x33     DHE-RSA-AES128-SHA                DH 2048    AES         128      TLS_DHE_RSA_WITH_AES_128_CBC_SHA
 x39     DHE-RSA-AES256-SHA                DH 2048    AES         256      TLS_DHE_RSA_WITH_AES_256_CBC_SHA
 x88     DHE-RSA-CAMELLIA256-SHA           DH 2048    Camellia    256      TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA
 x45     DHE-RSA-CAMELLIA128-SHA           DH 2048    Camellia    128      TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA
 x35     AES256-SHA                        RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA
 x84     CAMELLIA256-SHA                   RSA        Camellia    256      TLS_RSA_WITH_CAMELLIA_256_CBC_SHA
 x2f     AES128-SHA                        RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA
 x41     CAMELLIA128-SHA                   RSA        Camellia    128      TLS_RSA_WITH_CAMELLIA_128_CBC_SHA
 x9a     DHE-RSA-SEED-SHA                  DH 2048    SEED        128      TLS_DHE_RSA_WITH_SEED_CBC_SHA
 x96     SEED-SHA                          RSA        SEED        128      TLS_RSA_WITH_SEED_CBC_SHA
TLSv1.2 (server order)
 xc02f   ECDHE-RSA-AES128-GCM-SHA256       ECDH 256   AESGCM      128      TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 xc030   ECDHE-RSA-AES256-GCM-SHA384       ECDH 256   AESGCM      256      TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 x9e     DHE-RSA-AES128-GCM-SHA256         DH 2048    AESGCM      128      TLS_DHE_RSA_WITH_AES_128_GCM_SHA256
 x9f     DHE-RSA-AES256-GCM-SHA384         DH 2048    AESGCM      256      TLS_DHE_RSA_WITH_AES_256_GCM_SHA384
 xc027   ECDHE-RSA-AES128-SHA256           ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
 xc013   ECDHE-RSA-AES128-SHA              ECDH 256   AES         128      TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
 xc028   ECDHE-RSA-AES256-SHA384           ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
 xc014   ECDHE-RSA-AES256-SHA              ECDH 256   AES         256      TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
 x67     DHE-RSA-AES128-SHA256             DH 2048    AES         128      TLS_DHE_RSA_WITH_AES_128_CBC_SHA256
 x33     DHE-RSA-AES128-SHA                DH 2048    AES         128      TLS_DHE_RSA_WITH_AES_128_CBC_SHA
 x6b     DHE-RSA-AES256-SHA256             DH 2048    AES         256      TLS_DHE_RSA_WITH_AES_256_CBC_SHA256
 x39     DHE-RSA-AES256-SHA                DH 2048    AES         256      TLS_DHE_RSA_WITH_AES_256_CBC_SHA
 x9c     AES128-GCM-SHA256                 RSA        AESGCM      128      TLS_RSA_WITH_AES_128_GCM_SHA256
 x88     DHE-RSA-CAMELLIA256-SHA           DH 2048    Camellia    256      TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA
 x45     DHE-RSA-CAMELLIA128-SHA           DH 2048    Camellia    128      TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA
 x35     AES256-SHA                        RSA        AES         256      TLS_RSA_WITH_AES_256_CBC_SHA
 x84     CAMELLIA256-SHA                   RSA        Camellia    256      TLS_RSA_WITH_CAMELLIA_256_CBC_SHA
 x2f     AES128-SHA                        RSA        AES         128      TLS_RSA_WITH_AES_128_CBC_SHA
 x41     CAMELLIA128-SHA                   RSA        Camellia    128      TLS_RSA_WITH_CAMELLIA_128_CBC_SHA
 x9a     DHE-RSA-SEED-SHA                  DH 2048    SEED        128      TLS_DHE_RSA_WITH_SEED_CBC_SHA
 x96     SEED-SHA                          RSA        SEED        128      TLS_RSA_WITH_SEED_CBC_SHA
TLSv1.3 (server order)
 x1302   TLS_AES_256_GCM_SHA384            ECDH 256   AESGCM      256      TLS_AES_256_GCM_SHA384
 x1303   TLS_CHACHA20_POLY1305_SHA256      ECDH 256   ChaCha20    256      TLS_CHACHA20_POLY1305_SHA256
 x1301   TLS_AES_128_GCM_SHA256            ECDH 256   AESGCM      128      TLS_AES_128_GCM_SHA256

 Has server cipher order?     yes (OK) -- TLS 1.3 and below


 Testing robust forward secrecy (FS) -- omitting Null Authentication/Encryption, 3DES, RC4

 FS is offered (OK)           TLS_AES_256_GCM_SHA384 TLS_CHACHA20_POLY1305_SHA256 ECDHE-RSA-AES256-GCM-SHA384 ECDHE-RSA-AES256-SHA384 ECDHE-RSA-AES256-SHA
                              DHE-RSA-AES256-GCM-SHA384 DHE-RSA-AES256-SHA256 DHE-RSA-AES256-SHA DHE-RSA-CAMELLIA256-SHA TLS_AES_128_GCM_SHA256
                              ECDHE-RSA-AES128-GCM-SHA256 ECDHE-RSA-AES128-SHA256 ECDHE-RSA-AES128-SHA DHE-RSA-AES128-GCM-SHA256 DHE-RSA-AES128-SHA256
                              DHE-RSA-AES128-SHA DHE-RSA-SEED-SHA DHE-RSA-CAMELLIA128-SHA
 Elliptic curves offered:     prime256v1
 DH group offered:            Unknown DH group (2048 bits)
 TLS 1.2 sig_algs offered:    RSA-PSS-RSAE+SHA256 RSA-PSS-RSAE+SHA384 RSA-PSS-RSAE+SHA512 RSA+SHA256 RSA+SHA384 RSA+SHA512 RSA+SHA224 RSA+SHA1
 TLS 1.3 sig_algs offered:    RSA-PSS-RSAE+SHA256 RSA-PSS-RSAE+SHA384 RSA-PSS-RSAE+SHA512

 Testing server defaults (Server Hello)

 TLS extensions (standard)    "renegotiation info/#65281" "EC point formats/#11" "session ticket/#35" "status request/#5" "next protocol/#13172"
                              "supported versions/#43" "key share/#51" "max fragment length/#1" "application layer protocol negotiation/#16"
                              "encrypt-then-mac/#22" "extended master secret/#23"
 Session Ticket RFC 5077 hint 7200 seconds, session tickets keys seems to be rotated < daily
 SSL Session ID support       yes
 Session Resumption           Tickets no, ID: no
 TLS clock skew               Random values, no fingerprinting possible
 Certificate Compression      none
 Client Authentication        none
 Signature Algorithm          SHA256 with RSA
 Server key size              RSA 2048 bits (exponent is 65537)
 Server key usage             Digital Signature, Key Encipherment
 Server extended key usage    TLS Web Server Authentication, TLS Web Client Authentication
 Serial                       0C1FCB184518C7E3866741236D6B73F1 (OK: length 16)
 Fingerprints                 SHA1 F2AAD73D32683B716D2A7D61B51C6D5764AB3899
                              SHA256 5EF2F214260AB8F58E55EEA42E4AC04B0F171807D8D1185FDDD67470E9AB6096
 Common Name (CN)             www.example.org
 subjectAltName (SAN)         www.example.org example.net example.edu example.com example.org www.example.com www.example.edu www.example.net
 Trust (hostname)             Ok via SAN (same w/o SNI)
 Chain of trust               Ok
 EV cert (experimental)       no
 Certificate Validity (UTC)   193 >= 60 days (2023-01-13 00:00 --> 2024-02-13 23:59)
 ETS/"eTLS", visibility info  not present
 Certificate Revocation List  http://crl3.digicert.com/DigiCertTLSRSASHA2562020CA1-4.crl
                              http://crl4.digicert.com/DigiCertTLSRSASHA2562020CA1-4.crl
 OCSP URI                     http://ocsp.digicert.com
 OCSP stapling                offered, not revoked
 OCSP must staple extension   --
 DNS CAA RR (experimental)    not offered
 Certificate Transparency     yes (certificate extension)
 Certificates provided        2
 Issuer                       DigiCert TLS RSA SHA256 2020 CA1 (DigiCert Inc from US)
 Intermediate cert validity   #1: ok > 40 days (2031-04-13 23:59). DigiCert TLS RSA SHA256 2020 CA1 <-- DigiCert Global Root CA
 Intermediate Bad OCSP (exp.) Ok


 Testing HTTP header response @ "/"

 HTTP Status Code             200 OK
 HTTP clock skew              +570838 sec from localtime
 HTTP Age (RFC 7234)          570838
 Strict Transport Security    not offered
 Public Key Pinning           --
 Server banner                ECS (oxr/830C)
 Application banner           --
 Cookie(s)                    (none issued at "/")
 Security headers             Cache-Control: max-age=604800
 Reverse Proxy banner         X-Cache: HIT


 Testing vulnerabilities

 Heartbleed (CVE-2014-0160)                not vulnerable (OK), no heartbeat extension
 CCS (CVE-2014-0224)                       not vulnerable (OK)
 Ticketbleed (CVE-2016-9244), experiment.  not vulnerable (OK)
 ROBOT                                     not vulnerable (OK)
 Secure Renegotiation (RFC 5746)           supported (OK)
 Secure Client-Initiated Renegotiation     not vulnerable (OK)
 CRIME, TLS (CVE-2012-4929)                not vulnerable (OK)
 BREACH (CVE-2013-3587)                    potentially NOT ok, "gzip deflate" HTTP compression detected. - only supplied "/" tested
                                           Can be ignored for static pages or if no secrets in the page
 POODLE, SSL (CVE-2014-3566)               not vulnerable (OK), no SSLv3 support
 TLS_FALLBACK_SCSV (RFC 7507)              Downgrade attack prevention supported (OK)
 SWEET32 (CVE-2016-2183, CVE-2016-6329)    not vulnerable (OK)
 FREAK (CVE-2015-0204)                     not vulnerable (OK)
 DROWN (CVE-2016-0800, CVE-2016-0703)      not vulnerable on this host and port (OK)
                                           make sure you don't use this certificate elsewhere with SSLv2 enabled services, see
                                           https://search.censys.io/search?resource=hosts&virtual_hosts=INCLUDE&q=5EF2F214260AB8F58E55EEA42E4AC04B0F171807D8D1185FDDD67470E9AB6096
 LOGJAM (CVE-2015-4000), experimental      not vulnerable (OK): no DH EXPORT ciphers, no common prime detected
 BEAST (CVE-2011-3389)                     TLS1: ECDHE-RSA-AES128-SHA ECDHE-RSA-AES256-SHA DHE-RSA-AES128-SHA DHE-RSA-AES256-SHA DHE-RSA-CAMELLIA256-SHA
                                                 DHE-RSA-CAMELLIA128-SHA AES256-SHA CAMELLIA256-SHA AES128-SHA CAMELLIA128-SHA DHE-RSA-SEED-SHA SEED-SHA
                                           VULNERABLE -- but also supports higher protocols  TLSv1.1 TLSv1.2 (likely mitigated)
 LUCKY13 (CVE-2013-0169), experimental     potentially VULNERABLE, uses cipher block chaining (CBC) ciphers with TLS. Check patches
 Winshock (CVE-2014-6321), experimental    not vulnerable (OK)
 RC4 (CVE-2013-2566, CVE-2015-2808)        no RC4 ciphers detected (OK)


 Running client simulations (HTTP) via sockets

 Browser                      Protocol  Cipher Suite Name (OpenSSL)       Forward Secrecy
------------------------------------------------------------------------------------------------
 Android 6.0                  TLSv1.2   ECDHE-RSA-AES128-GCM-SHA256       256 bit ECDH (P-256)
 Android 7.0 (native)         TLSv1.2   ECDHE-RSA-AES128-GCM-SHA256       256 bit ECDH (P-256)
 Android 8.1 (native)         TLSv1.2   ECDHE-RSA-AES128-GCM-SHA256       256 bit ECDH (P-256)
 Android 9.0 (native)         TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Android 10.0 (native)        TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Android 11 (native)          TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Android 12 (native)          TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Chrome 79 (Win 10)           TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Chrome 101 (Win 10)          TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Firefox 66 (Win 8.1/10)      TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Firefox 100 (Win 10)         TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 IE 6 XP                      No connection
 IE 8 Win 7                   TLSv1.0   ECDHE-RSA-AES128-SHA              256 bit ECDH (P-256)
 IE 8 XP                      No connection
 IE 11 Win 7                  TLSv1.2   DHE-RSA-AES128-GCM-SHA256         2048 bit DH
 IE 11 Win 8.1                TLSv1.2   DHE-RSA-AES128-GCM-SHA256         2048 bit DH
 IE 11 Win Phone 8.1          TLSv1.2   ECDHE-RSA-AES128-SHA256           256 bit ECDH (P-256)
 IE 11 Win 10                 TLSv1.2   ECDHE-RSA-AES128-GCM-SHA256       256 bit ECDH (P-256)
 Edge 15 Win 10               TLSv1.2   ECDHE-RSA-AES128-GCM-SHA256       256 bit ECDH (P-256)
 Edge 101 Win 10 21H2         TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Safari 12.1 (iOS 12.2)       TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Safari 13.0 (macOS 10.14.6)  TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Safari 15.4 (macOS 12.3.1)   TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Java 7u25                    TLSv1.0   ECDHE-RSA-AES128-SHA              256 bit ECDH (P-256)
 Java 8u161                   TLSv1.2   ECDHE-RSA-AES128-GCM-SHA256       256 bit ECDH (P-256)
 Java 11.0.2 (OpenJDK)        TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Java 17.0.3 (OpenJDK)        TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 go 1.17.8                    TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 LibreSSL 2.8.3 (Apple)       TLSv1.2   ECDHE-RSA-AES128-GCM-SHA256       256 bit ECDH (P-256)
 OpenSSL 1.0.2e               TLSv1.2   ECDHE-RSA-AES128-GCM-SHA256       256 bit ECDH (P-256)
 OpenSSL 1.1.0l (Debian)      TLSv1.2   ECDHE-RSA-AES128-GCM-SHA256       256 bit ECDH (P-256)
 OpenSSL 1.1.1d (Debian)      TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 OpenSSL 3.0.3 (git)          TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)
 Apple Mail (16.0)            TLSv1.2   ECDHE-RSA-AES128-GCM-SHA256       256 bit ECDH (P-256)
 Thunderbird (91.9)           TLSv1.3   TLS_AES_256_GCM_SHA384            256 bit ECDH (P-256)


 Rating (experimental)

 Rating specs (not complete)  SSL Labs's 'SSL Server Rating Guide' (version 2009q from 2020-01-30)
 Specification documentation  https://github.com/ssllabs/research/wiki/SSL-Server-Rating-Guide
 Protocol Support (weighted)  95 (28)
 Key Exchange     (weighted)  90 (27)
 Cipher Strength  (weighted)  90 (36)
 Final Score                  91
 Overall Grade                B
 Grade cap reasons            Grade capped to B. TLS 1.1 offered
                              Grade capped to B. TLS 1.0 offered
                              Grade capped to A. HSTS is not offered

 Done 2023-08-04 02:35:14 [ 318s] -->> 93.184.216.34:443 (example.com) <<--
```

## Links
   - [Getting started with Podman](https://www.youtube.com/watch?v=Za36qHbrf3g)
   - [Podman Cheat Sheet](https://developers.redhat.com/cheat-sheets/podman-cheat-sheet)
   - [Getting Started with Podman](https://podman.io/docs)
   - [How to Install Podman on Ubuntu](https://learnubuntu.com/install-podman/)
   - [nuclei](https://github.com/projectdiscovery/nuclei)
   - [testssl.sh](https://github.com/drwetter/testssl.sh)
   - [Docker Alternative with Podman, Cockpit, and Nginx Proxy Manager](https://www.youtube.com/watch?v=-hJosY_M0I4)


