#!/bin/bash

#backup_rm ~/.zshrc
touch ~/.zshrc 2>/dev/null
~/.df/install/get_zsh.sh
LINE="source ~/.df/zsh/zshrc"
echo "$LINE" >> ~/.zshrc
