#!/usr/bin/env bash
set -eux

apt update -y
xargs -a apt_packages.txt apt install -y

# global python packages
pip3 install virtualenv tldr
python3 -m virtualenv ~/.venv

# make ssh key if needed
[ -f ~/.ssh/id_rsa ] || ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""

# python packages for vim ALE
source ~/.venv/bin/activate
pip install -r ~/.requirements.txt
deactivate

~/.fzf/install

chsh -s $(which zsh)
