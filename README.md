# Dotfiles

My personal dotfiles, using `kitty`, `tmux`, `zsh`, `starship`, and `neovim`.

This config is written for macOS, but should only need minor modifications to be used elsewhere.

## Gallery

<img width="1511" alt="image" src="https://github.com/user-attachments/assets/e4852561-4d31-4bba-b135-3105ef6ef707">
<img width="1512" alt="image" src="https://github.com/user-attachments/assets/215aaf98-be7c-468c-a13d-25126b914585">
<img width="1512" alt="image" src="https://github.com/user-attachments/assets/b817f7de-dc4b-4021-a543-68f2b9a4ff17">

## Font

[`DejaVu Sans Mono Nerd Font`](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/DejaVuSansMNerdFontMono-Regular.ttf)

## Install

1. Currently this repo only supports being cloned to the following location

```sh
git clone https://github.com/will-lynas/dotfiles.git ~/dotfiles
```

2.

```sh
brew install --cask kitty
brew install tmux starship neovim fzf ripgrep fd
```

3. This will overwrite any existing config, so make backups if needed

```sh
mkdir -p ~/.config

ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/tmux ~/.config/tmux
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
```

4. Install the [font](#font)

5. Launch `kitty`

6. Hit `y` to install `zplug` plugins

7. Launch `tmux`

8. Hit `Ctrl-a` then `I` to install `tpm` plugins

9. Launch neovim (using `vim`) to install neovim plugins
