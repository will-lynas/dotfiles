#!/bin/bash

# Source this file ($HOME/.config/bashrc) at the end of .bashrc

alias vim=nvim

# Older tmux versions don't look in the right place for config
# -2 fixes the colors when using putty
alias tmux="tmux -2 -f $HOME/.config/tmux/tmux.conf"
