# Path to your oh-my-zsh installation.
export ZSH="/home/$(whoami)/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

# https://gist.github.com/matthewmccullough/787142
HISTSIZE=10000000 # How many lines of history to keep in memory
SAVEHIST=10000000 # Number of history entries to save to disk
HISTFILE=~/.zsh_history     # Where to save history to disk
setopt appendhistory     # Append history to the history file (no overwriting)
setopt sharehistory      # Share history across terminals
setopt incappendhistory  # Immediately append to the history file, not just when a term is killed
setopt extendedhistory   # Save eachy command's timestamp and duration as:  `: <began>:<duration>;<command>`

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
)
export VISUAL=vim
export EDITOR=$VISUAL

pgrep ssh-agent || eval `ssh-agent`
ssh-add ~/.ssh/id_rsa

source ~/.shell/aliases.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
