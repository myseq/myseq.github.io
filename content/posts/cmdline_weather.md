+++
title =  "Weather at Cmdline"
date = 2022-11-07T23:10:25+08:00
author = "zd"
tags = [ "cli", "weather" ]
categories = [ "Blogger" ]
summary = "Curl weather at the cmdline."
draft = false
+++

## curl

Check or curl your weather at cmdline with:

```bash
$ curl -s wttr.in/Melbourne?format="%l:%c+%C+%t/%f+%h+%w+%m+UV:%u/12+%P"
Melbourne:⛅️  Partly cloudy +15°C/+14°C 59% ↑31km/h 🌗 UV:3/12 1016hPa
$
$ curl -s wttr.in/New+York?format="%l:%c+%C+%t/%f+%h+%w+%m+UV:%u/12+%P"
New+York:☀️   Clear +1°C/-3°C 56% ↓15km/h 🌗 UV:1/12 1022hPa
$
```

## PowerShell

```pwsh
PS> Invoke-RestMEthod 'https://wttr.in/New+York?format="%l:%c+%C+%t/%f+%h+%w+%m+UV:%u/12+%P"'
New+York:☀️   Clear +1°C/-3°C 56% ↓15km/h 🌗 UV:1/12 1022hPa
PS>
```

