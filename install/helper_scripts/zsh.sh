#!/bin/bash

sudo apt install zsh -y
sudo chsh -s $(which zsh) $(whoami)

rm -rf ~/.powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k

rm -rf ~/.zsh-vi-mode
git clone https://github.com/jeffreytse/zsh-vi-mode.git ~/.zsh-vi-mode

rm -rf ~/.you-should-use
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.you-should-use

rm -rf ~/.zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting
