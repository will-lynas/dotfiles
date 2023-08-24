SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo apt-get -q update
sudo apt -q autoremove -y
#sudo apt-get -q upgrade -y

mkdir -p ~/.config

# Node
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Nvim install
sudo apt install -y libfuse2 gcc ripgrep
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /bin/nvim

# Nvim config
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
rm -f ~/.gitconfig
ln -s $SCRIPT_DIR/gitconfig ~/.gitconfig

# Pylint
rm -f ~/.config/pylintrc
ln -s $SCRIPT_DIR/pylintrc ~/.config/pylintrc

# fzf
sudo apt install bat -y
rm -rf ~/.fzf
rm -rf ~/.config/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --xdg

# Bash
rm -rf ~/.bash ~/.bashrc ~/.bash_aliases
ln -s $SCRIPT_DIR/bash ~/.bash
ln -s ~/.bash/bashrc ~/.bashrc
ln -s ~/.bash/bash_aliases.sh ~/.bash_aliases
source ~/.bashrc
