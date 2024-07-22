export TPM_HOME_PARENT="$HOME/.tmux/plugins"
export TPM_HOME="$TPM_HOME_PARENT/tpm"

if ! command -v git &> /dev/null; then
    echo "git is not installed. Exiting tpm script..."
    return 1
fi

if [ ! -d "$TPM_HOME" ] || [ -z "$(ls -A $TPM_HOME 2>/dev/null)" ]; then
    echo "tpm is not installed. Cloning..."
    mkdir -p $TPM_HOME_PARENT
    git clone https://github.com/tmux-plugins/tpm $TPM_HOME
fi
