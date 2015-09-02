
case "$TERM" in
    'xterm') TERM=xterm-256color;;
    'screen') TERM=screen-256color;;
    'Eterm') TERM=Eterm-256color;;
esac

export RAILS_ENV="production"

PATH="$HOME/.rbenv/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games"

if which rbenv > /dev/null 2>&1; then
    PATH="$HOME/.rbenv/bin:$PATH"
    FINDRBENV="yes"
fi

if [ `id -u` = 0 ]; then
    PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
fi

export PATH

if [ "$FINDRBENV" = "yes" ]; then
    eval "$(rbenv init -)"
fi

PAGER=less
export PAGER

EDITOR=vim
export EDITOR
