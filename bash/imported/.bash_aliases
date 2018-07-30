###
# MATT HARRIS
# m@ttHarri.is
# 11/14/2017, 12:01:19 PM
###########################


## NAVIGATION
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
## LIST
alias l='ls -F --color --group-directories-first --hide=*.*'
alias la='ls -alHFSh --group-directories-first --no-group --color'
alias ll='ls -alHFh --no-group --color'
### TREE
alias tree2='tree -Ch --sort=size  --dirsfirst -L 2'
alias tree3='tree -Ch --sort=size  --dirsfirst -L 3'
alias tree4='tree -Ch --sort=size  --dirsfirst -L 4'
alias ltree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias tree_size="find ./ -maxdepth 2 -type d -a -not -path \"*/node_modules/*\" -exec du --summarize --block-size=M {} \;"
### SYSTEM
alias df="df -ah --tota --block-size=M"
alias free='free -ht'
alias diskspace="df -Th --block-size=M | sort -nr"
alias folder_size="pwd; du -s --block-size=M;"
alias folder_size_all="du -S --block-size=M | sort -nr | more;"
### PROCESSES
alias psgrep='ps aux | grep -v grep | grep -i'
###  FIND
alias lessfind="less -a"
alias find_cmd="man -k"
alias mkdir="mkdir -pv"     # NEW DIRECTORY AND CREATE PARENT DIRECTORIES VERBOSE
###  FILE SYSTEM
alias cp="cp -v"            # SHOW SOURCE AND DESTINATION
alias mkdir="mkdir -pv"     # NEW DIRECTORY AND CREATE PARENT DIRECTORIES VERBOSE
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"
### NETWORKING
alias myip="dig +short http://myip.opendns.com @http://resolver1.opendns.com"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias scpresume='rsync --partial --progress --rsh=ssh' # Resume a broken scp transfer
###  LOGS
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias syslog="tail -f /var/log/syslog"
alias kernlog="tail -f /var/log/kern.log"
## SOCKETS
alias show_sockets_short="ss -4ltdn"
alias show_sockets_long="sudo ss --processes --numeric --udp --ipv4 --listening --tcp --unix --contexts"
alias short_socks="show_sockets_short"
alias long_socks="show_sockets_long"
alias high_ports="sudo lsof -iTCP -i :8000-10000"
alias low_ports="sudo lsof -i :22-100"
alias screenfix='echo -e "\033c"'
# ---------------------------------
## DEVOPS
#-----------------------------------
#alias lynis="/home/icarus/bin/lynis"
