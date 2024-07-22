if ! command -v fzf &> /dev/null; then
    return
fi

export FZF_DEFAULT_OPTS=\
'--multi '\
'--height 40% '\
'--reverse '\
'--preview "batcat --style=numbers --color=always --line-range :500 {} 2>/dev/null" '\
'--border=none '\
'--info=inline-right '\
'--no-scrollbar '\
'--prompt="> " '\
'--pointer=">" '\
'--marker=">" '\

# fzf Ctrl-R is broken with zsh-vi-mode in insert mode
# This fixes that
function source_fzf(){
	source <(fzf --zsh)
}
zvm_after_init_commands+=(source_fzf)
