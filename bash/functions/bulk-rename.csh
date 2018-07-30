#!/bin/bash

# FIND FILES AND RENAME THEM
# sed /s --> substitue
# s/SEARCH/REPLACE/
find . -type f -name '*.jpg' | while read FILE ; do
    newfile="$(echo ${FILE} | sed -e 's/REPLACE/test/')" ;
    echo ${newfile} ;
    mv "${FILE}" "${newfile}" ;
done

