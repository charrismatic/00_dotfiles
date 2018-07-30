#!/bin/bash

function extract () {
 
  function _print_info () {
      printf "      
      extract - automatically uncompress archives based on file extension
     
      $ extract [FILE]
      
      \t.tar.bz2 \t \E[1mtar xvjf \033[0m [FILE]
      \t.tar.gz  \t \E[1mtar xvzf \033[m [FILE]
      \t.bz2     \t \E[1mbunzip2 \033[m [FILE]
      \t.rar     \t \E[1munrar x \033[m [FILE]
      \t.gz      \t \E[1mgunzip \033[m [FILE]
      \t.tar     \t \E[1mtar xvf \033[m [FILE]
      \t.tbz2    \t \E[1mtar xvjf \033[m [FILE]
      \t.tgz     \t \E[1mtar xvzf \033[m [FILE]
      \t.zip     \t \E[1munzip \033[m [FILE]
      \t.Z       \t \E[1muncompress \033[m [FILE]
      \t.7z      \t \E[1m7z x \033[m [FILE]
      \n
      
    \E[1m\E[4mCore operations\E[24m\033[m
    
    --concatenate     append tar files to an archive
    --create          create a new archive
    --diff            find differences between archive and file system
    --delete          delete from the archive 
    --append          append files to the end of an archive
    --list            list the contents of an archive
    --update          only append files newer than copy in archive
    --extract         extract files from an archive


      
      Extra Options 
        --interactive
        --verbose
        --newer-mtime=DATE   
        --newer=DATE-OR-FILE
        --after-date=DATE-OR-FILE
        --preserve-order
        --same-order
        --same-owner
        --preserve-permissions
        --mtime=DATE-OR-FILE      set mtime for added files from DATE-OR-FILE
        --touch                   don't extract file modified time
        --overwrite               overwrite existing files when extracting
        --keep-old-files          don't replace existing files when extracting treat them as errors
        --keep-directory-symlink  preserve existing symlinks to directories when extracting
        --keep-newer-files        don't replace existing files that are newer than their archive copies
        --no-overwrite-dir        preserve metadata of existing directories
        --one-top-level[=DIR]     create a subdirectory to avoid having loose files extracted
        --overwrite               overwrite existing files when extracting
        --overwrite-dir           overwrite metadata of existing directories when
        --list                 list the contents of an archive
        --extract       extract files from an archive

      "
  }

  function _extract () {
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
  }

  # PARAMETER 1 IS NULL
  if [ -z "$1" ]; then
    _print_info

  # EXTRACT ANY ARCHIVE
  elif [ -f $1 ] ; then
    _extract "$1"
 
  else
      echo "'$1' is not a valid file!"
  fi
  
}

#unset _print_info
#unset _extract

#unset extract 
#alias extract="~/lib/bash/functions/archive_tools.sh"

