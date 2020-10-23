#!/usr/bin/env bash
set -e

apt update -y
xargs -a apt_packages.txt apt install -y

# global python packages
pip3 install virtualenv tldr
python3 -m virtualenv ~/.venv

# python packages for vim ALE
source ~/.venv
pip install -r ~/.requirements.txt
deactivate
