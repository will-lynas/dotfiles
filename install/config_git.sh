#!/bin/bash

# Don't overwrite any existing global config
[ -f ~/.gitconfig ] || cp ~/.df/gitconfig ~/.gitconfig
git config --global core.editor nvim
# Set creds for this repo
git -C ~/.df config user.name "Will Lynas"
git -C ~/.df config user.email "43895423+will-lynas@users.noreply.github.com"

