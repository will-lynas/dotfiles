# From default bashrc
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Custom
alias vim=nvim
alias bat="batcat -n"
alias batp="batcat -p"
alias clear="clear -x"
alias c="clear"
alias e="exit"
alias zc="source ~/.zshrc"
alias zx="exec zsh"
alias l="ls -lABh"
alias la="ls -la"
alias lg="git ls-files" # List Git
alias md="mkdir -p"
alias sv="source venv/bin/activate" # Source Venv
alias br="sudo brightnessctl set"
alias wcl="wc -l"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Tmux
alias ta="tmux a"
alias ts="tmux new -s"

# Git
alias gf="git fetch"
alias gl="git log"
alias gst="git status"
alias grh="git reset --hard"

alias gb="git branch"
alias gbd="git branch -d"

alias ga="git add"
alias gaa="git add --all"

alias gp="git push"
alias gpf="git push -f"

alias gco="git checkout"
alias gcob="git checkout -b"

alias gd="git diff"
alias gds="git diff --staged"

alias gc="git commit"
alias gca="git commit -a"
alias gcam="git commit -am"
alias gcm="git commit -m"

alias grb="git rebase"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"

alias gsc="git config user.name 'Will Lynas' && git config user.email '43895423+will-lynas@users.noreply.github.com'" # Git Set Credentials

# Globals
alias -g L="| less"
alias -g ner="2> /dev/null"
