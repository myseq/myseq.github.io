#!/usr/bin/env bash

## begin

WH=`which which`

if [[ $SHLVL -eq 1 ]]; then
    echo ""
else
    echo -e "\033[32m"
    echo -e "\033[36m"
    set -x
    echo USER="$USER"
    BASH=`$WH bash`
    echo "[*] Loading '$BASH' [ $BASH_VERSION ] ...."
fi

HISTSIZE=8192
echo WGET=`$WH wget`
echo CURL=`$WH curl`
echo GIT=`$WH git`
echo PYTHON=`$WH python3`

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/.local/bin:/snap/bin"
PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

set +x
echo -e "\033[0m"

alias python=`$WH python3`
alias df='df -Th -t lxfs'
alias diff='diff --color=auto'
alias duf='duf -only local'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias history='history -i -D 0'
alias ip='ip --color=auto'
alias ll='ls -l'
alias ls='ls -Fh --color'

## end

