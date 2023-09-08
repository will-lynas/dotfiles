#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source $SCRIPT_DIR/backups.sh

sudo apt-get -q update
sudo apt -q autoremove -y
#sudo apt-get -q upgrade -y

mkdir -p ~/.config

# Common scripts
rm -rf ~/.common_shell_scripts
ln -s $SCRIPT_DIR/../common_shell_scripts ~/.common_shell_scripts

# Bash
rm -rf ~/.bash
ln -s $SCRIPT_DIR/../bash ~/.bash
[ -f ~/.bashrc ] || cp /etc/skel/.bashrc ~/.bashrc
LINE="source ~/.bash/bashrc"
grep -q "$LINE" ~/.bashrc || echo "$LINE" >> ~/.bashrc

# Zsh
rm -rf ~/.zsh
ln -s $SCRIPT_DIR/../zsh ~/.zsh
[ -f ~/.zshrc ] || touch ~/.zshrc
LINE="source ~/.zsh/zshrc"
grep -q "$LINE" ~/.zshrc || echo "$LINE" >> ~/.zshrc

# Inputrc
backup_rm ~/.inputrc
ln -s $SCRIPT_DIR/../inputrc ~/.inputrc

# Node
$SCRIPT_DIR/get_node.sh

# Nvim install
sudo apt install -y libfuse2 gcc ripgrep
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /bin/nvim

# Nvim config
backup_rm ~/.config/nvim
ln -s $SCRIPT_DIR/../nvim ~/.config/nvim
rm -rf ~/.local/share/nvim/lazy
rm -rf ~/.local/share/nvim/site/pack/packer # legacy

# Tmux
backup_rm ~/.config/tmux
backup_rm ~/.tmux.conf
ln -s $SCRIPT_DIR/../tmux ~/.config/tmux
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Gitconfig - don't overwrite any existing global config
[ -f ~/.gitconfig ] || cp $SCRIPT_DIR/../gitconfig ~/.gitconfig
git config --global core.editor nvim
# Set creds for this repo
git -C $SCRIPT_DIR/.. config user.name "Will Lynas"
git -C $SCRIPT_DIR/.. config user.email "43895423+will-lynas@users.noreply.github.com"

# Pylint
backup_rm ~/.config/pylintrc
ln -s $SCRIPT_DIR/../pylintrc ~/.config/pylintrc

# fzf
sudo apt install bat -y
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --xdg
