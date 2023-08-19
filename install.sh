mv ~/.bashrc ~/.bashrc.old 2>/dev/null
ln -s $PWD/bashrc ~/.bashrc
source ~/.bashrc

sudo apt install -y libfuse2 gcc
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /bin/nvim

rm -rf ~/.local/share/nvim/site/pack/packer 2>/dev/null
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir -p ~/.config

rm -rf ~/.config/nvim 2>/dev/null
ln -s $PWD/nvim ~/.config/nvim

rm -rf ~/.config/tmux 2>/dev/null
rm ~/.tmux.conf 2>/dev/null
ln -s $PWD/tmux ~/.config/tmux
ln -s $PWD/tmux/tmux.conf ~/.tmux.conf

rm -rf ~/.gitconfig 2>/dev/null
ln -s $PWD/gitconfig ~/.gitconfig

rm -rf ~/.tmux 2>/dev/null
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
