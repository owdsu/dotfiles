
case "$TERM" in
    'xterm') TERM=xterm-256color;;
    'screen') TERM=screen-256color;;
    'Eterm') TERM=Eterm-256color;;
esac

export RAILS_ENV="production"
export PATH="$HOME/.rbenv/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11"
eval "$(rbenv init -)"

PAGER=less
export PAGER

EDITOR=vim
export EDITOR
