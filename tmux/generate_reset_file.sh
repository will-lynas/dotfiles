#!/bin/bash
tmux -f /dev/null -L temp start-server \; list-keys | \
  sed -r \
  -e "s/bind-key(\s+)([\"#~\$])(\s+)/bind-key\1\'\2\'\3/g" \
  -e "s/bind-key(\s+)([\'])(\s+)/bind-key\1\"\2\"\3/g" \
  -e "s/bind-key(\s+)([;])(\s+)/bind-key\1\\\\\2\3/g" \
  -e "s/command-prompt -I #([SW])/command-prompt -I \"#\1\"/g" \
  > ~/.config/tmux/tmux.reset.conf
