#!/bin/bash

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=true

. "/home/katzda/.local/share/lscolors.sh";

source ~/.git-prompt.sh
PS1='\e[0;32m\@\e[m \[\e[0;36m\]\u\[\e[0;36m\]@\[\e[0;36m\]\h\[\e[0;36m\]:\[\e[0;34m\]\w\[\e[0;39m\]\[\e[0;31m\]$(__git_ps1 " (%s)")\[\e[0;31m\] \[\e[1;39m\]\n\$ '

alias ls='ls --color';
ll() { clear; ls -alp "$@"; }
cl() { clear; ls -alp; }
dps() { clear; docker container ls -a --format "table {{.ID}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Names}}"; };
dpsr() { docker container stop $(docker ps --filter "status=restarting" -q) 2>/dev/null; docker container rm $(docker ps --filter "status=exited" -q) 2>/dev/null; dps; };

a() { clear; git add -A; git status; }
c() { lwd=$(pwd); [ -d "$@" -o "$@" = "-" ] && clear && cd "$@" && echo "$lwd/ --> $(pwd)/" && ls -alp || echo "not a directory"; }
s() { clear; git status "$@"; }
u() { clear; git pull; }
p() { clear; git commit -m "$1"; git push origin $(git branch --show-current); }
d() { clear; git diff "$@"; }
alias l='ls -alp';
h() { git log; }
g() { clear; git checkout "$@"; }
r() { clear; git reset --hard; git status; }
b() { clear; git branch "$@"; }

c ~;
