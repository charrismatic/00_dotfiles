#!/bin/sh

## COLORIZATION 
# https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/
# https://superuser.com/questions/117841/get-colors-in-less-or-more
# REQUIRED: PYTHON PIGMENTS 
# sudo apt-get install python-pygments python3-pygments gawk


# =============================================================================
# INPUT PREPROCESSOR - LESSOPEN
# An input preprocessor is simply an executable program (or shell script),
# which writes the contents of the file to a different file, called the replacement file.
# To set up an input preprocessor, set the LESSOPEN environment variable to a command line which will invoke your inppu preprocessor. 
# =============================================================================
#if type lesspipe.sh >/dev/null 2>&1; then
#  export LESSOPEN="| /usr/bin/lesspipe %s"
#  // or custom
#  export LESSOPEN='| lesspipe.sh %s'
#fi

# =============================================================================
# INPUT POSTPROCESSOR - LESSCLOSE
# When less closes a file opened in such a way, it will call another program, called the input postprocessor,
# which may perform any desired clean-up action (such as deleting the replacement file created by LESSOPEN). 
# This program receives two command line arguments, the original filename as entered by the user, and the name of the replacement file.
# set the LESSCLOSE environment variable to a command line which will invoke your input postprocessor.   
# include two occurrences of "%s" the first is replaced by the name of the original file, the second with the replacement file

## EXAMPLE: these two scripts will allow you to keep files in compressed format, but still let less view them directly:
# ```
#       lessopen.sh:
#            #! /bin/sh
#            case "$1" in
#            *.Z) uncompress -c $1  >/tmp/less.$$  2>/dev/null
#                 if [ -s /tmp/less.$$ ]; then
#                      echo /tmp/less.$$
#                 else
#                      rm -f /tmp/less.$$
#                 fi
#                 ;;
#            esac
#
#       lessclose.sh:
#            #! /bin/sh
#            rm $2
# ```
# To use these scripts, put them both where they can be executed 
# set LESSOPEN="lessopen.sh %s", and LESSCLOSE="lessclose.sh %s %s".  
# More complex LESSOPEN and LESSCLOSE scripts may be written to accept other types of compressed files
# =============================================================================

# =============================================================================
# INPUT PREPROCESSOR - LESSPIPE
# it is also possible to set up an input preprocessor to pipe the file data directly to less, 
# rather than putting the data into a replacement file.
# This avoids the need to decompress the entire file before starting to view it.  
# An input preprocessor that works this way is called an input pipe. 
# An input pipe, instead of writing the name of a replacement file on its standard output, 
# writes the entire contents of the replacement file on its standard output.  
# If the input pipe does not write any characters on its standard output, then there is no replacement file and less uses the original file, as normal.
# To use an input pipe, make the first character in the LESSOPEN environment variable a vertical bar (|) to signify the input preprocessor is a pipe
# 
#  Example: ~/lesspipe.sh:
# ```
#             #! /bin/sh
#             case "$1" in
#             *.Z) uncompress -c $1  2>/dev/null
#             *)   exit 1
#                  ;;
#             esac
#             exit $?
# ```
# To use this put the script where it can be executed and set LESSOPEN="|lesspipe.sh %s".
# LESSCLOSE postprocessor can be used, but it is usually not necessary since there is no replacement file to clean up.
#
# If you don't want lesspipe, replace the eval statement with:
# Create ~/.lessfilter
# =============================================================================


# =============================================================================
## KEY BINDINGS
## define your own less commands by using the program lesskey (1) to create a lesskey file.
# If the environment variable LESSKEY is set, less uses that as the name of the lesskey file.
# Otherwise, less looks in a standard place for the lesskey file: $HOME/.less
# The command should include one occurrence of "%s" which will be replaced by the filename
# =============================================================================




# ============================================================================= 
# COLORS
# If using less to view man pages you can add below variables to .bashrc file.
# After reload .bashrc variables with command: source /home/
# user/.bashrc and you will see colored man pages.
# =============================================================================
#export LESS_TERMCAP_mb=$'\E[01;31m'
#export LESS_TERMCAP_md=$'\E[01;31m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[01;44;33m'
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[01;32m'

export LESS_TERMCAP_mb=$'\E[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'      # begin blink
export LESS_TERMCAP_me=$'\E[0m'         # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m'  # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'         # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'      # begin underline
export LESS_TERMCAP_ue=$'\E[0m'         # reset underline

# ALTERNATIVE SYNTAX HIGHLIGHER
# BETTER QUALITY, BUT REQUIRES MORE MEMORY
export LESSCOLORIZER='pygmentize'

# Sets lessopen and lessclose when evaluated
# export LESSOPEN="| /usr/bin/lesspipe %s";
# export LESSCLOSE="/usr/bin/lesspipe %s %s"
eval "$(SHELL=/bin/sh lesspipe)" 
 
 
 

# Better syntax highlighting when reading source 
# fruity, rrt, paraiso-dark, monokai
# to list available styles: `pygmentize -L styles`

LESS_PYGMENTIZE=yes
if [ -n "$LESS_PYGMENTIZE"  ]; then
  export LESSCOLORIZER='pygmentize'
  export PYGMENTIZE_STYLE='paraiso-dark'
fi
unset LESS_PYGMENTIZE
 
# ALTERNATIVE METHOD 1
# export LESSOPEN="|lesspipe.sh %s" ;;

# ALTERNATIVE METHOD 2
# -----------------------------------------------------------------------------
# ADDITIONAL REQUIRESMENTS
# make less more friendly for non-text input files, see lesspipe
# https://superuser.com/questions/117841/get-colors-in-less-or-more
# sudo apt-get install python-pygments python3-pygments gawk
# export LESSOPEN="| ~/lib/less/.lessfilter %s" ;; 


# =============================================================================
# OPTIONS AND ENVIRONMENT VARIABLES
# Declared in the system environment as usual, or in a lesskey file
# If environment variables are defined in more than one place, 
# variables defined in the local lesskey file take precedence 
# =============================================================================
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'


# =============================================================================
## SECURITY
# When the environment variable LESSSECURE is set to 1, less runs in a "secure" mode
# The following features are disabled:
#   !      the shell command
#   |      the pipe command
#   :e     the examine command.
#   v      the editing command
#   s  -o  log files
#   -k     use of lesskey files
#   -t     use of tags files
#   metacharacters in filenames, such as *
#   filename completion (TAB, ^L)
# =============================================================================
# export LESSSECURE=1





