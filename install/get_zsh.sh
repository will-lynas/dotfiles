#!/bin/bash

sudo apt install zsh -y
sudo chsh -s $(which zsh) $(whoami)

#git clone https://github.com/jeffreytse/zsh-vi-mode ~/.oh-my-zsh/custom/plugins/zsh-vi-mode
#git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.oh-my-zsh/custom/plugins/you-should-use
rm -rf ~/.powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
