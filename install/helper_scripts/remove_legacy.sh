#!/bin/bash

source ~/dotfiles/install/backups.sh

backup_rm ~/.common_shell_scripts
backup_rm ~/.bash
backup_rm ~/.zsh

rm -rf ~/.local/share/nvim/site/pack/packer
rm -rf ~/dotfiles/nvim/plugin/packer_compiled.lua
rm -rf ~/.my_zsh_plugins
rm -rf ~/.oh-my-zsh
