#!/bin/bash

source ~/.df/install/backups.sh

sudo apt install tmux -y

backup_rm ~/.config/tmux
backup_rm ~/.tmux.conf
ln -s ~/.df/tmux ~/.config/tmux
ln -s ~/.df/tmux/tmux.conf ~/.tmux.conf

rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm -rf ~/.tmux/plugins/tmux-text-macros
git clone https://github.com/will-lynas/tmux_macros ~/.tmux_macros
