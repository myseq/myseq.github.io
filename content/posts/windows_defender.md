---
title: "Windows Defender"
date: 2026-10-28T18:44:10+08:00
tags: [ "cli", "defender", "powershell", "win10", "win11" ]
categories: [ "Posts"  ]
summary: "Windows Defender != Microsoft Defender"
authors:
  - "xx"
draft: false
---
{{< lead >}}
*Windows Defender is just the built-in antivirus in Windows OS.*
*Microsoft Defender is a much broader security platform covering identity, cloud, and email.* 

*Because they aren't the same, most businesses need to upgrade beyond the basic built-in tool.*
{{< /lead >}}


## Windows Defender

First, let's list some functions for Windows Defender module.

```pwsh
PS C:\> get-command -module defender

CommandType     Name                                   Version    Source
-----------     ----                                   -------    ------
Function        Add-MpPreference                       1.0        defender
Function        Get-MpComputerStatus                   1.0        defender
Function        Get-MpPreference                       1.0        defender
Function        Get-MpThreat                           1.0        defender
Function        Get-MpThreatCatalog                    1.0        defender
Function        Get-MpThreatDetection                  1.0        defender
Function        Remove-MpPreference                    1.0        defender
Function        Remove-MpThreat                        1.0        defender
Function        Set-MpPreference                       1.0        defender
Function        Start-MpRollback                       1.0        defender
Function        Start-MpScan                           1.0        defender
Function        Start-MpWDOScan                        1.0        defender
Function        Update-MpSignature                     1.0        defender
```

### Status Checking

And we'll check the status with `Get-MpComputerStatus`.

```pwsh
PS C:\> Get-MpComputerStatus

AMEngineVersion                  : 1.1.26090.9
AMProductVersion                 : 4.18.26080.4
AMRunningMode                    : Normal
AMServiceEnabled                 : True
AMServiceVersion                 : 4.18.26080.4

AntispywareEnabled               : True
AntispywareSignatureAge          : 1
AntispywareSignatureLastUpdated  : 10/27/2026 11:41:24
AntispywareSignatureVersion      : 1.461.224.0
AntivirusEnabled                 : True
AntivirusSignatureAge            : 1
AntivirusSignatureLastUpdated    : 10/27/2026 11:41:24
AntivirusSignatureVersion        : 1.461.224.0
BehaviorMonitorEnabled           : True
ComputerID                       : xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
ComputerState                    : 0
ControlledConfigurationState     : 0
DefenderSignaturesOutOfDate      : False
DeviceControlDefaultEnforcement  : DefaultAllow
DeviceControlPoliciesLastUpdated : 9/24/2026 09:03:06
DeviceControlState               : Enabled
FullScanAge                      : 4294967295
FullScanEndTime                  :
FullScanOverdue                  : False
FullScanRequired                 : False
FullScanSignatureVersion         :
FullScanStartTime                :
InitializationProgress           : ServiceStartedSuccessfully
IoavProtectionEnabled            : True
IsTamperProtected                : True
IsVirtualMachine                 : False
LastFullScanSource               : 0
LastQuickScanSource              : 2
NISEnabled                       : True
NISEngineVersion                 : 1.1.26090.9
NISSignatureAge                  : 1
NISSignatureLastUpdated          : 10/27/2026 11:41:24
NISSignatureVersion              : 1.461.224.0
OnAccessProtectionEnabled        : True
ProductStatus                    : 524288
QuickScanAge                     : 1
QuickScanEndTime                 : 10/27/2026 17:07:19
QuickScanOverdue                 : False
QuickScanSignatureVersion        : 1.461.119.0
QuickScanStartTime               : 10/27/2026 15:30:24
RealTimeProtectionEnabled        : True
RealTimeScanDirection            : 0
RebootRequired                   : False
SmartAppControlExpiration        :
SmartAppControlState             : Off
TamperProtectionSource           : ATP
TroubleShootingDailyMaxQuota     :
TroubleShootingDailyQuotaLeft    :
TroubleShootingEndTime           :
TroubleShootingExpirationLeft    :
TroubleShootingMode              :
TroubleShootingModeSource        :
TroubleShootingQuotaResetTime    :
TroubleShootingStartTime         :
PSComputerName                   :
```

And for essential status checking, we can:

```pwsh
PS C:\> Get-MpComputerStatus | select *updated,*version

AntispywareSignatureLastUpdated  : 10/27/2026 11:41:24
AntivirusSignatureLastUpdated    : 10/27/2026 11:41:24
DeviceControlPoliciesLastUpdated : 9/24/2026 09:03:06
NISSignatureLastUpdated          : 10/27/2026 11:41:24
AMEngineVersion                  : 1.1.26090.9
AMProductVersion                 : 4.18.26080.4
AMServiceVersion                 : 4.18.26080.4
AntispywareSignatureVersion      : 1.461.224.0
AntivirusSignatureVersion        : 1.461.224.0
FullScanSignatureVersion         :
NISEngineVersion                 : 1.1.26090.9
NISSignatureVersion              : 1.461.224.0
QuickScanSignatureVersion        : 1.461.119.0
```

## Threat Catalog

For Threat Catalog, it will display a long list of threat info.
For simplicity, we merely need to know how many of them.

```pwsh
PS C:\> (Get-MpThreatCatalog).Count
366905
```

If for filtering purpose, like `Ransom:Linux`, we can count the threats with:

```pwsh
PS C:\> $mp = Get-MpThreatCatalog
PS C:\> $mp | where threatname -match ‘Ransom:Linux’ | measure

Count    : 347
Average  :
Sum      :
Maximum  :
Minimum  :
Property :

```

## Links 

 - [Windows Defender vs Microsoft Defender](https://www.gcstechnologies.com/windows-defender-vs-microsoft-defender-whats-the-difference/)
 - Windows [PowerShell Defender Module](https://learn.microsoft.com/en-us/powershell/module/defender/?view=windowsserver2025-ps)


