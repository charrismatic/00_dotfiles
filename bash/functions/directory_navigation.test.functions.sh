#####################################################################

Inspired by the question and answers here, I added the lines below to my ~/.bashrc file.

With this you have a favdir command (function) to manage your favorites and a autocompletion function to select an item from these favorites.

# ---------
# Favorites
# ---------

__favdirs_storage=~/.favdirs
__favdirs=( "$HOME" )

containsElement () {
    local e
    for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
    return 1
}

function favdirs() {

    local cur
    local IFS
    local GLOBIGNORE

    case $1 in
        list)
            echo "favorite folders ..."
            printf -- ' - %s\n' "${__favdirs[@]}"
            ;;
        load)
            if [[ ! -e $__favdirs_storage ]] ; then
                favdirs save
            fi
            # mapfile requires bash 4 / my OS-X bash vers. is 3.2.53 (from 2007 !!?!).
            # mapfile -t __favdirs < $__favdirs_storage
            IFS=$'\r\n' GLOBIGNORE='*' __favdirs=($(< $__favdirs_storage))
            ;;
        save)
            printf -- '%s\n' "${__favdirs[@]}" > $__favdirs_storage
            ;;
        add)
            cur=${2-$(pwd)}
            favdirs load
            if containsElement "$cur" "${__favdirs[@]}" ; then
                echo "'$cur' allready exists in favorites"
            else
                __favdirs+=( "$cur" )
                favdirs save
                echo "'$cur' added to favorites"
            fi
            ;;
        del)
            cur=${2-$(pwd)}
            favdirs load
            local i=0
            for fav in ${__favdirs[@]}; do
                if [ "$fav" = "$cur" ]; then
                    echo "delete '$cur' from favorites"
                    unset __favdirs[$i]
                    favdirs save
                    break
                fi
                let i++
            done
            ;;
        *)
            echo "Manage favorite folders."
            echo ""
            echo "usage: favdirs [ list | load | save | add | del ]"
            echo ""
            echo "  list : list favorite folders"
            echo "  load : load favorite folders from $__favdirs_storage"
            echo "  save : save favorite directories to $__favdirs_storage"
            echo "  add  : add directory to favorites [default pwd $(pwd)]."
            echo "  del  : delete directory from favorites [default pwd $(pwd)]."
    esac
} && favdirs load

function __favdirs_compl_command() {
    COMPREPLY=( $( compgen -W "list load save add del" -- ${COMP_WORDS[COMP_CWORD]}))
} && complete -o default -F __favdirs_compl_command favdirs

function __favdirs_compl() {
    local IFS=$'\n'
    COMPREPLY=( $( compgen -W "${__favdirs[*]}" -- ${COMP_WORDS[COMP_CWORD]}))
}

alias _cd='cd'
complete -F __favdirs_compl _cd




Within the last two lines, an alias to change the current directory (with autocompletion) is created. With this alias (_cd) you are able to change to one of your favorite directories. May you wan't to change this alias to something which fits your needs.

With the function favdirs you can manage your favorites (see usage).

$ favdirs 
Manage favorite folders.

usage: favdirs [ list | load | save | add | del ]

  list : list favorite folders
  load : load favorite folders from ~/.favdirs
  save : save favorite directories to ~/.favdirs
  add  : add directory to favorites [default pwd /tmp ].
  del  : delete directory from favorites [default pwd /tmp ].




#####################################################################
#Directory bookmarking for bash
#Thanks guys for the feedback however I created my own simple shell script (feel free to modify/expand it)

function cdb() {
    USAGE="Usage: cdb [-c|-g|-d|-l] [bookmark]" ;
    if  [ ! -e ~/.cd_bookmarks ] ; then
        mkdir ~/.cd_bookmarks
    fi

    case $1 in
        # create bookmark
        -c) shift
            if [ ! -f ~/.cd_bookmarks/$1 ] ; then
                echo "cd `pwd`" > ~/.cd_bookmarks/"$1" ;
            else
                echo "Try again! Looks like there is already a bookmark '$1'"
            fi
            ;;
        # goto bookmark
        -g) shift
            if [ -f ~/.cd_bookmarks/$1 ] ; then 
                source ~/.cd_bookmarks/"$1"
            else
                echo "Mmm...looks like your bookmark has spontaneously combusted. What I mean to say is that your bookmark does not exist." ;
            fi
            ;;
        # delete bookmark
        -d) shift
            if [ -f ~/.cd_bookmarks/$1 ] ; then 
                rm ~/.cd_bookmarks/"$1" ;
            else
                echo "Oops, forgot to specify the bookmark" ;
            fi    
            ;;
        # list bookmarks
        -l) shift
            ls -l ~/.cd_bookmarks/ ;
            ;;
         *) echo "$USAGE" ;
            ;;
    esac
}
		INSTALL
1./ create a file ~/.cdb and copy the above script into it.
2./ in your ~/.bashrc add the following
if [ -f ~/.cdb ]; then
    source ~/.cdb
fi 
3./ restart your bash session
		USAGE
1./ to create a bookmark
$cd my_project
$cdb -c project1
2./ to goto a bookmark
$cdb -g project1
3./ to list bookmarks
$cdb -l 
4./ to delete a bookmark
$cdb -d project1
5./ where are all my bookmarks stored?
$cd ~/.cd_bookmarks

#####################################################################

Also, have a look at CDPATH
A colon-separated list of search paths available to the cd command, similar in function to the $PATH variable for binaries. The $CDPATH variable may be set in the local ~/.bashrc file.

ash$ cd bash-doc
bash: cd: bash-doc: No such file or directory

bash$ CDPATH=/usr/share/doc
bash$ cd bash-doc
/usr/share/doc/bash-doc

bash$ echo $PWD
/usr/share/doc/bash-doc
and

cd -
It's the command-line equivalent of the back button (takes you to the previous directory you were in).
#####################################################################

In bash script/command,
you can use pushd and popd

pushd

Save and then change the current directory. With no arguments, pushd exchanges the top two directories.
Usage

cd /abc
pushd /xxx    <-- save /abc to environment variables and cd to /xxx
pushd /zzz
pushd +1      <-- cd /xxx
popd is to remove the variable (reverse manner)
Syntax
      popd [+N | -N] [-n]

Key
   +N   Remove the Nth directory (counting from the left of the list 
        printed by dirs), starting with zero. 

   -N   Remove the Nth directory (counting from the right of the list 
        printed by dirs), starting with zero. 

   -n   Suppress the normal change of directory when removing directories from 
        the stack, so that only the stack is manipulated. 






#####################################################################
Autojump: a cd command that learns
https://github.com/wting/autojump/wiki

autojump is included in the following distro repositories, please use relevant package management utilities to install (e.g. yum, apt-get, etc):

Debian testing/unstable, Ubuntu, Linux Mint

All Debian-derived distros require manual activation for policy reasons, please see /usr/share/doc/autojump/README.Debian.

RedHat, Fedora, CentOS (install autojump-zsh for zsh, autojump-fish for fish, etc.)




MANUAL
Grab a copy of autojump:
git clone git://github.com/joelthelion/autojump.git
Run the installation script and follow on screen instructions.

cd autojump
./install.py or ./uninstall.py
KNOWN ISSUES

autojump does not support directories that begin with -.

For bash users, autojump keeps track of directories by modifying $PROMPT_COMMAND. Do not overwrite $PROMPT_COMMAND:

export PROMPT_COMMAND="history -a"
Instead append to the end of the existing $PROMPT_COMMAND:

export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"








#####################################################################




Bashmarks - directory bookmarks for the shell
https://github.com/huyng/bashmarks
Bashmarks is a commandline utility that allows you to save and jump to commonly used directories.

github repository

installation

git clone git://github.com/huyng/bashmarks.git
cd bashmarks && make install
add source ~/.local/bin/bashmarks.sh from within your ~.bash_profile or ~/.bashrc file

shell commands

s <bookmark_name> - Saves the current directory as "bookmark_name"
g <bookmark_name> - Goes (cd) to the directory associated with "bookmark_name"
p <bookmark_name> - Prints the directory associated with "bookmark_name"
d <bookmark_name> - Deletes the bookmark
l                 - Lists all available bookmarks
example usage

$ cd /var/www/
$ s webfolder
$ cd /usr/local/lib/
$ s locallib
$ l
$ g web<tab>
$ g webfolder
where bashmarks are stored

All of your directory bookmarks are saved in a file called “.sdirs” in your HOME directory.

