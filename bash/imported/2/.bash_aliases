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
# LONG--HIDE-GROUPS--SIZE-MB--SORT-ACCESS-TIME
alias llt="ls -ltc --color=always --block-size=M --no-group --almost-all "
# LONG--NATURAL-SORT--HIDE-GROUPS--SIZE-MB--DIRS-FIRST
alias llg="ls -l --color=always --group-directories-first --block-size=M --no-group --almost-all -v"
# LONG--NATURAL-SORT--HIDE-GROUPS--SIZE-MB
alias ll="ls -l --color=always --human-readable  --no-group --almost-all --classify --sort=none -v"
## SORT
#alias sort_size="ls -s | sort -n"
alias sort_size="ls -aFlss --block-size=k --no-group --time-style=+'%b%e %H:%M' --group-directories-first"
alias sort_date="ls -aFhlrt --no-group --time-style=+'%b%e %H:%M' --group-directories-first"
#alias sort_folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"
alias sort_folders="du -c -d 1 --block-size=M --threshold=1M | sort -rn"
alias sort_folders-1="du -c -d 1 --block-size=M --threshold=1M | sort -rn"
alias sort_folders-2="du -c -d 2 --block-size=M --threshold=1M | sort -rn"
alias sort_folders-3="du -c -d 3 --block-size=M --threshold=1M | sort -rn"
alias sort_extension="ls -atlrh --sort=size --block-size=M --no-group -g --group-directories-first --time-style=+'%e%b %H:%M\'"
### TREE  
alias tree='tree -Ch --sort=size  --dirsfirst -L 3'
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
###  HISTORY
alias backup_history= "stamp=$(date -d today +%y.%m.%d); output_file=.bash_history.$stamp ; cat ~/.bash_history | grep -x '.\{3,\}' | sort --ignore-case --unique --merge > ~/profiles/env/archives/$output_file;"
alias history_sort="cat ~/.bash_history | grep -x '.\{3,\}' | sort --ignore-case --unique --merge > ~/.bash_history.tmp; wait; cp ~/.bash_history.tmp ~/.bash_history"
###  FILE SYSTEM
alias cp="cp -v"            # SHOW SOURCE AND DESTINATION
alias mkdir="mkdir -pv"     # NEW DIRECTORY AND CREATE PARENT DIRECTORIES VERBOSE
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="chgrp --preserve-root"
alias rmrf="sudo rm -rf"
# PACKAGES
alias install='sudo apt-get install'
alias update='sudo apt-get update'
alias search='apt_search'   # CUSTOM @ .BASH_FUNCTIONS
alias apt_show='apt show'
alias apt_search='apt-cache search'
###  ARCHIVES
alias peek_tar="tar -tvf"
alias peek_tar_gz="tar -ztvf"
alias peek_tar_bz2="ta -jtvf"
### NETWORKING
alias myip="dig +short http://myip.opendns.com @http://resolver1.opendns.com"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias scpresume='rsync --partial --progress --rsh=ssh' # Resume a broken scp transfer
###  LOGS  
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias syslog="tail -f /var/log/syslog"
alias kernlog="tail -f /var/log/kern.log"
###  APPLICATIONS  
# alias open="nohup nautilus . &"
alias open="nautilus --no-desktop ."
alias notes="nohup typora ~/00_Notes >/dev/null &"
## VAGRANT
alias vup="vagrant up --no-provision"
alias vstop="vagrant halt"
alias vkill="vagrant destroy"
alias vfile="cat Vagrantfile"
alias vconfig="cat Vagrantfile | grep 'vm.' | grep -v '^#' --color=always"
alias vssh="vagrant ssh"
alias vstat="vagrant status"
alias vlist="vagrant global-status"
alias vkillall="vboxmanage list runningvms | sed -r 's/.|\{(.*\}/|\1/' | xargs -L1 -I {} VBoxManage controlvm {} poweroff"
## GIT FUNCTIONS
alias gstat="git status"
alias gpull="git pull"
alias gadd="git add"
alias git_list="git help -a"  # OR git --help --all
## APACHE FUNCTIONS
alias web_restart="sudo service apache2 restart"
alias web_status="sudo service apache2 status"
alias serve="php -S localhost:8000 -t ."
## MYSQL
#alias export_db = "pname=PROJECT_NAME ; tstamp=$(date -d today +%y.%m.%d.%H%I%M%S) ; fname=$pname.$tstamp.sql ; dbpass=SECRET ; dbpath=/var/www/html/site_data/db_export ; mysqldump -udevL_per -pSECRETS $pname > $dbpath$fname"
#alias import_db = "mysql -udevL_per -pSECRETS < ~/site_date/db_source/$(get_the_latest.sql)" # FIST IMPORT WITH CREATE / DROP IF EXISTS
#alias update_db_source = "" #SET DB_SOURCE TO CURRENT LATEST DB EXPORT
#alias update_db = "" #TAKE NEWEST FILE FROM DB SOURCE FOLDER
#alias reset_db_dev = "" # NUKE IT, RESET TO LATEST DB_SOURCE
## PROJECT TOOLS
alias buildtools="git clone \"git@gitlab.hq.sfp.net:sfp/build-tools.git\"" # COPY BUILD TOOLS LIBRARY
alias laravel="php artisan"
#alias find_notes="find ~/00Dev/notes -type f -exec grep -H --color=always --no-messages --no-filename --before-context=1 --after-context=1 'find' {} \;"
#alias note='open /Applications/TextEdit.app'
#################
# CUSTOM SCRIPTS 
alias goto='source ~/bin/goto'
alias goto-list='cat ~/bin/goto | grep -F #*#'
alias dmesg1="dmesg --decode --facility=kern,user,daemon,syslog --syslog -t --time-format=iso --userspace --human"
#### NETWORKING
## SOCKETS 
alias show_sockets_short="ss -4ltdn"
alias show_sockets_long="sudo ss --processes --numeric --udp --ipv4 --listening --tcp --unix"
alias short_socks="show_sockets_short"
alias long_socks="show_sockets_long"
alias high_ports="sudo lsof -iTCP -i :8000-10000"
alias low_ports="sudo lsof -i :22-100"
## JOURNAL AND LOGS  
alias quick_log="journalctl --merge --reverse --catalog --no-hostname --utc --output-fields CODE_FILE,CODE_LINE,PRIORITY,MESSAGE"
alias short_log="journalctl --merge --reverse --catalog --no-hostname --utc --output-fields="CODE_FILE","CODE_LINE","PRIORITY","MESSAGE" --output short"
alias micro_log="journalctl --merge --reverse --catalog --no-hostname --output cat"
alias log_stream_s="journalctl --merge --catalog --no-hostname --output cat --follow"
alias log_stream_l="--merge --follow--catalog --no-hostname --all"
alias journal_files="journalctl --field=CODE_FILE --root=/"
alias journal_size="journalctl --disk-usage"
alias journal_shrink="journalctl --vacuum-size=512M"
alias journal_head="journalctl --header"
alias dbus_warning_log="journalctl /usr/bin/dbus-daemon --no-hostname --output cat --priority 4"
alias screenfix='echo -e "\033c"'


