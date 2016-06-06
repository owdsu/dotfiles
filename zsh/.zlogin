CURL='/usr/bin/curl'
COWSAY='/usr/games/cowsay'

if [ $TERM != "screen-256color" ] && [ $TERM != "screen" ]; then
    ( (tmux has-session -t ssh && tmux attach-session -t ssh) || (tmux -u -2 new-session -s ssh) ) && exit 0
    echo "tmux failed to start"
fi

ttyctl -f  # freeze the terminal modes... can't change without a ttyctl -u
mesg y
uptime

#fortune
if [ "$ZSH_ADVICE" = "yes" -o "$ZSH_ADVICE" = "true" ] && [ -f "$CURL" -a -f "$COWSAY" ]; then
    echo -e `$CURL -s  http://fucking-great-advice.ru/api/random | awk -F \" '{print $8}'` | sed 's/\&nbsp;/ /g' | $COWSAY -tf gnu
fi
log
from 2>/dev/null
