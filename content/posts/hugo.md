+++
title = "Hugo"
date = "2022-12-10T07:02:51+08:00"
author = "zd"
tags = [ "config", "hugo" ]
categories = [ "Posts" ]
summary = "Install, setup, configure Hugo."
draft = false
+++


## 2022.12.10 - Install Hugo

To install Hugo:
```shell
$ sudo apt update
$ sudo apt upgrade -y
$ sudo apt install hugo
```

## 2022.12.11 - Setup Hugo

To setup blog site with Hugo locally:
```shell
$ mkdir -p source/github
$ cd source/github
$ git clone https://github.com/<user>/<user>.github.io.git
$ cd <user>.github.io
$ git checkout -b setup-hugo
Switched to a new branch 'setup-hugo'
$
$ hugo new site --force .
$ git clone https://github.com/panr/hugo-theme-terminal.git themes/terminal
$ vi config.toml
```

<hugo_home>/config.toml:
```toml
theme = 'terminal'
baseURL = '/'
enableEmoji = true
```
For the rest of the setup, please refer to [hugo-theme-terminal](https://github.com/panr/hugo-theme-terminal)

To start the Hugo server:
```shell
$ hugo server -t terminal --bind=0.0.0.0
```

To push blog to GitHub:
```shell
$ git add . 
$ git status
$ git commit -m "setup 1 of blog site"
$ git push origin setup-hugo
$ 
$ git checkout main
$ git pull 
$
```

To automating website deployment with CD process, and the please refer `cd.yml` to [04-continous-deployment](https://carpentries-incubator.github.io/blogging-with-hugo-and-github-pages/04-continuous-deployment/index.html):
```shell
$ git checkout -b add-cd
Switched to a new branch 'add-cd'
$
$ mkdir -p .github/workflows
$ touch .github/workflows/cd.yml
$ vi .github/workflows/cd.yml
$  
$
$ git add .github/workflows/cd.yml
$ git commit -m "Add a GitHub Actions workflow to build and deploy the site"
$ git push origin add-cd
$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.
$ git pull
$
```


### Setup GH-Pages

Before pushing to GitHub, below is the additional setup for SSH logiin to GH. See [Set up GitHub push with SSH keys.md](https://gist.github.com/xirixiz/b6b0c6f4917ce17a90e00f9b60566278)
```shell
$ git remote set-url origin git@github.com:username/your-repository.git
```

In case of CD process fails, add `extended: true` next to `hugo-version: 'latest'` 

In case of `action-gh-pages` fails, such as [Action failed with "The process '/usr/bin/git' failed with exit code 128"](https://stackoverflow.com/questions/76023778/action-failed-with-the-process-usr-bin-git-failed-with-exit-code-128)
- change settings under `Settings-Action-General`
- Workflow Permissions: Read and Write
- Allow GitHub Actions to approve pull requests



## 2022.12.12 - Configure Hugo

To check out a new branch to add content:
```shell
$ git checkout -b adding-content
$
```

For example, to create site content inside `content` directory:
```shell
$ hugo new posts/<title>.md
$
$ vim content/posts/<title>.md
$
```

To push to GitHub and merging to `main`
```shell
$ git add .
$ git commit -m "yyyy.mm.dd - adding new post"
$ git push origin adding-content
$
$ git checkout main
$ git pull
$
```

## 2023.04.30 - Reference

Here is a reference to tutorial on blogging with Hugo and GitHub Pages.

* [Blogging with Hugo and GitHub Pages](https://carpentries-incubator.github.io/blogging-with-hugo-and-github-pages/)
  * [Create and Setup your blog repository on GitHub](https://carpentries-incubator.github.io/blogging-with-hugo-and-github-pages/01-create-github-repo/index.html)
  * [Locally setting up our blog site with Hugo](https://carpentries-incubator.github.io/blogging-with-hugo-and-github-pages/02-locally-setup-hugo/index.html
)
  * [Push our Hugo site to GitHub](https://carpentries-incubator.github.io/blogging-with-hugo-and-github-pages/03-push-to-github/index.html)
  * [Automating Website Deployment](https://carpentries-incubator.github.io/blogging-with-hugo-and-github-pages/04-continuous-deployment/index.html)
  * [Generating Blog Content](https://carpentries-incubator.github.io/blogging-with-hugo-and-github-pages/05-add-blog-content/index.html)
  * [Closing Remarks](https://carpentries-incubator.github.io/blogging-with-hugo-and-github-pages/06-closing-remarks/index.html)
  * [Hugo Hosts on GitHub](https://gohugo.io/hosting-and-deployment/hosting-on-github/)
* Start [Configure Hugo](https://gohugo.io/getting-started/configuration/)

## 2023.07.19 - Upgrade

I decided to upgrade the Hugo with Package Managers (snap) in order to stay with latest version (easier).
  
  * See the instruction at [Linux Installation](https://gohugo.io/installation/linux/)
    * [Quick start](https://gohugo.io/getting-started/quick-start/)
    * [Host on GitHub Pages](https://gohugo.io/hosting-and-deployment/hosting-on-github/)

## 2023.10.05 - Update 

 - Check if "Read and write permissions" are enabled in Settings -> Actions -> General -> Workflow permissions:
   - Make sure it is "Read and write permission"
   - Check the option "Allow GitHub Actions to create and approve pull requests"

