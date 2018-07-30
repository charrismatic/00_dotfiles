# .bashrc




#################   HISTORY CONF OPTIONS   ################
# IGNORE DUPLICATE AND STARTS WIT SPACE
HISTCONTROL=ignoreboth:erasedups
# IGNORE WORDS IN LIST
HISTIGNORE='ls:ls -a:ls -al:pwd:whoami:date:rm:cp:password:ssh:user:authorized:rsa:'
# History length SIZE
HISTSIZE=10000
# HISTORY FILESIZE
HISTFILESIZE=20000



#####################    SHOPT VARIABLES   ##############
# APPEND DONT OVERWRITE
shopt -s histappend
# Check window size after each command AND RESIZE
shopt -s checkwinsize
# pathname expansion will be treated as case-insensitive
shopt -s nocaseglob

######################## AUTOCOMPLETION  ############################
shopt -s autocd # change to named directory
shopt -s hostcomplete # attempt hostname expansion when @ is at the beginning
shopt -s nocaseglob  # pathname expansion IS case-insensitive

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=


# ALIAS INCLUDE FILE
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi





# Set this variable in your local shell config (such as ~/.bashrc)
# if you want remote xterms connecting to this system, to be sent 256 colors.
# This must be set before reading global initialization such as /etc/bashrc.
SEND_256_COLORS_TO_REMOTE=1

# Terminals with any of the following set, support 256 colors (and are local)
local256="$COLORTERM$XTERM_VERSION$ROXTERM_ID$KONSOLE_DBUS_SESSION"

if [ -n "$local256" ] || [ -n "$SEND_256_COLORS_TO_REMOTE" ]; then

  case "$TERM" in
    'xterm') TERM=xterm-256color;;
    'screen') TERM=screen-256color;;
    'Eterm') TERM=Eterm-256color;;
  esac
  export TERM

  if [ -n "$TERMCAP" ] && [ "$TERM" = "screen-256color" ]; then
    TERMCAP=$(echo "$TERMCAP" | sed -e 's/Co#8/Co#256/g')
    export TERMCAP
  fi
fi

unset local256



### SET THE APPEARANCE OF THE PROMPT
# HOME 
#PS1='\[\033[1;36m\]\d\[\033[1;31m\]|\[\033[1;33m\]`date +%H:%M`\n\[\033[1;34m\]\u\[\033[0;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\W \$\[\033[0m\] '
# REMOTE
PS1='\e[31m\e[1m\e[4mREMOTE\e[33m:\[\033[1;97m\]\u\[\033[0;31m\]@\[\033[1;97m\]\h\[\033[1;35m\]\W $\[\033[0m\] '


# TERMINAL COLORS FILE
if [ -f ~/.bash_colors ]; then
  . ~/.bash_colors
fi

