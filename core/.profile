# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    # Add subdirectories to path
    for dir in ${HOME}/bin/* ; do
    if [ -d "$dir" ]; then
	#echo "Dir: '${dir}'"
	PATH="${dir}:${PATH}"
    fi
    done
    # Ass orphan scripts
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# XDG Base directory specification
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Add games path
PATH="/usr/games:$PATH"

# Disable python bytecode (.pyc)
export PYTHONDONTWRITEBYTECODE=1

# Wget config location
export WGETRC="${HOME}/.config/wget/wgetrc"

# Less history file$
HISTORY_PATH_LESS="${HOME}/.cache/less/"
mkdir -p "${HISTORY_PATH_LESS}"
export LESSHISTFILE="${HISTORY_PATH_LESS}lesshst"
