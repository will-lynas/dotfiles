SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p ~/.config

# Node
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Nvim
sudo apt install -y libfuse2 gcc ripgrep
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /bin/nvim

rm -rf ~/.config/nvim
ln -s $SCRIPT_DIR/nvim ~/.config/nvim
rm -rf ~/.local/share/nvim/lazy

# Tmux
rm -rf ~/.config/tmux
rm ~/.tmux.conf
ln -s $SCRIPT_DIR/tmux ~/.config/tmux
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf

rm -rf ~/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Gitconfig
rm -rf ~/.gitconfig
ln -s $SCRIPT_DIR/gitconfig ~/.gitconfig

# Bash
rm -rf ~/.bash ~/.bashrc ~/.bash_aliases
ln -s $SCRIPT_DIR/bash ~/.bash
ln -s ~/.bash/bashrc ~/.bashrc
ln -s ~/.bash/bash_aliases.sh ~/.bash_aliases
source ~/.bashrc
