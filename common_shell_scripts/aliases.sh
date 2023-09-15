# From default bashrc
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Custom
alias vim=nvim
alias cat="batcat -n"
alias clear="clear -x"
alias c="clear"
alias ta="tmux a"
alias zc="source ~/.zshrc" # Zsh Config
alias zx="exec zsh"
alias l="ls -lABh"
alias la="ls -la"

# Custom git - modified from oh my zsh git plugin
alias gp="git push"
alias gf="git fetch"
alias gl="git log"
alias gst="git status"
alias grh="git reset --hard"
alias gco="git checkout"
alias gaa="git add --all"

alias gd="git diff"
alias gds="git diff --staged"

alias gc="git commit"
alias gca="git commit -a"
alias gcam="git commit -am"
alias gcm="git commit -m"

alias grb="git rebase"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"
