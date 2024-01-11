---
title: "Passkeys 101"
date: 2024-01-10T16:50:55+08:00
tags: [ "101", "passkeys", "passwordless" ]
categories: [ "Posts"  ]
summary: "short desc."
draft: true
---
{{< lead >}}
*TL;DR, passkeys replaces passwords.*
{{< /lead >}}

`Passkeys` is probably the next generation of account authentication and security protection.
Here, I'm starting a series of blog post on `passkeys` and some of the essential practices.

## What's Wrong with Password?

Everyone knows that *password* is used as solution to secure our assets/devices. 
There are used to be a lot of devices has no password protection in the past.

But, in recent years, a solution has now become a problem itself.
This is simply because of **password policy** that we created.

> *Must contain:*
> - At least an **Uppercase** and a **lowercase** characters.
> - At least a **numeric digits**.
> - At least a **special characters**.
> - **Minimum length** of 8 or more.

Thanks to complexity of password policy, some users start to ***wrote*** it down on sticky notes and leave it on the table. 
And this defeats the purpose of having password to protect our accounts.

A solution has now become a ***problem***.
And I think it should go EOL.

## Password with MFA

On top of password policy, there are recommendations to deploy 2FA or MFA, Two-factor or Multi-factor Authentication. 



## Passkeys Vs Password+MFA



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

First, it creates a pair of private and public keys. 
The private key is stored with yourself, most often like your mobile phone. 
And the public key will be uploaded to website for your account creation, like facebook website.

> In the future, I will try to demonstrate how it can work in reality, and more essential practices on using different types of passkeys. 
> I'll also share some of the challenges to use `passkeys` in the corporate environment. 

## Links

  - [What Are Passkeys? - Are Passwords Going EOL?!](https://www.youtube.com/watch?v=wuylMMB8CsU)
  - [Passkeys Vs Passwords & MFA - Weighing the Pros and Cons!](https://www.youtube.com/watch?v=rKKkF19JF2w)

## Researches
  
  - [Can Passkeys Replace Passwords?](https://www.youtube.com/watch?v=DwghCW-_QQU)



