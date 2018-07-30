## BASHRC
# ---
# ~/.bashrc: executed by bash for non-login shells
# see /usr/share/doc/bash/examples/startup-files (in package bash-doc)
# notes:
# serverfault.com/questions/3743/what-useful-things-can-one-add-to-ones-bashrc

# If not running interactively, do nothing
case $- in
    *i*) ;;
      *) return;;
esac

## HISTORY CONF OPTIONS
# ---
# IGNORE DUPLICATE AND STARTS WIT SPACE
HISTCONTROL=ignoreboth:erasedups
# IGNORE WORDS IN LIST
HISTIGNORE='ls -a:ls -al:ll:pwd:whoami:date:rm:cp:password:ssh:user:authorized:rsa:'
# HISTORY LENGTH SIZE
HISTSIZE=10000
# HISTORY FILESIZE
HISTFILESIZE=20000

## WORKING DIRECTORY
# TRIM THE WORKING DIRECTORY PATH
#PROMPT_DIRTRIM=2

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

## SHOPT VARIABLES
# Append history dont overrwite
shopt -s histappend
# Check window size after each command and resize
shopt -s checkwinsize
# Pathname expansion will be case-insensitive
shopt -s nocaseglob
# Change to named directory
shopt -s autocd
# Attempt hostname expansion when @ is at the beginning
shopt -s hostcomplete

## Globstar
# Use globstar pattern "**" used in a pathname expansion context will match all files and zero or more directories and subdirectories
#shopt -s globstar
#
## Extended globstar
# Enable extended pattern-matching features
# This will give you ksh-88 egrep-style extended pattern matching or, in other words, turbo-charged pattern matching within bash.
#
# The available operators are:
# - ?(pattern-list)   Matches zero or one occurrence of the given patterns
# - *(pattern-list)   Matches zero or more occurrences of the given patterns
# - +(pattern-list)   Matches one or more occurrences of the given patterns
# - @(pattern-list)   Matches exactly one of the given patterns
# - !(pattern-list)   Matches anything except one of the given patterns
#
#shopt -s extglob

## AUTOCOMPLETION
# ENABLE programmable completion features (you don't need to enable this, if it's already enabled in /etc/bash.bashrc and /etc/profile sources /etc/bash.bashrc)
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# TERMINAL COLORS FILE
if [ -f ~/.bash_colors ]; then
  . ~/.bash_colors
fi

# ALIAS INCLUDE FILE
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# FUNCTIONS INCLUDE
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi
