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

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/git", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
