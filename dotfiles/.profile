# shellcheck disable=SC1091,SC2148

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PAGER='less -R'
export EDITOR='nvim'

# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# GNU readline
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc

# GNU Parallel
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel

# GNU Compiler Collection
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship/starship.toml

# screen
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc

# fzf
export FZF_DEFAULT_OPTS="--border --reverse"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# include .aliases if it exists
if [ -f ~/.aliases ]; then
    . "$HOME/.aliases"
fi

# include .profile_local if it exists
if [ -f "$HOME/.profile_local" ]; then
    . "$HOME/.profile_local"
fi
