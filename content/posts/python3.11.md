---
title: "Adding Python3.11"
date: 2025-04-27T14:08:01+08:00
tags: [ "101", "python", "ubuntu" ]
categories: [ "Posts"  ]
summary: "Steps to install alternate Python version for Noble"
draft: false
---
{{< lead >}}
*Sometimes, you just need Python 3.11 to work.*
{{< /lead >}}

Here's the way to *downgrade* Python version from Python version 3.12 by install an alternate Python version (3.11).

## Alternate Python Version

**Noble** (Ubuntu 24.04) does come with Python `3.12` by default.
In some cases, we may need another Python version, such as `3.11`, to work better.

Here are the steps to install alternative Python version (3.11) into **Noble**. 

 1. Add repo and install Python 3.11

```console
xx@pf24:~% sudo add-apt-repository ppa:deadsnakes/ppa
xx@pf24:~% sudo apt update
xx@pf24:~% sudo apt install python3.11
```

 2. Install necessary Python utilities

```console
xx@pf24:~% sudo apt install -y python3-pip
xx@pf24:~% sudo apt install -y python3.11-venv
xx@pf24:~% sudo apt install -y python3-virtualenv
```

 3. Manage multiple Python versions

```console
xx@pf24:~% sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1
xx@pf24:~% sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 2
```

 4. View all available Python versions installed

```console
xx@pf24:~% sudo update-alternatives --config python3
There are 2 choices for the alternative python3 (providing /usr/bin/python3).

  Selection    Path                 Priority   Status
------------------------------------------------------------
* 0            /usr/bin/python3.11   2         auto mode
  1            /usr/bin/python3.11   2         manual mode
  2            /usr/bin/python3.12   1         manual mode

Press <enter> to keep the current choice[*], or type selection number:

xx@pf24:~% python3 --version
Python 3.11.12
```

 5. Create virtual environment for testing

```console
xx@pf24:~% mkdir appl
xx@pf24:~% cd appl
xx@pf24:~/appl% python3 -m venv venv
xx@pf24:~/appl% source venv/bin/activate
(venv) xx@pf24:~/appl% python3 --version
Python 3.11.12
(venv) xx@pf24:~/appl% deactivate
xx@pf24:~/appl% 
xx@pf24:~/appl% virtualenv newenv
created virtual environment CPython3.11.12.final.0-64 in 1414ms
  creator CPython3Posix(dest=/home/xx/appl/newenv, clear=False, no_vcs_ignore=False, global=False)
  seeder FromAppData(download=False, pip=bundle, setuptools=bundle, wheel=bundle, via=copy, app_data_dir=/home/xx/.local/share/virtualenv)
    added seed packages: pip==24.0, setuptools==68.1.2, wheel==0.42.0
  activators BashActivator,CShellActivator,FishActivator,NushellActivator,PowerShellActivator,PythonActivator
xx@pf24:~/appl% ls
newenv/  venv/
xx@pf24:~/appl% source newenv/bin/activate
(newenv) xx@pf24:~/appl% python3 --version
Python 3.11.12
(newenv) xx@pf24:~/appl% deactivate
xx@pf24:~/appl%
```



