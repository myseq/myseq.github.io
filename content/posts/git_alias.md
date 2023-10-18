---
title: "Simple Git Aliases"
date: 2023-10-18T12:12:54+08:00
tags: [ "cli", "git"  ]
categories: [ "Posts", "dotFiles"  ]
summary: "With aliases, you can start avoid typing the same commands over and over again."
draft: false
---
{{< lead >}}
Create shortcuts for your most-used Git commands.
{{< /lead >}}

Here is a short post that help making you more efficient with `Git alias`.

## Git Alias

There are 2 ways to add alias:
 1. Edit the `~/.gitconfig` file.
 2. Use the command line method.

Here is a demo on using the command line method to add an alias:

```shell
$ git config --global alias.st 'status -sb'
```

And here is a demo on using the alias:
```shell
$ git st
## main...origin/main
```

One it is added (with command line), you can always check all the stored aliases at the file `~/.gitconfig`.

Below here is the full output with my git alias, `git la` or the full command `git config -l | grep alias | cut -c 7-`:

```shell
$ git la
ll=log --color --graph --pretty=format:"%C(yellow)%h %C(green)%ad %C(blue)|%Cred%d %Creset%s%C(cyan) [%cn]" --abbrev-commit --decorate --date=short
co=checkout
st=status -sb
last=log -1 HEAD --stat
dv=difftool -t vimdiff -y
tree=diff-tree --no-commit-id --name-only -r
la=!git config -l | grep alias | cut -c 7-
gl=config --global -l
```

## Links

 - Basic [Git Aliases](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases)
 - Git Wiki [Aliases page](https://archive.kernel.org/oldwiki/git.wiki.kernel.org/index.php/Aliases.html)

