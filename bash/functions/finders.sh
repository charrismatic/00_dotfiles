
# FIND STRINGS IN FILES
function find_here() {
  find="$1"
  grep="$2"

  find . -name $find -exec grep -H $grep "{}" \;
}


### FIND IN FROM
#  FIND A PATTERN IN FILES FOUND FROM DATE
function find_in_from () {
 PATTERN=$1

 sudo find /var/log/ -ctime -2 -type f -readable -exec grep --color=auto -ir -e "$1" -- {} \;
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
  TARGET="$1"
  find . -iname $TARGET \;
}

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


