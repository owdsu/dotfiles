#!/usr/bin/env zsh
# ZSH Theme - darkangel

# load modules
#autoload -U colors zsh/terminfo # Used in the colour alias below
#autoload -U add-zsh-hook
#setopt promptsubst

PROMPT_DIR_COLOR=$FG[111]
BRACKETS_COLOR=$FG[240]
TIME_COLOR=$FG[075]
AT_COLOR=$FG[127]
PROMPT_FAILURE_COLOR=$FG[124]
GIT_DIRTY_COLOR=$FG[133]
GIT_CLEAN_COLOR=$FG[118]
GIT_PROMPT_COLOR=$FG[075]

# Check SSH
if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
    HOST_NAME_COLOR=$FG[227]    # SSH
    HOST_NAME='%B%M%b'
else
    HOST_NAME_COLOR=$FG[100]    # no SSH
    HOST_NAME='%m'
fi

# Check UID
if [[ $UID -ne 0 ]]; then
    USER_NAME_COLOR=$FG[148]    # user
else
    USER_NAME_COLOR=$FG[124]    # root
fi

local return_code="%(?..%{$PROMPT_FAILURE_COLOR%}%? ↵ %{$reset_color%})"

DIR_PROMPT="%{$BRACKETS_COLOR%}[%{$PROMPT_DIR_COLOR%}%/%{$BRACKETS_COLOR%}]%{$reset_color%}"
USER_PROMPT="%{$USER_NAME_COLOR%}%n%{$AT_COLOR%}@%{$HOST_NAME_COLOR%}$HOST_NAME%{$reset_color%}"

#PROMPT='%{$BRACKETS_COLOR%}┌─${USER_PROMPT} ${DIR_PROMPT} %{$GIT_PROMPT_COLOR%}$(git_prompt_info)%{$GIT_DIRTY_COLOR%}$(git_prompt_status) %{$reset_color%}
PROMPT='%{$BRACKETS_COLOR%}┌─${USER_PROMPT} ${DIR_PROMPT} %{$GIT_PROMPT_COLOR%}$(git_prompt_info)%{$reset_color%}
%{$BRACKETS_COLOR%}└─$USER_NAME_COLOR%}%#%{$reset_color%} '

RPS1="${return_code}%{$BRACKETS_COLOR%}[%{$TIME_COLOR%}%T%{$BRACKETS_COLOR%}]%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$BRACKETS_COLOR%}[%{$GIT_PROMPT_COLOR%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$BRACKETS_COLOR%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✘ "
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✔ "

ZSH_THEME_GIT_PROMPT_ADDED="%{$FG[082]%}✚ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$FG[166]%}✹ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$FG[160]%}✖ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$FG[220]%}➜ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$FG[082]%}═ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$FG[190]%}✭ %{$reset_color%}"

#export LSCOLORS="Gxfxcxdxbxegedabagacad"
#export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'
