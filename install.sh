#!/bin/sh
# --------------------------------------------------------------
# This is simple script to install my dotfiles.
# --------------------------------------------------------------
# Author: owdsu
# Mail:   a@owd.su
# --------------------------------------------------------------
# vim: set foldmethod=marker tabstop=4 shiftwidth=4:

INSTALLDIR=${1:-$HOME}
DOTFILEDIR=${2:-".dotfiles"}
MY_REPO="https://github.com/owdsu/dotfiles.git"
OMZ_REPO="https://github.com/robbyrussell/oh-my-zsh.git"
SYN_REPO="git://github.com/zsh-users/zsh-syntax-highlighting.git"

# Set colors
#{{{
col_reset="\033[0m%"
col_black="\033[0;30m"
col_red="\033[0;31m"
col_green="\033[0;32m"
col_brown="\033[0;33m"
col_blue="\033[0;34m"
col_magenta="\033[0;35m"
col_cyan="\033[0;36m"
col_light_gray="\033[0;37m"
col_dark_gray="\033[1;30m"
col_light_red="\033[1;31m"
col_light_green="\033[1;32m"
col_light_blue="\033[1;34m"
col_light_purple="\033[1;35m"
col_light_cyan="\033[1;36m"
col_white="\033[1;37m"
col_reset="\033[0m"
#}}}

# --------------------------------------------------------------
#                         functions                            #
# --------------------------------------------------------------
info () {
    printf "[${col_cyan}INFO${col_reset}] $1\n"
} # info

waiting () {
    printf "[${col_cyan}....${col_reset}] $1"
} # waiting

success () {
    printf "\r\033[2K[ ${col_green}OK${col_reset} ] $1\n"
} # success

warning () {
    printf "\r\033[2K[${col_brown}WARN${col_reset}] $@\n"
} # warning

fail () {
#{{{
    printf "\r\033[2K[${col_red}FAIL${col_reset}] $@\n"
    echo ''
    [ -f "$TMPFILE" ] && rm -f "$TMPFILE" > /dev/null 2> /dev/null
    exit 1
#}}}
} # fail

git_clone () {
#{{{
    _REPO=$1   || fail "Undefined repozitory"
    _TARGET=$2 || fail "Undefined directory"
    waiting "Cloning repository '$_REPO' into '$_TARGET'"
    [ -f "$TMPFILE" ] || TMPFILE=`mktemp`
    git clone "$_REPO" "$_TARGET" > /dev/null 2> $TMPFILE
    if [ "$?" -eq "0" ]; then
        success "Cloned repository '$_REPO' into '$_TARGET'"
    else
        fail "$(cat $TMPFILE)"
    fi
#}}}
} # git_clone

rename_date () {
#{{{
    _ORIG=$1
    _TYPE="File"
    if [ -f "$_ORIG" -o -d "$_ORIG" ]; then
        [ -d "$_ORIG" ] && _TYPE="Directory"
        info "$_TYPE '$INSTALLDIR/$DOTFILEDIR' exists"
        _NEW="${_ORIG}.save_$(date +%Y-%m-%d_%H-%M-%S)"
        if mv "$_ORIG" "$_NEW" > /dev/null 2> $TMPFILE; then
            success "Rename '$_ORIG' to '$_NEW'"
        else
            fail "$(cat $TMPFILE)"
        fi

    else
        warning "File or directory '$_ORIG' does not exist"
    fi
#}}}
} # rename_date

# --------------------------------------------------------------
#                        main script                           #
# --------------------------------------------------------------

TMPFILE=`mktemp`

if ! which git > /dev/null ; then
    fail "Not found '${col_brown}git${col_reset}'. Please install it..."
fi

if [ ! -d "$INSTALLDIR" ]; then
    fail "Directory '${col_brown}$INSTALLDIR${col_reset}' does not exist"
else
    info "Use the installation directory '$INSTALLDIR'"
fi

[ -d "$INSTALLDIR/$DOTFILEDIR" ] && rename_date "$INSTALLDIR/$DOTFILEDIR"

git_clone "$MY_REPO"  "$INSTALLDIR/$DOTFILEDIR"
git_clone "$OMZ_REPO" "$INSTALLDIR/$DOTFILEDIR/zsh/oh-my-zsh"
git_clone "$SYN_REPO" "$INSTALLDIR/$DOTFILEDIR/zsh/custom/plugins/zsh-syntax-highlighting"

for FILE in .zlogin .zshenv .zshrc; do
    if [ -f "$INSTALLDIR/$FILE" ]; then
        rename_date "$INSTALLDIR/$FILE"
    fi
    ln -s "$INSTALLDIR/$DOTFILEDIR/zsh/$FILE" "$INSTALLDIR/$FILE"
done

ZSH="$INSTALLDIR/$DOTFILEDIR/zsh/oh-my-zsh"

rm -f "$TMPFILE"
