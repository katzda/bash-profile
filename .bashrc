#!/bin/bash

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=true

source /etc/profile.d/.git-prompt
PS1='\e[0;32m\@\e[m \[\e[0;36m\]\u\[\e[0;36m\]@\[\e[0;36m\]\h\[\e[0;36m\]:\[\e[0;34m\]\w\[\e[0;39m\]\[\e[0;31m\]$(__git_ps1 " (%s)")\[\e[0;31m\] \[\e[1;39m\]\n\$ '

ll() { ls -alp "$@"; }
cl() { clear; ls -alp; }
alias dps='sudo docker ps --format "table {{.Ports}}\t{{.Names}}\t{{.Status}}\t{{.Networks}}"';

a() { clear; git add -A; git status; }
c() { lwd=$(pwd); [ -d "$@" ] && clear && cd "$@" && echo "$lwd/ --> $(pwd)/" && ls -alp || echo "not a directory"; }
s() { clear; git status "$@"; }
u() { clear; git pull; }
p() { clear; git commit -m "$1"; git push origin $(git branch --show-current); }
d() { clear; git diff "$@"; }
alias l='git log';
h() { history | grep "$@"; }
g() { clear; git checkout "$@"; }
r() { clear; git reset --hard; git status; }
b() { clear; git branch "$@"; }
