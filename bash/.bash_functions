## BASH FUNCTIONS
# ---
# Notes:
# - AUTO-SEARCH HISTORY -- CTRL + R
# - SUDO THE PREVIOUS COMMAND -- sudo !!

# LESS, CAT, TAIL
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# GREP PROCESSES
# ---
function psgrep() {
  ps -ef | {
     read -r;
     echo "$REPLY";
     grep --color=auto "$@"
  }
}

# SHOW FOLDER CONTENTS WHEN CHANGING DIRECTORY
function cd() {
  builtin cd $1
 ls -ltr
 # ls -dC */
}

# GO BACK TO THE LAST DIRECTORY
function back() {
  last_dir="$(ls -Frt | grep '/$' | tail -n1)"
  if [ -d "$last_dir" ]; then
     cd "$last_dir"
  fi
}

# Where / What is this binary? Shows extended ls output
function what() {
    which $1 | xargs ls -la
}

# EXTRACT ANY ARCHIVE
function extract() {
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


# REMINDER TIMER
# usage:
# ```
# remindme <time> <text>
# ```
function remindme() {
  sleep $1 && zenity --info --text "$2" &
}

### FING - Find text in files
# find <dir> <pattern> <string>
function fing() {
  find "$1" -name "$2" -exec grep -H "$3" "{}" \;
}

# FIND IN NOTES
function get_notes() {
  find ~/00_notes -iname '*.note*' -exec grep -H "${1}" {} \;
}

## TODO: USING THE ALIAS OR COMMAND TO LIST SEARCH RESULTS
## function list() {
##   find "$1" -name "$2" -o -name
##   find "$1" -name '*$2' -o -name '$3')"
## }

#SHORTCUT FOR FIND COMMAND
function _find() {
  PATTERN="$1"
  cmd="find . -iname $PATTERN";
  echo "$cmd";
  exec_cmd="$($cmd)";
  echo "$exec_cmd";

}
alias f='_find'


# EXECUTE A COMMAND ON LIST OF FILES AGAINST A PATTERN
function find_exec() {
 # -o   OR
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
function trim_bin_chars() {
  cat "$1" | tr -cd '\11\12\40-\176'
  printf "\n" \;
}

function find_trim_bin_chars() {
  find ./ -type f -printf '%p' -exec cat {} \; | tr -cd '\11\12\40-\176'  |  grep -i btc
}


function grab() {
  find="$1"

  find . -iname $find \;
}

# TOP 20 FOLDERS FROM PATH  BY TOTAL SIZE
function biggest() {
  du --block-size=M ${1} | sort -n -r | head -n 20 \;
}

## HISTORY
# ---
# ARCHIVE AND SORT CURRENT HISTORY THEN RESET THE HISTORY FILE
function backup_history() {
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
