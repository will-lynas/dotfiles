export PLUGIN_HOME="$HOME/.zsh_plugins"
mkdir -p "$PLUGIN_HOME"

if ! command -v git &> /dev/null; then
    echo "git is not installed. Exiting plugin script..."
    return 1
fi

export P10K_HOME="$PLUGIN_HOME/powerlevel10k"

if [[ ! -d "$P10K_HOME" ]]; then
    echo "powerlevel10k is not installed. Cloning..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $P10K_HOME
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $P10K_HOME/powerlevel10k.zsh-theme
# If this isn't symlinked, the config wizard will start
source ~/.p10k.zsh

# ----------------------------------------------------------------------------

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

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

if zplug check jeffreytse/zsh-vi-mode; then
    export ZVM_VI_EDITOR="nvim"
    export ZVM_VI_ESCAPE_BINDKEY="^["
    export ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
    export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
fi
