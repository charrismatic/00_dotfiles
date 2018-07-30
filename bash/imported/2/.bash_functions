
### FIND IN FROM 
#  FIND A PATTERN IN FILES FOUND FROM DATE 
function find_in_from () {
 PATTERN=$1 

 sudo find /var/log/ -ctime -2 -type f -readable -exec grep --color=auto -ir -e "$1" -- {} \; 
}




# LESS, CAT, TAIL
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# PROCESSES
function psgrep () {
  ps -ef | {
     read -r;
     echo "$REPLY";
     grep --color=auto "$@"
  }
}


###############    HELPERS -- FUNCTION ALIASES ###################
# SHOW FOLDER CONTENTS WHEN CHANGING DIRECTORY
function cd () {
  builtin cd $1
  ls -l --human-readable --time-style="+%m-%d %H:%M" --no-group --sort=time  --reverse --group-directories-first --ignore-backups

 # ls -dC */
}


# GO BACK TO THE LAST DIRECTORY
function  back () {
  last_dir="$(ls -Frt | grep '/$' | tail -n1)"
  if [ -d "$last_dir" ]; then
     cd "$last_dir"
  fi
}


# Where/What is this binary? Shows extended ls output
function what () {
    which $1 | xargs ls -la
}


################   APPLICATIONS   ###################
# Google X
# function @google {
#     open "https://google.com/search?q=$*"
# }


# Open files in Chrome browser
# function chrome() {
#     open -a "Google Chrome" "$1"
# }

# EXTRACT ANY ARCHIVE
function extract () {
   if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)    echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }


# REMIND TIMER
 # usage: remindme <time> <text>
function remindme () {
  sleep $1 && zenity --info --text "$2" &
}


# FIND IN NOTES
function get_notes() {
  find ~/00_Notes -type f -exec grep -i -H "${1}" {} \;
}


# TODO: USING THE OR COMMAND IN FIND
#list="$(find /home/user/Desktop -name '*.bmp' -o -name '*.txt')"

#SHORTCUT FOR FIND COMMAND
function _find () {
  PATTERN="$1"
  cmd="find . -iname $PATTERN";
  echo "$cmd";
  exec_cmd="$($cmd)";
  echo "$exec_cmd";

}
alias f='_find'


# EXECUTE A COMMAND ON LIST OF FILES AGAINST A PATTERN
function find_exec() {
  find ./ -type f -iname '${1}' -exec ${@:2}  {} \; ;
}


# FIND STINGS IN FILES
function find_in() {
  path=$1
  find="$2"
  grep="$3"

  cmd='find $path -iname $find -exec grep -H $grep "{}" \;'
  $cmd
}

# FIND STRINGS IN FILES
function find_here() {
  find="$1"
  grep="$2"

  find . -name $find -exec grep -H $grep "{}" \;
}



# FIND AND TRIM BINARY CHARACTERS FROM FILES
function trim_bin_chars () {
  cat "$1" | tr -cd '\11\12\40-\176'
  printf "\n" \;
}

function find_trim_bin_chars () {
  find ./ -type f -printf '%p' -exec cat {} \; | tr -cd '\11\12\40-\176'  |  grep -i btc
}



function grab {
  find="$1"

  find . -iname $find \;
}

# TOP 20 FOLDERS FROM PATH  BY TOTAL SIZE
function biggest () {
  du --block-size=M ${1} | sort -n -r | head -n 20 \;
}

 ########################   HISTORY      #########################
 # - AUTO-SEARCH HISTORY -- CTRL + R
 # - SUDO THE PREVIOUS COMMAND -- sudo !!
 # ARCHIVE AND SORT CURRENT HISTORY THEN RESET THE HISTORY FILE
function backup_history () {
  profile=$(hostname)
  stamp=$(date -d today +%y.%m.%d.%H%I%M%S)
  path=~/00Dev/env/bash.config/save_history
  output_file=.bash_history.$stamp.$profile

  echo "archiving command history..."
  echo $output_file

  cat ~/.bash_history | grep -x '.\{4,\}' | sort --ignore-case --unique --merge --dictionary-order > ~/.bash_history.tmp

  wait
  mv ~/.bash_history.tmp $path/$output_file
  wait

  history -c && history -w

  echo "done" \;
}

function projectinit () {
  # Make new directory
  mkdir assets
  # Download template files
  wget https://raw.github.com/colmjude/Projectus/master/_js/script.js -O assets/script.js
  wget https://raw.github.com/colmjude/Projectus/master/_naked.html -O index.html
  # INSTALL PACKAGES
  #npm install
  # RUN GULP
  #gulp
}


# SEARCH APT-CACHE WITH HIGHLIGHTING
function apt_search () {
  SEEK=$1
  apt-cache search $SEEK | grep --color=always $SEEK
}


# FIND JAVASCRIPT FILES IN FOLDER, UN-MINIFY THEM, THEN GREP FOR A STRING

function fix_js_find_in_files() {
  SEARCH=$1

  for FILENAME in ./*.js; do
    echo $FILENAME
    printf "\n"
    cat $FILENAME | js-beautify | grep -i "$SEARCH"
  done
}


function fix_js_in_folder() {
  #  cat *.js | js-beautify -s 2 --brace-style expand --space-after-anon-function --unescape-strings --good-stuff 
  SEARCH=$1
  OUTPATH=./cleaned/

  for FILENAME in ./*.js; do
    echo $FILENAME
    printf "\n"
    printf "----------------"
    cat $FILENAME | js-beautify -s 2 --brace-style expand --space-after-anon-function --unescape-strings --good-stuff -o $OUTPATH/$FILENAME 
  done
}
