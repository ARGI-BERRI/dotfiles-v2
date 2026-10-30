# shellcheck disable=SC1090,SC1091,SC2148

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/bash/history"
mkdir -p "$(dirname -- "$HISTFILE")"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# enable bash options
shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkhash
shopt -s direxpand
shopt -s dirspell
shopt -s dotglob
shopt -s execfail
shopt -s extglob
shopt -s nocaseglob
shopt -s nocasematch
shopt -s nullglob
shopt -s xpg_echo

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# custom prompt
PS1="[\t] \[\e[32m\]\u@\h\[\e[1;30m\e[m\]:\[\e[1;34m\]\w\[\e[m\]\$ "

# mise
if [ -x "$(command -v mise)" ]; then
    eval "$(mise activate bash)"
fi

# zoxide
eval "$(zoxide init bash)"

# fzf
eval "$(fzf --bash)"

# starship
eval "$(starship init bash)"
eval "$(starship completions bash)"

# include .bash_local if it exists
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
