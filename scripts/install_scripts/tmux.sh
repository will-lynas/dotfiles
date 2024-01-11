#!/bin/bash

sudo apt install -y libevent-dev ncurses-dev build-essential bison pkg-config automake autotools-dev

rm -rf ~/.tmux
sudo apt remove tmux -y # legacy
git clone https://github.com/tmux/tmux.git ~/.tmux
cd ~/.tmux
sh autogen.sh
./configure
make && sudo make install

rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
