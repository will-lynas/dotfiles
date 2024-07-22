if ! command -v starship &> /dev/null; then
    return
fi

eval "$(starship init zsh)"
