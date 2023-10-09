---
title: "Pyenv_101"
date: 2023-10-07T10:48:09+08:00
tags: [ "python" ]
categories: [ "Posts"  ]
summary: "pip vs pipenv vs poetry vs conda"
draft: true
---

{{< lead >}}
Python packaging and environment menagement ecosystem is a bit of a mess.
{{< /lead >}}

 - https://www.youtube.com/watch?v=jVcN49sHbBQ

First, relying solely on `pip` for Python package management, it might end up in the situation where dependecies are incompatible and the code simply not run as expected. 

Some common replacement for `pip`:
"pip vs pipenv vs poetry vs conda"

## pip-tools

handy tool 

```
pip-compile -o requirements.txt pyproject.toml
```

## pipenv

`PipEnv` calls itself the "Python Dev Workflow for Human".

pipenv = pip + virtualenv + pyenv

```
$ pipx install pipenv
$
$ pipenv install --python=3.6 requests
$ pipenv uninstall requests
$ pipenv update requests
$ 
$ pipenv run python main.py
$ 
$ pipenv shell
$
$ pipenv lock
$ pipenv graph
$ pipenv check
$ 
```

## poetry

## conda



poetry vs hatch vs maturin

