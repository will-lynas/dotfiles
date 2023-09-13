#!/bin/bash

sudo apt install tmux -y
backup_rm ~/.config/tmux
backup_rm ~/.tmux.conf
ln -s ~/.df/tmux ~/.config/tmux
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
