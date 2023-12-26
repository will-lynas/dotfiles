#!/bin/bash

source ~/.df/install/backups.sh

mkdir -p ~/.config

backup_rm ~/.config/nvim
ln -s ~/.df/nvim ~/.config/nvim

backup_rm ~/.config/tmux
backup_rm ~/.tmux.conf
ln -s ~/.df/tmux ~/.config/tmux
ln -s ~/.df/tmux/tmux.conf ~/.tmux.conf

backup_rm ~/.config/Code/User/settings.json
ln -s ~/.df/vscode_settings.json ~/.config/Code/User/settings.json

touch ~/.zshrc 2>/dev/null
LINE="source ~/.df/zsh/zshrc"
grep -q "$LINE" ~/.zshrc || echo "$LINE" >> ~/.zshrc
