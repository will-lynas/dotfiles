setup_git_globals() {
    # Get rid of annoying git push -u
    git config --global push.autoSetupRemote true
    git config --global advice.statushints false
    git config --global core.editor nvim
    git config --global init.defaultbranch main
}

setup_global_git_name() {
    git config --global user.name "Will Lynas"
    git config --global user.email \
        "43895423+will-lynas@users.noreply.github.com"
}

fix_default_branch() {
    # This needs to be run (once per repo) if the automatic
    # default branch detection fails. We can't just run every
    # time because it connects to the remote and is slow.
    # TODO: modify detection function to do this on failure.
    git remote set-head origin -a
}

git_default_branch() {
    # Doesn't always work. See previous function.
    git symbolic-ref refs/remotes/origin/HEAD | \
        sed 's@^refs/remotes/origin/@@'
}

rebase_on_default() {
    git rebase "origin/$(git_default_branch)"
}

reset_on_default() {
    git reset --hard "origin/$(git_default_branch)"
}

checkout_default() {
    # Relies on same local/remote naming.
    # But every sane person does that.
    git checkout $(git_default_branch)
}

mkdir_and_cd() {
    mkdir $1 && cd $1
}

# https://polothy.github.io/post/2019-08-19-fzf-git-checkout/
fzf_git_branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return
    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf-tmux -p 95%,80% --ansi --no-multi \
        --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

git_checkout_fuzzy() {
    git rev-parse HEAD > /dev/null 2>&1 || return
    local branch
    branch=$(fzf_git_branch)
    if [[ "$branch" = "" ]]; then
        return
    fi
    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

# From default bashrc
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

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
alias md="mkdir -p"
alias mc="mkdir_and_cd"
alias sv="source venv/bin/activate"
alias pv="python3.11 -m venv venv"
alias psg="ps aux | grep -v grep | grep"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Tmux
alias ta="tmux a"
alias tn="tmux new"

# Git
alias gf="git fetch"
alias gl="git log"
alias gst="git status"
alias gstv="git status -v"
alias grh="git reset --hard"
alias grhom="reset_on_default"
alias gls="git ls-files"

alias gb="git branch"
alias gbd="git branch -d"

alias ga="git add"
alias gaa="git add --all"

alias gp="git push"
alias gpf="git push -f"

alias gco="git checkout"
alias gcob="git checkout -b"
alias gcof="git_checkout_fuzzy"
alias gcom="checkout_default"

alias gd="git diff"
alias gds="git diff --staged"
alias gdc="git diff --cached"

alias gc="git commit"
alias gca="git commit -a"
alias gcam="git commit -am"
alias gcm="git commit -m"
alias gcan="git commit -a --amend"
alias gcn="git commit --amend"

alias grb="git rebase"
alias grbc="git rebase --continue"
alias grba="git rebase --abort"
alias grbom="rebase_on_default"

alias gsh="git stash"
alias gsp="git stash pop"
