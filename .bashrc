# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Unlimited history
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
HISTCONTROL=ignoreboth
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
# append to the history file, don't overwrite it

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

export VISUAL=vim
export EDITOR=vim

#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] $? \$ '
PS1='\[\033[01;32m\]\u@\h \[\033[00m\]| \[\033[01;34m\]\W \[\033[00m\]| \[\033[01;33m\]$? \[\033[00m\]\n$ '

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Setup ssh identity
eval $(ssh-agent)
# NOTE - set path to desired identity file
ssh-add ~/.ssh/niklas_desktop_ubuntu_rsa


# NOTE - corresponds to vimrc line: set undodir=~/.vim/undodir
mkdir -p ~/.vim/undodir

# Git aliases
alias gs="git status"
alias gfs="git fetch && git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"

# Utility functions
chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

ord() {
  LC_CTYPE=C printf '%d' "'$1\n"
}

# Example on Mac
#txt ()
#{ 
#	[[ $1 ]] || { echo "Missing operand" >&2; return 1; }
#	[[ -f $1 ]] && open -a /Applications/TextEdit.app/Contents/MacOs/TextEdit $1 && return 0 || touch $1 && open -a /Applications/TextEdit.app/Contents/MacOs/TextEdit $1 && return 0;
#}
