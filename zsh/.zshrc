# Path to your oh-my-zsh installation.
export ZSH=$HOME/.dotfiles/zsh/oh-my-zsh

ZSH_THEME="darkangel"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
ZSH_CUSTOM=$HOME/.dotfiles/zsh/custom
plugins=(git zsh-syntax-highlighting history-substring-search)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

source $ZSH/oh-my-zsh.sh

# User configuration

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'
#HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=magenta,bold'

export PATH=$HOME/bin:/usr/local/bin:$PATH
