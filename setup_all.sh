#!/usr/bin/env bash

# Vim
bash vim_setup.sh

# Other
sudo apt install ranger
mkdir -p ~/.config/ranger
cp ranger-conf ~/.config/ranger/rc.conf
