# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


PS1='\[\033[01;32m\]\u@\h \[\033[00m\]| \[\033[01;34m\]\W \[\033[00m\]| \[\033[01;33m\]$? \[\033[00m\]$ '


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cp='cp -i'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# TODO - this leaves 1 lingering ssh-agent process per closed terminal session
# any forwarded identities will still be available from those agents, which is a minor security risk
eval `ssh-agent`
ssh-add ~/.ssh/niklas_pml_david_rsa
#PATH=$PATH:~/.local/bin
export VISUAL=vim
export EDITOR=$VISUAL

alias cdp="cd /home/niklas/git/lwll"
alias cdpp="cd /home/niklas/git/7610-distributed-systems/hw/project_3"

# Golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH="${HOME}/.go"
export GOPATH="${HOME}:/home/niklas/git/7610-distributed-systems/hw/project_3"


# Pyenv
# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv-installer
#export PATH="/home/niklas/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

alias grep="rg"
alias fzf="fzf --height 40% --layout reverse --preview 'head -n10 {}' --preview-window down:10"
# alias vim="nvim"

ulimit -n 50000

alias gfs="git fetch && git status"
alias gs="git status"
alias gc="git commit -v"
alias gp="git push"
alias gd="git diff"
alias gdc="git diff --cached"
alias gb="git branch -avv"
alias ga="git add"
alias g="git"

# Better python debugger
#export PYTHONBREAKPOINT="pudb.set_trace"

# Jupyter-lab
export PATH=$PATH:~/.local/bin
