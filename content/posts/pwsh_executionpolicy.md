---
title: "PowerShell Execution Policy"
date: 2026-07-21T12:02:31+08:00
tags: [ "101", "cli", "powershell" ]
categories: [ "Posts"  ]
summary: "A safety feature that controls the how PowerShell loads configuration files and runs scripts."
draft: false
---
{{< lead >}}
*PowerShell's execution policy is a safety feature that controls the conditions under which PowerShell loads configuration files and runs scripts.*
{{< /lead >}}

Open PowerShell terminal, and run the cmdline below.


```powershell
pwsh> ExecutionPolicy -List

        Scope ExecutionPolicy
        ----- ---------------
MachinePolicy    Unrestricted
   UserPolicy       Undefined
      Process       Undefined
  CurrentUser       Undefined
 LocalMachine       Undefined
```

The output means the system allows all PowerShell scripts to run without restrictions.

## Execution Policy

PowerShell evaluates execution policies using a strict hierarchy. 
The top-most defined scope always overrides the scopes below it.

 - `MachinePolicy` is set to `Unrestricted`: This is a GPO applied at the computer level.
 - All other scopes are `Undefined`: : Because `MachinePolicy` is at the very top of the hierarchy, it **completely overrides** `UserPolicy`, `Process`, `CurrentUser`, and `LocalMachine`. Even if we try to change the local policy, the domain/system policy will block our changes.

## Security Impact

An `Unrestricted` policy means **any PowerShell script can run on this machine**.
This includes any **unsigned scripts** downloaded from the internet. 

Windows will still show a warning prompt for unverified files downloaded from the web.
And this setting significantly *lowers* the system's built-in defenses against malicious scripts.

> Never leave it `Unrestricted`.
> Should go with either `AllSigned` or `RemoteSigned`.

## Recommendation

Fix the issue via **Group Policy**:

 1. Open Local Group Policy Editor (`gpedit.msc`)
 1. Navigate to: `Computer Configuration` > `Administrative Templates` > `Windows Components` > `Windows PowerShell`
 1. Turn on **Script Execution**
 1. Change it to **Enabled** and set the execution policy to **Allow local scripts and remote signed scripts** (`RemoteSigned`)

To use the `Set-ExecutionPolicy` cmdline, open PowerShell as Administrator.

**This will change the policy for the entire computer**:

```pwsh
pwsh> Set-ExecutionPolicy RemoteSigned -Scope LocalMachine
```

**This will change it only for logged-in user account**:

```pwsh
pwsh> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**To bypass restrictions for just your current open window**:

```pwsh
Set-ExecutionPolicy Bypass -Scope Process
```


To lock down a specific session for testing:

```pwsh
powershell.exe -ExecutionPolicy RemoteSigned
```

## Links 

 - About [Execution Policies](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.6)



