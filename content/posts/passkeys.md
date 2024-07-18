---
title: "Passkeys 101"
date: 2024-01-04T17:58:55+08:00
tags: [ "101", "passkeys", "passwordless" ]
categories: [ "Posts"  ]
series: [ "Passkeys" ]
series_order: 1
summary: "There is nothing to be phished if you don't use password at all."
draft: false
---
{{< lead >}}
*TL;DR, passkeys replaces passwords.*
{{< /lead >}}

`Passkeys` is probably the next generation of account authentication and security protection.
Here, I'm starting a series of blog post on `passkeys` and some of the essential practices.

Let's begin by understanding what's wrong with ***password*** authentication.

## What's Wrong with Password?

Everyone knows that *password* is used as solution to secure our assets/devices. 
There are used to be a lot of devices has no password protection in the past.

But, in recent years, a solution has now become a problem itself.
This is simply because of **password policy** that we created.

> *Must contain combination of all below:*
> - At least an **Uppercase** and a **lowercase** characters.
> - At least a **numeric digits**.
> - At least a **special characters**.
> - **Minimum length** of 8 or more.

And thanks to complexity of password policy, some users start to ***wrote*** it down on sticky notes and leave it on the table. 
And this defeats the purpose of having password to protect our accounts.

A solution has now become a ***problem***.
And I think it should go EOL.

## Passkeys Auth

`Passkeys Auth` is a new ***passwordless authentication*** standard that is being developed by the World Wide Web Consortium (W3C) and the FIDO Alliance. 
Passkeys are designed to be more secure and convenient than traditional passwords, and they are expected to eventually ***replace passwords*** altogether.

Passkeys are more secure than passwords because they are not stored on servers. 
This means that even if a website or application is hacked, passkeys cannot be stolen. i
Passkeys are also more convenient than passwords because users ***do not need to remember or manage multiple passwords***.

> *The best part is, we can eliminate the password policy*.

Passkeys are still under development, but they are supported by a growing number of websites and applications. 
Google, Apple, and Microsoft have all announced plans to support passkeys in their browsers and operating systems.


## Types of Passkeys

There are 2 types of passkeys, and both comes with pro and con. 

Both cloud-based and hardware-bounded passkeys are passwordless authentication methods offering better security than traditional passwords.
However, they differ in their storage, security level, and use cases.

|      | Cloud-based | Hardware-bounded |
|------|--|--|
| Storage | cloud-based vault | physical device (security keys or smartphone) |  
| Access  | Highly accessible (Internet) | Require physical possession of the device |
| Authentication | + master password <br> + with biometric | + physical presence of the device <br> + biometric authentication | 
| Pros | - Convenient access <br> - Easy to manage and backup <br> - Can be used with multiple devices | - More secure due to physical requirement <br> - Resistant to phishing attacks <br> - No need to remember passwords | 
| Cons | - Less secure if master password is compromised <br> - Vulnerable to cloud-based attacks <br> - May require internet connectivity for access | - - Less convenient if device is lost or forgotten <br> - May not be compatible with all devices or services|
| Use cases | - Good for single platform syncing like Google or Apple. <br> - Personal online accounts - Low-risk corporate apps | - Good for lots of different platforms <br> - High-security corporate applications <br> - Financial accounts | 

> Don't mix up between `Password+MFA` with `Hardware-bounded Passkey` solution. They are not the same. 

## How It Work?

TL;DR, it just work like your *SSH key authentication*. 

`Passkeys` are based on public key cryptography and biometric authentication. 
When a user creates a passkey for a website or application, their device generates a unique public/private key pair. 
The public key is stored on the website or application, and the private key is stored on the user's device.

To authenticate with a passkey, the user simply needs to unlock their device and select the passkey for the website or application they want to sign in to. 
The user's device will then generate a challenge and send it to the website or application. 
The website or application will then verify the challenge using the user's public key.

> In the future, I will try to demonstrate how it can work in reality, and more essential practices on using different types of passkeys. 
> I'll also share some of the challenges to use `passkeys` in the corporate environment. 

