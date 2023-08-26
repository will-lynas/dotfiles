export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCONFLICTSTATE="yes"
export GIT_PS1_SHOWCOLORHINTS=true

GREEN="\[\e[38;5;119m\]"
BLUE="\[\e[38;5;27m\]"
PINK="\[\e[38;5;212m\]"
ENDCOLOR="\[\e[m\]"

# TODO - fix this - changes color when prompt changes?
#export PS1="${GREEN}\u@\h ${BLUE}\w${PINK}\$(__git_ps1 ' [%s]') ${BLUE}\n$ ${ENDCOLOR}"
export PS1="${GREEN}\u@\h ${BLUE}\w${PINK}\$(__git_ps1 ' [%s]') ${ENDCOLOR}\n$ "
