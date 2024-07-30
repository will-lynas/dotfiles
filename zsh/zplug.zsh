export ZPLUG_HOME="$HOME/.zplug"

if ! command -v git &> /dev/null; then
    echo "git is not installed. Exiting zplug script..."
    return 1
fi

if [ ! -d "$ZPLUG_HOME" ] || [ -z "$(ls -A $ZPLUG_HOME 2>/dev/null)" ]; then
    echo "zplug is not installed. Cloning..."
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

source $ZPLUG_HOME/init.zsh

zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/git", from:oh-my-zsh
zplug "romkatv/powerlevel10k", as:theme, depth:1

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

if zplug check romkatv/powerlevel10k; then
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi

    source $ZSH_DIR/p10k.zsh
fi


if zplug check jeffreytse/zsh-vi-mode; then
    export ZVM_VI_EDITOR="nvim"
    export ZVM_VI_ESCAPE_BINDKEY="^["
    export ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
    export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
fi
