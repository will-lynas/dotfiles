mkdir -p ~/.config

# Bashrc
mv ~/.bashrc ~/.bashrc.old
ln -s $PWD/bashrc ~/.bashrc
source ~/.bashrc

# Node
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Nvim
sudo apt install -y libfuse2 gcc
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /bin/nvim

rm -rf ~/.config/nvim
ln -s $PWD/nvim ~/.config/nvim
rm -rf ~/.local/share/nvim/lazy

# Tmux
rm -rf ~/.config/tmux
rm ~/.tmux.conf
ln -s $PWD/tmux ~/.config/tmux
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf

rm -rf ~/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Gitconfig
rm -rf ~/.gitconfig
ln -s $PWD/gitconfig ~/.gitconfig
