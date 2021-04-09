#!/usr/bin/env bash
set -euo pipefail

[[ $# -eq 2 ]] || { echo "required args: <home dir> <username>" >&2; exit 1; }
HOME=$1

quietly() { $@; } > /dev/null 2>&1

echo "install apt packages..."
quietly apt update -y
quietly xargs -a apt_packages.txt apt install -y

# python packages for vim ALE
echo "install python packages..."
quietly python3 -m pip install virtualenv tldr
quietly python3 -m virtualenv ~/.venv
quietly source ~/.venv/bin/activate
quietly pip install -r ~/.requirements.txt

# jupyter nbextensions
echo "install jupyter extensions..."
quietly jupyter contrib nbextension install --user
quietly jupyter nbextensions_configurator enable --user
deactivate

# make ssh key if needed
mkdir -p ~/.ssh
[ -f ~/.ssh/id_rsa ] && echo "ssh key exists..." || { 
  echo "make ssh key..."
  ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N "";
}
chmod -R 700 ~/.ssh/
chown -R $2 ~/.ssh/
chgrp -R $2 ~/.ssh/

echo "install fzf..."
~/.fzf/install --all > /dev/null 2>&1

echo "set zsh as default shell..."
chsh -s $(which zsh)
