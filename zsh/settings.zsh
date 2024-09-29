if [ -n "$TMUX" ]; then
  export TERM="xterm-256color"
else
  export TERM="xterm-kitty"
fi

export EDITOR=nvim

export PATH="$PATH:$INSTALL_DIR/bin/:$HOME/go/bin/:$HOME/.elan/bin"
typeset -U path

export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

export PROMPT_EOL_MARK=''
