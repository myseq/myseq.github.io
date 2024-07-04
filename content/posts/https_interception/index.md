---
title: "HTTPS Interception"
date: 2024-06-27T06:39:10+08:00
tags: [ "firefox", "https", "privacy" ]
categories: [ "Posts"  ]
summary: "HTTPS != End-to-end Encryption"
draft: false
---
{{< lead >}}
*Myth Busted: Using HTTPS doesn't mean your connection is untouchable!*

*Ensure TRUE privacy with End-to-End and look beyond the padlock.*
{{< /lead >}}

We all rely on the little padlock icon in our browsers to signal a secure connection.  
HTTPS (Hypertext Transfer Protocol Secure) encrypts communication between your device and the website, protecting your data from eavesdroppers. 

However, it's important to understand that HTTPS alone doesn't guarantee complete end-to-end encryption. 
In some cases, a company's internal IT setup can intercept traffic even with HTTPS. 

This post will explore how to identify potential signs of such scenarios and discuss some mitigation strategies to enhance your online security.

## 1. Why HTTPS Interception?

There are 3 common reasons why a company might intercept HTTPS connections.

 1. **Security Monitoring:** Companies might want to peek inside encrypted traffic to hunt for malware or viruses before they infect their network.
 It's like checking everyone's lunchbox before entering the office building.

 1. **Data Leak Prevention:** Imagine employees accidentally (or not so accidentally) uploading confidential files. HTTPS interception can help companies catch such leaks before sensitive data gets out.

 1. **Keeping Employees Focused:** Some companies use HTTPS interception to see what websites or apps employees are using. They might be concerned about wasted time or inappropriate browsing habits.

## 2. How It Works?

While HTTPS encrypts communication between your device and a website, some companies can still intercept this traffic. 

One method involves installing a self-signed certificate as a trusted root certificate on employee devices. 
This essentially tricks your browser into thinking the company's internal server is a legitimate Certificate Authority (CA). 

With this certificate in place, the company can deploy a transparent proxy. 
This proxy acts as an intermediary between your device and the internet. 

Since the encrypted traffic is decrypted by the proxy using the trusted self-signed certificate, the company can inspect the content before allowing it to reach its final destination. 

This allows them to monitor all HTTPS traffic flowing through their network.

{{< alert >}}
**This practice can have privacy implications, and employees should be aware of its existence within a company network.**

*Company should obtained explicit employee consent and inform about the purpose before doing so.*
{{< /alert >}}

Unfortunately, detecting `HTTPS interception` using only the browser itself can be quite inefficient, especially when the company has installed a trusted root certificate.

## 3. Prevention

One common way to prevent `HTTPS interception` is with `TLS pinning`.

This is a prevention method to be deployed as an extra layer of security at the web application.

TLS pinning, also known as certificate pinning, is a security mechanism used to enhance the trust established during a TLS handshake (the initial communication between a client and server). 
It specifically aims to prevent Man-in-the-Middle (MitM) attacks by ensuring the client only connects to the intended server with the expected security certificate.

Here's a breakdown of how it works:

 1. **Pinning the Keys:** During application development or initial configuration, a specific fingerprint (public key) of the trusted server's certificate is embedded into the application code or configuration file. This "pinned" key acts as a reference point.
 
 2. **TLS Handshake:** When the application attempts to connect to the server via HTTPS, the TLS handshake commences. The server sends its digital certificate to the client for verification.

 3. **Key Verification:** The client extracts the public key from the received certificate and compares it to the pinned key stored within the application.

 4. **Connection Decision:** 
   - **Match:** If the public keys match, the connection is considered legitimate, and encrypted communication proceeds.
   - **Mismatch:** If the keys don't match, the connection is deemed untrustworthy, indicating a potential MitM attack. The application typically throws an error and refuses to establish the connection.

The benefits of `TLS pinning` is obvious.
It checks the website fingerprint to ensure it is the real one, and add another layer of protection on top of regular security measures.

However, the implementation and future upgrade can be complex. 
It only stops specific fakes and not all types of eavesdropping.

**The bottom line:** TLS pinning helps secure your connection, but it's best used with other security measures.

## 4. Detection

Detection is not 100%, and it it some what manual for different browsers.

### 4.1 Chrome/Edge

 1. At the address bar, click the 🔒 padlock. 

 1. At the menu list, select "Connection is secure". 😆  

 1. At the new menu, click 🏅 certificate icon (at the top right corner).

 1. Now, at the General tab, check at the "***Issued To***" and "***Issued By***" details.


### 4.2 Firefox

> Personally, I prefer Firefox for my daily browsing. 

Firefox has an extra feature called "Automatically trust third-party root certificates". 

Once it is turned on, Firefox will use third-party root certificates added to your OS (by company), allowing for seamless access. 

If you want to prevent `HTTPS interception`, turn it off at Settings (Privacy & Security).

It works by sending the HTTPS certificate to Mozilla for comparison. 
And it will block the HTTPS connection if Mozilla found a 3rd-party root certificate is used for "HTTPS interception". 

> However, this option could be annoying if you turn it off. 

For me, I would turn on the option above and prefer a warning message (but allow for `HTTPS interception`).

Next, configure the ["Enterprise Roots preference"](https://support.mozilla.org/en-US/kb/how-disable-enterprise-roots-preference) as below.

```python
# about:config
security.certerrors.mitm.auto_enable_enterprise_roots = false
security.enterprise_roots.auto-enabled = true
security.enterprise_roots.enabled = true
```

Now, at any time, when I browse to a HTTPS site, I can click the 🔒 padlock at the address bar, and it will show me a warning message:

![grc.com](/posts/https_interception/grc.com.png)

This shows that my HTTPS connection is ***intercepted***. 

If you are interested to view the certificate, you can select "Connection secure", and follow by "More information". 

### 4.3 Addons

With Firefox, you can add an add-on called ["Certificate Pinner"](https://addons.mozilla.org/en-US/firefox/addon/certificate-pinner/).

> This add-on allows to selectively 'pin' TLS certificates of web pages. 
> Whenever a page is loaded and the connection is TLS encrypted, it compares the fingerprint of the presented TLS certificate to the one that is stored. 

> If they don't match, the TLS authentication process is interrupted before any local secrets such as session cookies, passwords, etc. are sent to the server. 

> A tab is opened with a warning and details of the new certificate so the user can decide if the change is genuine. 

> If so, the old fingerprint is replaced with the new fingerprint in local storage. 

> A new button in the browser's toolbar opens a pop-up menu to pin and un-pin page certificates and to get a list of all pinned certificates.


## 5. Links

 - Mozilla: [Automatically trust third-party root certificates](https://support.mozilla.org/en-US/kb/automatically-trust-third-party-certificates)
 - Mozilla: [Security Warning Codes](https://support.mozilla.org/en-US/kb/what-does-your-connection-is-not-secure-mean) 
 - Mozilla: [CA/AddRootToFirefox](https://wiki.mozilla.org/CA/AddRootToFirefox)
 - [How to Find SSL Certificate Fingerprints](https://www.a2hosting.com/kb/security/ssl/a2-hostings-ssl-certificate-fingerprints/)

 - [BadSSL.com](https://badssl.com/)
   - A handy website for demostrating bad certificate and SSL connection for web client.
   - [badssl.com](https://github.com/chromium/badssl.com) at GitHub

 - GRC [Fingerprints](https://www.grc.com/fingerprints.htm)
   - Research in detecting HTTPS interception with `fingerprint`.

 - [crt.sh](https://crt.sh/) (powered by [Sectigo](https://sectigo.com/))
   - An online database for certificate search. 
   - [crt.sh](https://github.com/crtsh) at GitHub

 - [HTTPS Interception Weakens TLS Security](https://www.cisa.gov/news-events/alerts/2017/03/16/https-interception-weakens-tls-security)
   - A warning message about HTTPS interception (by CISA.gov)

