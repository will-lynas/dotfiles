#!/bin/bash

# Initial setup so that we know the path for the rest of the scripts
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/backups.sh
backup_rm ~/.df
ln -s $SCRIPT_DIR/.. ~/.df

mkdir -p ~/.config

~/.df/install/remove_legacy.sh
~/.df/install/do_updates.sh
~/.df/install/config_bash.sh
~/.df/install/get_node.sh
~/.df/install/get_nvim.sh
~/.df/install/config_nvim.sh
~/.df/install/get_zsh.sh
~/.df/install/setup_zsh.sh
~/.df/install/get_tmux.sh
~/.df/install/setup_tmux.sh
~/.df/install/config_git.sh
~/.df/install/get_fzf.sh

# Fix timezone
sudo timedatectl set-timezone Europe/London

# SYMLINKING
# Inputrc
backup_rm ~/.inputrc
ln -s ~/.df/inputrc ~/.inputrc
# Pylintrc
backup_rm ~/.config/pylintrc
ln -s ~/.df/pylintrc ~/.config/pylintrc

# INSTALLS
# Latexmk
sudo apt install latexmk -y
# Latex things
sudo apt install zathura -y
sudo apt install xdotool -y
# fd
sudo apt install fd-find -y
# python 3.11
sudo apt install python3.11 -y
