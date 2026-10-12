---
title: "Time in ZSH"
date: 2026-09-18T12:08:12+08:00
tags: [ "ansi", "cli", "zsh" ]
categories: [ "Posts"  ]
summary: "Measuring the execution time in zsh."
draft: false
---
{{< lead >}}
*In `zsh`, we use `time` cmd to measure how long a command or a complex pipeline takes to execute.*
{{< /lead >}}

For instance, to measure the execution time of `sleep` cmd:

```zsh {title="ZSH"}
% time sleep 2
sleep 2  0.00s user 0.00s system 0% cpu 2.004 total
```

## TIMEFMT

The default output format for `time` cmd is: `%J %U user %S system %P cpu %*E total`
And this can be changed by exporting `TIMEFMT` variable.

Common **TIMEFMT** Escape Sequences:

 - `%E`: Elapsed time in seconds.
 - `%*E`: Elapsed time in a human-readable format (e.g., `1:30.00`).
 - `%U`: CPU seconds spent in user mode.
 - `%S`: CPU seconds spent in kernel/system mode.
 - `%P`: CPU percentage utilization.
 - `%M`: Maximum memory used (in Kbytes).

### BASH-Like

If you prefer the clean, standard three-line format used by `bash`:

```zsh {title="ZSH"}
% export TIMEFMT=$'real\t%E\nuser\t%U\nsys\t%S'
```

### Fancy

If you like me, who like fancy ANSI color and stay with `zsh`'s one-liner output:

```zsh {title="ZSH"}
% export TIMEFMT=$'"\e[1;4;93m%J\e[0m" completed in \e[92m%*E\e[0m [cpu: \e[1;91m%P\e[0m  mem: \e[1;96m%M\e[0mkb]'
% time sleep 2    
"sleep 2" completed in 2.006 [cpu: 0%  mem: 3kb]
```


## REPORTIME

Zsh has a powerful built-in feature that automatically displays execution times for any cmd that takes longer than a specified number of seconds.

```zsh {title="ZSH"}
% REPORTTIME=3
% timeout 3s zsh -c 'while :; do :; done'  
"timeout 3s zsh -c 'while :; do :; done'" completed in 3.002 [cpu: 99%  mem: 3kb]
```


## GNU Time

In `zsh`, `time` is a shell reserved word rather than a standard built-in command or standalone binary.

If you need to bypass the `zsh` reserved word and call the OS GNU/Unix time binary directly:

```zsh {title="ZSH"}
% /usr/bin/time -p sleep 2
# OR
% \time -p sleep 2
```

