# git
alias gfs="git fetch && git status"
alias gs="git status"
alias gc="git commit -v"
alias gp="git push"
alias gd="git diff"
alias gdc="git diff --cached"
alias gb="git branch -avv"
alias ga="git add"
alias g="git"
ggg() {
  [[ -z $1 ]] && { echo "missing commit message" >&2; exit 1; }
  git add -u
  git commit -m $1
  git push
}

# ls
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# safety
alias cp='cp -i'
alias mv='mv -i'

# misc
alias grep="rg"
alias fzf="fzf --height 40% --layout reverse --preview 'head -n10 {}' --preview-window down:10"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
