---
title: "Fingerprint HTTPS Certificate"
date: 2024-06-27T19:08:35+08:00
tags: [ "cli", "fingerprint", "https", "python" ]
categories: [ "Posts"  ]
summary: "Detecting HTTPS interception with fingerprint."
draft: false
---
{{< lead >}}
*Secure browser HTTPS connections can be intercepted (and decrypted) by authorities who spoof the authentic site's certificate.*
But the ***authentic site's fingerprint CANNOT be duplicated!***

Thus, fingerprint checking is to guarantee that the HTTPS certificate is the right one.
And this is one of a reliable way to detect any [HTTPS Interception](/posts/https_interception/).
{{< /lead >}}

## Fingerprint

Websites, unlike buildings, lack a physical address to confirm you're in the right place. 
That's where the "certificate fingerprint" comes in. 

It's a unique digital code, like a fingerprint, that identifies a website's security certificate (its ID card). 
By checking the fingerprint, you can help ensure you're on the real website, not a fake one trying to steal your info. 
It's a complex code, but helpful for security when used with other practices.



### Cmdline

Using cmdline tool, openssl, to get fingerprint of a HTTPS certificate.

```bash
$ openssl s_client -connect www.grc.com:443 < /dev/null 2>/dev/null | openssl x509 -fingerprint -noout -in /dev/stdin
SHA1 Fingerprint=A6:8F:8C:47:6B:D0:DE:9E:1D:18:4A:0A:51:4D:90:11:31:93:40:6D

$ openssl s_client -connect www.grc.com:443 < /dev/null 2>/dev/null | openssl x509 -fingerprint -sha1 -noout -in /dev/stdin
sha1 Fingerprint=A6:8F:8C:47:6B:D0:DE:9E:1D:18:4A:0A:51:4D:90:11:31:93:40:6D

$ openssl s_client -connect www.grc.com:443 < /dev/null 2>/dev/null | openssl x509 -fingerprint -sha256 -noout -in /dev/stdin
sha256 Fingerprint=DA:2C:F7:62:09:2C:0A:7B:88:A0:DA:65:F9:29:45:97:A6:DB:AA:2C:80:FD:75:0A:D9:A0:75:EE:64:EE:06:68

```

### Python 

> The latest version is always available at https://github.com/myseq/utils

This is a Python script that can show a fingerprint, Issuer, and Issuee of a HTTPS certificate. 

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
from datetime import datetime
from timeit import default_timer as timer
from rich import print as rprint

import ssl, socket
import OpenSSL
import hashlib

https = 'myseq.github.io'

desc = f'Fingerprinting HTTPS Certificate.'
note = f'''

        This is a tool to fingerprint any HTTPS certificate, including the Issuer and Issuee.

'''

banner = f'''
   Zzzzz   |\      _,,,---,,_
           /,`.-'`'    -.  ;-;;,_   __author__ : [ zd ]
          |,4-  ) )-,_..;\ (  `'-'  __year__   : [ 2024.06 ]
         '---''(_/--'  `-'\_)       __file__   : [ {__file__} ]

         [ {desc} ]
    '''

verbose = False

def timeit(func):
    def timed(*args, **kwargs):
        stime = timer()
        result = func(*args, **kwargs)
        etime = timer()
        rprint(f'\n :timer_clock:  {func.__name__}(): completed within [{etime-stime:.4f} sec].\n ')
        return result
    return timed

def Formatting(thumb_hash):
    fp = ''
    for i in range(0, len(thumb_hash), 2):
        fp += thumb_hash[i:i+2]
        if i < len(thumb_hash)-2:
            fp += ':'
    return fp

def Validating(date1,date2):

    today = datetime.now()
    dt1 = datetime.strptime(date1, "%Y%m%d%H%M%SZ")
    dt2 = datetime.strptime(date2, "%Y%m%d%H%M%SZ")

    if dt1 <= today <= dt2:
        return 'Valid :+1: '
    else:
        return 'Invalid :warning: '

def get_details(cert):
    details = {}

    details['subject'] = {key.decode(): value.decode() for key, value in cert.get_subject().get_components()}
    details['issuer'] = {key.decode(): value.decode() for key, value in cert.get_issuer().get_components()}
    details['serialNumber'] = cert.get_serial_number()
    details['version'] = cert.get_version() + 1  # pyOpenSSL returns version as 0-indexed
    details['notBefore'] = cert.get_notBefore().decode()
    details['notAfter'] = cert.get_notAfter().decode()
    details['signatureAlgorithm'] = cert.get_signature_algorithm().decode()

    # Extract public key details
    pub_key = cert.get_pubkey()
    pub_key_bits = pub_key.bits()
    pub_key_type = pub_key.type()
    details['publicKey'] = {
        'type': pub_key_type,
        'bits': pub_key_bits,
        'key': pub_key
    }

    # Extract extensions
    extensions = {}
    for i in range(cert.get_extension_count()):
        ext = cert.get_extension(i)
        extensions[ext.get_short_name().decode()] = str(ext)
    details['extensions'] = extensions

    return details

def Showing(cert_bin):

    cert = OpenSSL.crypto.load_certificate(OpenSSL.crypto.FILETYPE_ASN1, cert_bin)
    cert_details = get_details(cert)
    #rprint(cert_details)

    issued_to = f"{cert_details.get('subject').get('CN')}"
    org_name1 = f"{cert_details.get('subject').get('O','')}"
    issued_by = f"{cert_details.get('issuer').get('CN')}"
    org_name2 = f"{cert_details.get('issuer').get('O','')}"
    serial_no = f"{cert_details.get('serialNumber')}"
    notbefore = f"{cert_details.get('notBefore')}"
    not_after = f"{cert_details.get('notAfter')}"
    sign_algo = f"{cert_details.get('signatureAlgorithm')}"
    publickey = f"{cert_details.get('publicKey').get('bits')}"
    subjetalt = f"{cert_details.get('extensions').get('subjectAltName','')}"

    title = 'Certificate'
    rprint(f'{title}')
    rprint(f'{"="*len(title)}')

    if verbose:
        rprint(f'Serial_No: [i]{serial_no}[/i]')

    validity = Validating(notbefore, not_after)
    rprint(f'Issued_To: [i]cn={issued_to}[/i] [ o={org_name1} ]')
    rprint(f'Issued_By: [i]cn={issued_by}[/i] [ o={org_name2} ]')
    dt1 = datetime.strptime(notbefore, '%Y%m%d%H%M%SZ')
    dt2 = datetime.strptime(not_after, '%Y%m%d%H%M%SZ')
    rprint(f'   Validity: [i]\'{dt1:%Y-%m-%d %H:%M:%S %Z}\'/\'{dt2:%Y-%m-%d %H:%M:%S %Z}\'[/i] [ {validity} ]')

    print(f'')
    thumb_sha1 = hashlib.sha1(cert_bin).hexdigest()
    thumb_sha2 = hashlib.sha256(cert_bin).hexdigest()
    fp1 = Formatting(thumb_sha1)
    fp2 = Formatting(thumb_sha2)

    if verbose:
        rprint(f'Public Key : {publickey} bits ')
        rprint(f'Algo Used  : {sign_algo} ')

    rprint(f'Fingerprint: \'{fp1}\' :thumbsup: [SHA1]')
    if verbose:
        rprint(f'Fingerprint: \'{fp2}\' :+1: [SHA256]')
        rprint(f'\nAlt Name : \'{subjetalt}\'\n')

def usage():
    """ usage() function """
    parser = argparse.ArgumentParser(description=banner, formatter_class=argparse.RawTextHelpFormatter, epilog=note)

    parser.add_argument('https', metavar='https-site', help='HTTPS site.')
    parser.add_argument('-p', metavar='[0..65535]', default=443, type=int, help='TCP port (default to 443).')
    parser.add_argument('-v', action='store_true', help='verbose output')

    return parser.parse_args()

@timeit
def main():
    """ main() function """
    global verbose
    global https

    args = usage()
    verbose = True if args.v else False
    https = args.https
    port = args.p

    rprint(f'\n  [*] [i]Fingerprint-check on [u]https://{https}:{port}/[/u] ...[/i] :magnifying_glass_tilted_left: \n')

    ctx = ssl.create_default_context()
    ctx.check_hostname = False
    ctx.verify_mode = ssl.CERT_NONE

    with ctx.wrap_socket(socket.socket(), server_hostname=https) as s:
        s.connect((https, port))
        cert_bin = s.getpeercert(True)
        #cert = s.getpeercert()

    Showing(cert_bin)

if __name__ == "__main__":
    main()

```

## OCSP

OCSP
: Online Certificate Status Protocol 

OCSP is a security protocol that helps your web browser confirm a website's certificate is valid and not revoked, adding another layer of protection for your online activities. 
It works alongside CAs and certificate validation to ensure a safer browsing experience.

**Checking with Security (OCSP)**
: While CAs verify identities initially, certificates can expire or get revoked (like a lost ID). 
: OCSP is a protocol that lets your web browser ask the CA (the security guard) in real-time: "Is this website's certificate still valid?".

## Links 

 - [How To Find SSL Certificate Fingerprints](https://www.a2hosting.com/kb/security/ssl/a2-hostings-ssl-certificate-fingerprints/)
 - [Online Certificate Status Protocol](https://sites.google.com/view/a-bit-better-privacy/ocsp-online-certificate-status-protocol)


