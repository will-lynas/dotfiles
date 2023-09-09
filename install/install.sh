#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/backups.sh
backup_rm ~/.df
ln -s $SCRIPT_DIR/.. ~/.df


# Legacy removes
backup_rm ~/.common_shell_scripts
backup_rm ~/.bash
backup_rm ~/.zsh

sudo apt -q update
sudo apt -q autoremove -y
#sudo apt -q upgrade -y

mkdir -p ~/.config

# Bash
backup_rm ~/.bashrc
cp /etc/skel/.bashrc ~/.bashrc
LINE="source ~/.df/bash/bashrc"
echo "$LINE" >> ~/.bashrc

# Zsh
backup_rm ~/.zshrc
~/.df/install/zsh.sh
touch ~/.zshrc
LINE="source ~/.df/zsh/zshrc"
echo "$LINE" >> ~/.zshrc

# Inputrc
backup_rm ~/.inputrc
ln -s ~/.df/inputrc ~/.inputrc

# Node
~/.df/install/get_node.sh

# Nvim install
sudo apt install -y libfuse2 gcc ripgrep
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /bin/nvim

# Nvim config
backup_rm ~/.config/nvim
ln -s ~/.df/nvim ~/.config/nvim
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/share/nvim/site/pack/packer # legacy

# Tmux
backup_rm ~/.config/tmux
backup_rm ~/.tmux.conf
ln -s ~/.df/tmux ~/.config/tmux
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Gitconfig - don't overwrite any existing global config
[ -f ~/.gitconfig ] || cp ~/.df/gitconfig ~/.gitconfig
git config --global core.editor nvim
# Set creds for this repo
git -C ~/.df config user.name "Will Lynas"
git -C ~/.df config user.email "43895423+will-lynas@users.noreply.github.com"

# Pylint
backup_rm ~/.config/pylintrc
ln -s ~/.df/pylintrc ~/.config/pylintrc

# fzf
sudo apt install bat -y
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --xdg
