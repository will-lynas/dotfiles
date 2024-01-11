#!/bin/bash

source ~/dotfiles/install/backups.sh

mkdir -p ~/.config

backup_rm ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim

backup_rm ~/.config/tmux
backup_rm ~/.tmux.conf
ln -s ~/dotfiles/tmux ~/.config/tmux
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/Code/User
backup_rm ~/.config/Code/User/keybindings.json
ln -s ~/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json

touch ~/.zshrc 2>/dev/null
LINE="source ~/dotfiles/zsh/zshrc"
grep -q "$LINE" ~/.zshrc || echo "$LINE" >> ~/.zshrc
