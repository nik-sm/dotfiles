#!/usr/bin/env bash
set -euxo pipefail

# zsh
sudo apt install zsh
chsh -s $(which zsh) $(whoami)
# Install oh-my-zsh (trusting their script)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Vim
bash vim_setup.sh

# Other
sudo apt install ranger
mkdir -p ~/.config/ranger
cp ranger-conf ~/.config/ranger/rc.conf
