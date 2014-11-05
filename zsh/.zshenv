
case "$TERM" in
    'xterm') TERM=xterm-256color;;
    'screen') TERM=screen-256color;;
    'Eterm') TERM=Eterm-256color;;
esac

PAGER=less
export PAGER

EDITOR=vim
export EDITOR
