+++
title = "Encoding 101"
date = 2023-08-12T13:00:22+08:00
author = "zd"
tags = [ "101", "cli", "encoding" ]
categories = [ "Posts" ]
summary = "Some notes about encoding: HTML encoding, ***URL encoding*** and ASCII encoding."
draft = false
+++


The process of conversion of data from one form to another form is known as ***Encoding***. It is used to transform the data so that data can be supported and used by different systems. And encoding in Computing is an important process to ensure data/information can be properly consumed.

## Character Encoding

Character encoding encodes characters into bytes which include 3 types of encodings.  


### HTML Encoding

Whenever an HTML document contains special characters outside the range of 7-bit ASCII, it is very important to ensure there is a proper character encoding to display the information correctly. Thus a standardize HTML encoding standard is required. Below are the HTML standards with the supported encoding character sets.

| Standard | Character set supported |
| :--- | :--- |
| HTML4 | ISO-8859-1 (default), UTF-8 |
| HTML5 | UTF-8 (default) |
| Windows | ANSI (Windows-1252) or ISO-8859-1 [ANSI has extra 32 char] |

There are 2 methods to specify which character encoding is used in a HTML document. First, the web server can include `charset` in the HTTP `Content-Type` header:

```html
Content-Type: text/html; charset=utf-8
```

Second, a declaration of character encoding set be included within HTML document.

HTML4 document can include the following information inside the `head` section which near the top of the document.
```html
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
```

HTML5 will contain the following as the first line:
```html
<meta charset="utf-8">
```

### URL Encoding

`URL encoding` converts characters into a format that can be transmitted over the Internet. Very often, URL contains some characters outside the ASCII set, thus RUL has to be converted into a valid set of ASCII format. And `URL encoding` is used to replaces any unsafe ASCII characters with a "%" followed by two hexadecimal.

For example, URL cannot contain any space. And `URL encoding` will replace a <space> with a plus `+` sign or `%20`.

Here is a valid use case why URL encoding is important to Cybersecurity. Supposed I have the following set of login credential:
 - user = `admin`
 - pase = `secure0'9passwd`

Note that the password above contain a single quote `'` in between in order to comply with password policy. 

Now, if I use the above login credential with `curl` to login to a webapp:

```bash
$ curl -s -k -L -d "username=admin&password=secure0'9passwd" \
      https://webapp.example.org
```

It will still work because I can use double quotation `"`. However, if I have to pass the command through SSH connection, then I have to use URL encoding to achieve the goal (as below):

```bash
$ ssh user@server \
  'curl -s -k -L -d "username%3Dadmin%26password%3Dsecure0%279passwd" https://webapp.example.org'
```

Notice that the `=` has been encoded to `%3D`; `&` has been encoded to `%26`; `'` has been encoded to `%27`. 

Here are the 3 methods I use to perform `URL encoding`.

First, construct a curl command as below with `--data-urlencode`, and capture the encoded string at the header. 

```bash
$  curl -I -v -G curl --get --data-urlencode "username=admin&password=secure0'9passwd" http://localhost
* Could not resolve host: curl
* Closing connection 0
curl: (6) Could not resolve host: curl
*   Trying 127.0.0.1:80...
* Connected to localhost (127.0.0.1) port 80 (#1)
> HEAD /?username=admin%26password%3Dsecure0%279passwd HTTP/1.1
> Host: localhost
> User-Agent: curl/7.81.0
> Accept: */*
>
```
Second, use PowerShell (as below):

```pwsh
PS> [Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null
PS> [System.Web.HttpUtility]::UrlEncode("username=admin&password=secure0'9passwd")
username%3dadmin%26password%3dsecure0%279passwd
PS> 
```

Last, install `gridsite-clients` package, and use the `urlencode` command (as below):

```bash
$ sudo apt install  gridsite-clients
$
$  urlencode "username=admin&password=secure0'9passwd"
username%3Dadmin%26password%3Dsecure0%279passwd
```

### ASCII Encoding

ASCII is the first character encoding standard which defined 128 different chanracters that used on the Internet:
 - numbers (0~9)
 - english letters (A~Z, a~z)
 - special characters (~!@#$%^&*)


## Links
 - [HTML Encoding (Character Sets)](https://www.w3schools.com/html/html_charset.asp)
 - [URL Encoding Reference](https://www.w3schools.com/tags/ref_urlencode.ASP)

