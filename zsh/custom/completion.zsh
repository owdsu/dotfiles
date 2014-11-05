zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,command -w -w --forest"
zstyle ':completion:*:*:*:*:processes-names' command "ps -u `whoami` -o command"
# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
