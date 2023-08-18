#!/bin/bash

mv ~/.bashrc ~/.bashrc.old 2>/dev/null
ln -s $PWD/bashrc ~/.bashrc
source ~/.bashrc

rm -rf ~/.config/nvim 2>/dev/null
ln -s $PWD/nvim ~/.config/nvim

rm -rf ~/.config/tmux 2>/dev/null
rm ~/.tmux.conf 2>/dev/null
ln -s $PWD/tmux ~/.config/tmux
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
