# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
  zsh-autosuggestions
  zsh-syntax-highlighting
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

PROMPT='%(?.%F{green}√.%F{red}%?)%f %F{blue}%m%f %B%F{240}%1~%f%b %F{yellow}%#%f '

export VISUAL=vim
export EDITOR=$VISUAL

eval `ssh-agent`
ssh-add ~/.ssh/id_rsa

source ~/.shell/aliases.sh

PATH=$PATH:~/.local/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
