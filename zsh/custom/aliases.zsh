# Global aliases -- These do not have to be
# at the beginning of the command line.
alias -g M='|more'
alias -g H='|head'
alias -g T='|tail'
alias -g L='|less'

if [ -f '/root/.vimrc-it' ]; then
    alias svim='sudo vim -u /root/.vimrc-it'
else
    alias svim='sudo vim'
fi
