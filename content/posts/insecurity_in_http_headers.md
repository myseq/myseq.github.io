+++
title = "Insecurity in HTTP Headers"
date = "2023-04-04T17:26:17+08:00"
author = "zd"
tags = [ "async", "cli", "http", "python" ]
categories = [ "Posts", "Essential" ]
summary = "Based on essential security, here is how to protect users by securing HTTP headers for a website."
draft = false
+++

***Take the essential steps to secure your users via HTTP headers configuration at a website.*** 

*Securing website*, is referring to configuration at the web server level. 
It is different than security a web application. 

> And *securing web application*, is referring to secure programming practices to prevent the following attacks at the web application level:
> - SQL-injection
> - XSS
> - SSRF
> - XSRF
> - XML external ntity attack 
> - insecure direct object references 
> - directory traversal
>
> Most of the time, it requires the developer to make the changes, at the web application or source code, for remediation.

***Securing website***, is usualy performed by system engineer, and should always be implemented as company policy. Its' purpose is to protect the ***users*** from the following attacks:
 - Eavedropping with HTTP connection.
 - Cross-Site Scripting (XSS)
 - Clickjacking
 - MIME type sniffing attacks
 - User privacy information disclosure via referrer header
 - Mis-use of resources (camera or microphone) to access user privacy

It is easy and straight forward to be configured, and can be easily detected by security scanner.  Below is a list of HTTP headers configuration to secure your web servers. 

## Essential HTTP Headers (server)

Here are the essential HTTP headers configuration for securing website. These includes my configuration tht you may follow.

| HTTP Header  | My configurtion  | Type  |
| ------------ | ------------ | ----- | 
| [`Strict-Transport-Security`](#essential-http-headers-server) | `max-age=31536000; includeSubDomains; preload` | essential |  
| [`Content-Security-Policy`](#content-security-policy)   | `default-src 'self'; script-src 'self' ; img-src *` | essential | 
| [`X-Frame-Options`](#x-frame-options) | `SAMEORIGIN` |  essential| 
| [`X-Content-Type-Options`](#x-content-type-options) | `nosniff` | essential |
| [`Referrer-Policy`](#referrer-policy) | `strict-origin-when-cross-origin` | essential | 
| [`Permissions-Policy`](#permissions-policy) | `accelerometer=(), camera=(), geolocation=(), gyroscope=(), magnetometer=(), microphone=(), payment=(), usb=()` | essential |
| [`X-XSS`](#x-xss) | `1; mode=block` | optional | 


### HTTP Strict-Transport-Security (HSTS)
**HTTP Strict Transport Security (HSTS)** is a security feature that is implemented at the web server level and is designed to enhance the security of websites by forcing the use of HTTPS for all connections. HSTS works by instructing web browsers to only access a website over an encrypted HTTPS connection, even if the user types in the HTTP version of the website's URL.

When a website sets an HSTS header, it includes the `max-age` directive, which specifies the number of seconds that the browser should remember to access the website only over HTTPS. During this time, any attempts to access the website over HTTP will be automatically redirected to HTTPS. The HSTS header also includes the `includeSubDomains` directive, which tells the browser to apply the same HSTS policy to all subdomains of the website.

The recommended value for the max-age directive is `31536000` seconds (one year), as this provides a good balance between security and flexibility. However, the specific value may vary depending on the needs of the website.

To configure HSTS, the web server needs to include the HSTS header in the HTTP response to requests made to the website. For example, in Apache, the following code can be added to the website's .htaccess file to set the HSTS header:

```css
Header set Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
```

The `preload` parameter is optional but recommended as it allows the website to be included in the HSTS preload list maintained by web browsers, which can improve the security and performance of the website.

*Although a max-age of 1 year is acceptable for a domain, two years is the recommended value as explained on https://hstspreload.org*

### Content Security Policy
**Content Security Policy (CSP)** is a security feature implemented at the web server level that helps protect websites against cross-site scripting (XSS) attacks and other types of content injection attacks. CSP allows website administrators to specify which sources of content are allowed to be loaded and executed on a page, which can help prevent malicious code from being injected into the page by an attacker.

When a website sets a CSP header, it includes a set of directives that specify the sources of content that are allowed to be loaded on the page. These sources can include trusted servers, such as the website's own server, as well as external content delivery networks (CDNs) and other trusted sources.

The recommended value and configuration of the CSP header can vary depending on the needs of the website. Generally, the CSP header should be set to a restrictive policy that only allows content from trusted sources to be loaded on the page. This can help prevent attackers from injecting malicious code into the page and can also help prevent data exfiltration attacks by preventing the loading of external resources.

A basic CSP header might look like this:

```css
Content-Security-Policy: default-src 'self';
```

This policy only allows content to be loaded from the same origin as the page itself, and will block any external content from being loaded. More complex CSP headers can include additional directives that allow specific types of content to be loaded from external sources, while still preventing malicious content from being injected into the page.

The specific configuration of the CSP header will depend on the needs of the website, and it is recommended that website administrators consult the CSP documentation and testing tools to ensure that their policy is configured correctly and is effective in preventing attacks.

### X-Frame-Options
The **X-Frame-Options header (XFO)** is a security feature implemented at the web server level that helps protect websites against clickjacking attacks. Clickjacking is a type of attack where an attacker tries to trick a user into clicking on a malicious link by hiding the link behind a legitimate-looking button or image.

When a website sets an XFO header, it includes a directive that specifies whether or not the page can be displayed inside an HTML frame or iframe on another website. This can help prevent clickjacking attacks by ensuring that the website's content is only displayed in the intended context.

The recommended value for the XFO header is to set it to `SAMEORIGIN`. This directive allows the page to be displayed inside a frame or iframe on another page, but only if the other page has the same origin as the original page. This means that the website's content can still be embedded in pages on the same domain, but prevents it from being embedded in malicious websites that could be used for clickjacking attacks.

To configure the XFO header, the web server needs to include the header in the HTTP response to requests made to the website. For example, in Apache, the following code can be added to the website's .htaccess file to set the X-Frame-Options header:

```css
Header always append X-Frame-Options SAMEORIGIN
```

This code will append the "SAMEORIGIN" directive to the XFO header for all HTTP responses from the website, ensuring that the website's content can only be embedded in pages on the same domain.

It is recommended that website administrators configure the XFO header to help prevent clickjacking attacks and improve the security of their website.

### X-Content-Type-Options
The **X-Content-Type-Options header** is a security feature implemented at the web server level that helps protect websites against MIME type sniffing attacks. MIME type sniffing is a type of attack where an attacker tries to execute malicious code by tricking the browser into interpreting a file as a different type than it actually is.

When a website sets an **X-Content-Type-Options** header, it includes a directive that specifies whether or not the browser should be allowed to sniff the MIME type of a file. This can help prevent MIME type sniffing attacks by ensuring that the browser only interprets files based on their actual MIME type.

The recommended value for the `X-Content-Type-Options` header is to set it to `nosniff`. This directive instructs the browser to not sniff the MIME type of a file, and to only interpret the file based on its actual MIME type. This helps prevent attackers from tricking the browser into interpreting a file as a different type than it actually is, which can be used to execute malicious code.

For example, in Apache, the following code can be added to the website's .htaccess file to set the `X-Content-Type-Options` header:

```css
Header set X-Content-Type-Options nosniff
```

This code will set the `nosniff` directive for the X-Content-Type-Options header for all HTTP responses from the website, ensuring that the browser only interprets files based on their actual MIME type.

It is recommended that website administrators configure the X-Content-Type-Options header to help prevent MIME type sniffing attacks and improve the security of their website.

### Referrer-Policy

The **Referrer-Policy header** is a security feature implemented at the web server level that helps protect website user privacy by controlling the information passed in the HTTP Referrer header. The HTTP Referrer header is sent by the browser when a user clicks a link or submits a form, and it contains the URL of the page that the user came from.

When a website sets a **Referrer-Policy** header, it includes a directive that specifies how much information should be passed in the Referrer header. This can help protect user privacy by limiting the amount of information that is passed to third-party websites.

The recommended value for the Referrer-Policy header is to set it to `strict-origin-when-cross-origin`. This directive instructs the browser to send the full URL in the Referrer header when navigating within the same origin, but only send the origin part of the URL when navigating to a different origin. This helps prevent third-party websites from accessing sensitive information about the user's browsing history.

To configure the **Referrer-Policy** header, the web server needs to include the header in the HTTP response to requests made to the website. For example, in Apache, the following code can be added to the website's .htaccess file to set the Referrer-Policy header:

```css
Header always set Referrer-Policy "strict-origin-when-cross-origin"
```

This code will set the `strict-origin-when-cross-origin` directive for the Referrer-Policy header for all HTTP responses from the website, ensuring that the Referrer header only contains the origin information when navigating to a different origin.

It is recommended that website administrators configure the Referrer-Policy header to help protect user privacy and improve the security of their website.

### Permissions-Policy
The **Permissions-Policy header** is a security feature implemented at the web server level that allows website administrators to control which features and APIs are available to a web page, based on the origin of the page. This can help prevent malicious web pages from accessing sensitive user information or executing unauthorized actions.

When a website sets a **Permissions-Policy** header, it includes a directive that specifies which features and APIs are available to a web page. For example, the Permissions-Policy header can be used to control access to features such as camera, microphone, geolocation, and more.

The recommended value for the **Permissions-Policy** header is to set it to a restrictive value that only allows the features that are necessary for the website to function properly. This helps prevent malicious web pages from accessing sensitive user information or executing unauthorized actions.

To configure the Permissions-Policy header, the web server needs to include the header in the HTTP response to requests made to the website. For example, in Apache, the following code can be added to the website's .htaccess file to set the Permissions-Policy header:

```css
Header always set Permissions-Policy "camera=(), microphone=(), geolocation=()"
```

This code will set the Permissions-Policy header to allow access to the camera, microphone, and geolocation APIs, but only if the website has explicit permission from the user.

It is recommended that website administrators configure the **Permissions-Policy** header to help prevent malicious web pages from accessing sensitive user information or executing unauthorized actions, and improve the security of their website.


### X-XSS 
The **X-XSS-Protection header** is a security feature implemented at the web server level that helps protect websites against cross-site scripting (XSS) attacks. XSS attacks are a type of attack where an attacker injects malicious code into a web page, which is then executed by the victim's browser.

When a website sets an **X-XSS-Protection** header, it includes a directive that specifies whether or not the browser should enable its built-in XSS protection. The browser's XSS protection can help prevent certain types of XSS attacks by blocking the execution of malicious scripts.

The recommended value for the **X-XSS-Protection** header is to set it to `1; mode=block`. This directive instructs the browser to enable its built-in XSS protection and to block the execution of any detected malicious scripts.

To configure the X-XSS-Protection header, the web server needs to include the header in the HTTP response to requests made to the website. For example, in Apache, the following code can be added to the website's .htaccess file to set the X-XSS-Protection header:

```css
Header set X-XSS-Protection "1; mode=block"
```

This code will set the `1; mode=block` directive for the X-XSS-Protection header for all HTTP responses from the website, ensuring that the browser's built-in XSS protection is enabled and that malicious scripts are blocked.

It is recommended that website administrators configure the X-XSS-Protection header to help protect their website against XSS attacks and improve the security of their website.



## Tool at MySeq: httphdr_scan
I have created a cli tool, to perform quick scan on HTTP header. It is called [httphdr_scan](https://github.com/myseq/http_scanner/).

```shell
$ ./main.py -h
usage: main.py [-h] [-u <url> [<url> ...]] [-f <sites.url>] [-r] [-v]

options:
  -h, --help            show this help message and exit
  -u <url> [<url> ...]  Specifying URL
  -f <sites.url>        Specifying input site file
  -r                    Follow HTTP 301 redirection.
  -v                    verbose output
```

Below is the sample output:

![http_scanner](https://raw.githubusercontent.com/myseq/http_scanner/main/output.png)

## Similar Ideas
 - Online [Security Headers](https://securityheaders.com/)
 - Security Header Check - [shcheck](https://github.com/santoru/shcheck)

## Links
 * moz://a [Web Security Cheat Sheet](https://infosec.mozilla.org/guidelines/web_security.html)
 * [HTTP headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers)



