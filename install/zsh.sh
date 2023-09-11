#!/bin/bash

sudo apt install zsh -y
sudo chsh -s $(which zsh) $(whoami)

rm -rf ~/.oh-my-zsh 2>/dev/null
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
git clone https://github.com/jeffreytse/zsh-vi-mode ~/.oh-my-zsh/custom/plugins/zsh-vi-mode

rm -rf ~/.my_zsh_plugins 2>/dev/null # Legacy
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git /home/lynasw/.oh-my-zsh/custom/plugins/you-should-use
