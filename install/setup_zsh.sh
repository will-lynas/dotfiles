#!/bin/bash

#backup_rm ~/.zshrc
touch ~/.zshrc 2>/dev/null
LINE="source ~/.df/zsh/zshrc"
grep -q "$LINE" ~/.zshrc || echo "$LINE" >> ~/.zshrc
