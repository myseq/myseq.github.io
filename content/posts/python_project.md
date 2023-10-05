+++
title =  "Python Project"
date = 2023-08-25T01:30:08+08:00
author = "zd"
tags = [ "101", "python", "py-venv" ]
categories = [ "Posts", "Essential" ]
summary = "Elegant way to execute Python project."
draft = false
+++

Here is how I start a Python project for myself.

## Creating Template for Python Project

1. Create a Python project folder.
2. Create virtual environment for project.
3. Create the base file.

```bash
~ $ mkdir webping_project
~ $ cd webping_project
~/webping_project $ 

~/webping_project $ python3.11 -v venv .venv
~/webping_project $ source .venv/bin/activate
~/webping_project $ 

~/webping_project $ pip install requests
~/webping_project $ pip freeze > requirements.txt
~/webping_project $ 

~/webping_project $ vim main.py 
~/webping_project $ 

```


## Executing Python Project

1. Link the project file.
2. Execute the project.

```bash
~/webping_project $ ln -s main.py __main__.py
~/webping_project $ ls -l
total 8.0K
lrwxrwxrwx 1 xx xx    7 Aug 24 16:57 __main__.py -> main.py*
-rwxr-xr-x 1 xx xx 2.9K Aug 24 16:54 main.py*
-rw-r--r-- 1 xx xx  154 Aug 24 16:56 requirements.txt

~/webping_project $ 
~/webping_project $ cd ..
~ $ 
~ $ python webping_project
usage: webping_project [-h] [-v] url [url ...]
webping_project: error: the following arguments are required: url

```

Here is how to execute the project in a more concise and elegant way. It makes it easier for others to use a project.

```bash
~ $ deactivate
~ $
~ $ python webping_project -v https://www.google.com
 * https://www.google.com        [200] Google
 * https://www.google.com        [200] Google
 * https://www.google.com        [200] Google
 * https://www.google.com        [200] Google
^C [*] DONE

```

Of course, the old way to run a project can be: 

`~ $ python webping_project/main.py -v https://www.google.com` 




