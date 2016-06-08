# bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
 
# show git branch name
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[32m\]\w\[\033[31m\]$(__git_ps1)\[\033[39m\] '

