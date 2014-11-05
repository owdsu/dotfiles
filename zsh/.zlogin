
if [ $TERM != "screen-256color" ] && [ $TERM != "screen" ]; then
    tmux attach -t ssh || tmux -u -2 new-session -d -s ssh; tmux attach -t ssh
fi

ttyctl -f  # freeze the terminal modes... can't change without a ttyctl -u
mesg y
uptime

#fortune
log
from 2>/dev/null
