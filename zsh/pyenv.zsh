if ! command -v pyenv &> /dev/null; then
    return
fi

eval "$(pyenv init -)"
