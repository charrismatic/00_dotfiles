#!/bin/bash
# @Matt Harris
# 2017-04-13
# LAST UPDATED: 1/26/2018, 4:16:56 PM
# A SMALL SCRIPT TO MOVE THROUGH YOUR MOVE COMMMON PLACES QUICLY
# This script should not be run directly, source it from your .bashrc,
# by adding this line: . ~/bin/goto.sh
# The file belongs in your home/bin/ folder <~/bin/.goto.sh>
#######
#  Usage: goto <aliasname>
#  Notes: add rows to the list to add to your quick move locations.
#  TODO:  Connect this with a constructor to manage the list throgh CLI or database
#         I COULD USE THE ENV AND EXPORT TO TO KEEP TRACK OF MY LINKS...
#  TODO:  DO SOME TESTING FOR EDGES AND BAD BEHAVIOR
# TODO:  USE THE HEREDOC << OR EOF TO MODIFY THE LIST FROM A COMMAND

#arg1=$1
#unset -f goto
#function goto() {
    mark=$1
    msg="QuickMove to $mark folder"
    echo "$msg"
    fail="$mark does not exist try again"
        case $mark in
        web) output=/var/www/html ;;          #*#
        www) output=/var/www ;;               #*#
       logs) output=/var/log/ ;;              #*#
     apache) output=/etc/apache2 ;;           #*#
    web_log) output=/var/log/apache2 ;;       #*#
       home) output=~/ ;;                     #*#
        dev) output=~/00_dev ;;               #*#
      notes) output=~/00_Notes ;;             #*#
       dots) output=~/00_Dotfiles ;;          #*#
       prof) output=~/00_Profiles ;;          #*#
      downl) output=~/Downloads ;;            #*#
       proj) output=/data/projects ;;         #*#
       serv) output=/data/projects/sandbox/mount/ma.ttharr.is  ;;  #*#
      projC) output=/data/projects/Chrome_Extensions/  ;; #*#
        ice) output=/glacier ;;               #*#
          *) output=$fail ;;                  #*#
        esac
#   echo "$output"
#}

cd "$output"
#export -f goto
#exit 0
