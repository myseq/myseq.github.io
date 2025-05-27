---
title: "WSL Data Share"
date: 2025-05-24T09:43:47+08:00
tags: [ "wsl" ]
categories: [ "Posts"  ]
summary: "Sharing data between WSL instances."
draft: false
---
{{< lead >}}
*Simple way to share data between 2 WSL instances.*
{{< /lead >}}

## Quick Share

At the first WSL instance:

```console
% mkdir /mnt/wsl/share
```

Then, start copy data into `/mnt/wsl/share` folder.

And the data will be available to second WSL instance.


