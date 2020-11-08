#!/usr/bin/env bash

[[ $# -eq 1 ]] || { echo "missing arg: <home dir>" >&2; exit 1; }
HOME=$1

set -eux

apt update -y
xargs -a apt_packages.txt apt install -y

# global python packages
python3 -m pip install virtualenv tldr
python3 -m virtualenv ~/.venv

# make ssh key if needed
mkdir -p ~/.ssh
[ -f ~/.ssh/id_rsa ] || ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""
chmod -R 700 ~/.ssh/

# python packages for vim ALE
source ~/.venv/bin/activate
pip install -r ~/.requirements.txt

# jupyter nbextensions
jupyter contrib nbextension install --user
jupyter nbextensions_configurator enable --user
deactivate

~/.fzf/install --all

chsh -s $(which zsh)
