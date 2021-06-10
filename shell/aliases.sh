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
  [[ -z $1 ]] && { echo "missing commit message" >&2; return 1; }
  git add -u
  git commit -m $1
  git push
}

# ls
alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# safety
alias cp='cp -i'
alias mv='mv -i'

# misc
command -v rg > /dev/null && alias grep="rg"
command -v fzf > /dev/null && alias fzf="fzf --height 40% --layout reverse --preview 'head -n10 {}' --preview-window down:10"
cdl() {
  [[ -z $1 ]] && { echo "missing destination message" >&2; return 1; }
  cd $1
  ls -lah
}
test_cuda() {
  deactivate > /dev/null 2>&1 || :
  source ~/.venv/bin/activate
  [[ $(python -c "import torch; print(torch.cuda.is_available())") -eq "True" ]]
  result=$?
  deactivate
  if [[ $result -eq 0 ]]; then
    echo cuda available
  else
    echo cuda not available
  fi
  return $result
}
quietly() { $@ ; } > /dev/null 2>&1

catlast() {
    [[ -z $1 ]] && { echo "missing target folder" >&2; return 1; }
    cat $1/$(ls -Art $1/ | tail -n 1)
}


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias matlab='matlab -nodesktop -nojvm -nosplash -nodisplay'
