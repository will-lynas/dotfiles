#!/bin/bash

sudo apt install -y libfuse2 gcc ripgrep
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /bin/nvim
