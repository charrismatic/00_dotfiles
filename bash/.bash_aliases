###
# MATT HARRIS
# m@ttHarri.is
# 3/11/2018, 8:10:22 AM
###########################
## NAVIGATION
alias goto='source ~/bin/goto.sh'
alias goto-list='cat ~/bin/goto.sh | grep -F #-#'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
## LIST
alias l='ls -1F --color=auto --group-directories-first --hide=*.*'
alias la='ls -alHFSh --group-directories-first --no-group --color=auto'
alias ll='ls -alHFh --no-group --color=auto'
alias ls='ls -lagGh --color=auto --group-directories-first --sort=version'
alias grep='grep --color=auto'

## SORT
## -h human readable numbers
## -l long list format
## -r reverse order
## -s print file size
## -S sort by file size,largest first
## -t set field seperator
##  + `| sort -n` sort numeric by string value
#alias lsize='ls --sort=size -lhr'
#alias sort_size='ls -lSr'
#alias sort_size="ls -s | sort -n"
#alias sort_size="ls -sh | sort -nls -1sShF --group-directories-first"
alias sort_size="ls -aFlss --block-size=k --no-group --time-style=+'%b%e %H:%M' --group-directories-first"
alias sort_date="ls -aFhlrt --no-group --time-style=+'%b%e %H:%M' --group-directories-first"
#alias sort_date='ls -ltr'
#alias sort_folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"
alias sort_folders="du -c -d 1 --block-size=M --threshold=1M | sort -rn"
alias sort_folders-1="du -c -d 1 --block-size=M --threshold=1M | sort -rn"
alias sort_folders-2="du -c -d 2 --block-size=M --threshold=1M | sort -rn"
alias sort_folders-3="du -c -d 3 --block-size=M --threshold=1M | sort -rn"
alias sort_extension="ls -atlrh --sort=size --block-size=M --no-group -g --group-directories-first --time-style=+'%e%b %H:%M\'"
###  TREE  ###
#alias tree -Chd --sort=size  folders only size sorted
alias tree='tree -Ch --sort=size  --dirsfirst -L 3'
alias tree3='tree -Ch --sort=size  --dirsfirst -L 3'
alias tree4='tree -Ch --sort=size  --dirsfirst -L 4'
alias ltree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias tree_dirs='tree -aChd --sort=size --matchdirs -L 3'
alias tree_space="tree --du -d -shaC | grep -Ev '(  *[^ ]* ){2}\['"

##  SYSTEM ##
# DISK USAGE
# du -h -d2 * | sort -h
#	du -h -d 1
# Current folder size
# size du -h -d0
# Get all files, folders and hidden files
# du -sh `ls -a`
# du -h -d2 * | sort -h -r | head -n 30

# reccommended: ncurses disk usage https://dev.yorhel.nl/ncdu
alias folder_size_all="du -S --block-size=M | sort -nr | more;"
alias folder_size="pwd; du -s --block-size=M;"
alias diskspace="df -Th --block-size=M | sort -nr"
alias df="df -ah --tota --block-size=M"

## MEMORY
# SHOW FREE SYSTEM MEMORY
alias free='free -ht'

### FIND
# PROCESSES
alias psgrep='ps aux | grep -v grep | grep -i'
alias lessfind="less -a"
#alias find_notes="find ~/00_notes -type f -exec grep -H --color=always --no-messages --no-filename --before-context=1 --after-context=1 'find' {} \;"
alias find_cmd="man -k"

## HISTORY
# - AUTO-SEARCH HISTORY -- CTRL + R
# - SUDO THE PREVIOUS COMMAND -- sudo !!
#alias backup_history= "stamp=$(date -d today +%y.%m.%d); output_file=.bash_history.$stamp ; cat ~/.bash_history | grep -x '.\{3,\}' | sort --ignore-case --unique --merge > ~/profiles/env/archives/$output_file;"
alias history_sort="cat ~/.bash_history | grep -x '.\{3,\}' | sort --ignore-case --unique --merge > ~/.bash_history.tmp; wait; cp ~/.bash_history.tmp ~/.bash_history"

#NEW DIRECTORY AND CREATE PARENT DIRECTORIES VERBOSE
alias mkdir="mkdir -pv"

## FILE SYSTEM SAFET NET

# Show where you copy
#alias cp="cp -v"

# PROMPT ON OVERWRITE
#alias cp='cp -i'

# HUMAN READABLE
#alias df='df -h'

# PROMPT ON OVERWRITE - ONLY MOVE IS SOURCE NEWER
alias mv='mv -i -u'

# PROMPT BEFORE EVERY REMOVAL
#alias rm='rm -i'

# PROMT BEFORE REMOVING MORE THAN 3 FILES
alias rm='rm -I'

# REMOVE FOLDER RECURSIVE
alias rmrf="sudo rm -rf"

# SHOW SOURCE AND DESTINATION
alias cp="cp -v"

alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"


# APT - PACKAGE MANGER
alias install='sudo apt-get install'
alias update='sudo apt-get update'
alias search='apt-cache search'
alias apt_show='apt show'

# ARCHIVE CONTROL
alias peek_tar="tar -tvf"
alias peek_tar_gz="tar -ztvf"
alias peek_tar_bz2="ta -jtvf"

## NETWORKING  ####
alias myip="dig +short http://myip.opendns.com @http://resolver1.opendns.com"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Resume a broken scp transfer
alias scpresume='rsync --partial --progress --rsh=ssh'

## LOGS
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias syslog="tail -f /var/log/syslog"
alias kernlog="tail -f /var/log/kern.log"

################   APPLICATIONS   ##################################
# OPEN TEXT EDITOR
# alias note='open /Applications/TextEdit.app'

#alias open="nohup nautilus . &"
alias open="nautilus --no-desktop ."

# nautilus --no-desktop . &
# alias nautilus='nautilus >/dev/null 2>&1'

#####################   DEV FUNCTIONS    #####################
# NO PROVISION AS DEFAULT, SO WE DO NOT ACCIDENTALLY DESTROY ANY BOXES

## VAGRANT
alias vup="vagrant up --no-provision"
# RUN V UPDATE STARTUP A BOX AND FORCE RUN PROVISIONERS
alias vupdate="vagrant up --provision"
alias vconfig="cat Vagrantfile | grep 'vm.' | grep -v '^#' --color=always"
alias vfile="cat Vagrantfile"
alias vhalt="vagrant halt"
# RUN V INIT FOR FIRST TIME BOX STARTUPS (ADD ADDITIONAL FLAGS FOR STARTUP CHECKS)
alias vinit="vagrant up --provision"
alias vkill="vagrant destroy"
alias vkillall="vboxmanage list runningvms | sed -r 's/.|\{(.*\}/|\1/' | xargs -L1 -I {} VBoxManage controlvm {} poweroff"
alias vagrant_killall="vboxmanage list runningvms | sed -r 's/.*\{(.*)\}/\1/' | xargs -L1 -I {} VBoxManage controlvm {} poweroff"
alias vlist="vagrant global-status"
alias vagrant_list="vagrant global-status"
alias vssh="vagrant ssh"
alias vstat="vagrant status"

## GIT FUNCTIONS
alias gstat="git status"
alias gpull="git pull"
alias gadd="git add"
alias git-list="git help -a"
# OR git --help --all

## APACHE FUNCTIONS
alias web_restart="sudo service apache2 restart"
alias web_status="sudo service apache2 status"
alias serve="php -S localhost:8000 -t ."

## MYSQL
#alias export_db = "pname=PROJECT_NAME ; tstamp=$(date -d today +%y.%m.%d.%H%I%M%S) ; fname=$pname.$tstamp.sql ; dbpass=SECRET ; dbpath=/var/www/html/site_data/db_export ; mysqldump -uUSERNAME -pSECRET $pname > $dbpath$fname"
#alias import_db = "mysql -uUSERNAME -pSECRET < ~/site_date/db_source/$(get_the_latest.sql)" # FIST IMPORT WITH CREATE / DROP IF EXISTS
