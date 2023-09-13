#!/bin/bash

sudo apt install libxcb-xinerama0 libxcb-cursor0
sudo apt install zstd
sudo rm -rf /tmp/anki*
cd /tmp
wget https://github.com/ankitects/anki/releases/download/2.1.66/anki-2.1.66-linux-qt6.tar.zst
tar xaf anki*
cd anki*
sudo ./install.sh
