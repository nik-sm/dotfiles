#!/usr/bin/env bash
set -euo pipefail

[[ $# -eq 1 ]] || { echo "missing arg: <home dir>" >&2; exit 1; }
HOME=$1

echo "apt update and install packages..."
apt update -qq
xargs -a apt_packages.txt apt install -qq

# global python packages
python3 -m pip install virtualenv tldr
python3 -m virtualenv ~/.venv

# make ssh key if needed
mkdir -p ~/.ssh
[ -f ~/.ssh/id_rsa ] || ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -q -N ""
chmod -R 700 ~/.ssh/

# python packages for vim ALE
echo "install python packages..."
source ~/.venv/bin/activate
pip install --quiet -r ~/.requirements.txt

# jupyter nbextensions
echo "install jupyter extensions..."
jupyter contrib nbextension install --user --log-level='ERROR'
jupyter nbextensions_configurator enable --user --log-level='ERROR'
deactivate

~/.fzf/install --all

chsh -s $(which zsh)
