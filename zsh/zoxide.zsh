if ! command -v zoxide &> /dev/null; then
    return
fi

eval "$(zoxide init zsh)"
