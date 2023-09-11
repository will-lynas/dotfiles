#!/bin/bash

rm -rf ~/.my_zsh_plugins 2>/dev/null # Legacy

sudo apt install zsh -y
sudo chsh -s $(which zsh) $(whoami)

rm -rf ~/.oh-my-zsh 2>/dev/null
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

git clone https://github.com/jeffreytse/zsh-vi-mode ~/.oh-my-zsh/custom/plugins/zsh-vi-mode

git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.oh-my-zsh/custom/plugins/you-should-use
