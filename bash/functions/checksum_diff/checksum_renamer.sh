#!/bin/bash

# FIND FILES AND RENAME THEM
# sed /s --> substitue
# s/SEARCH/REPLACE/

mkdir results ;
touch results.json
echo "[" >> results.json ;
find ./ -type f | while read FILE ; do
  hash=$(shasum $FILE) ;
  newfile="$(echo ${hash} | sed -e 's/\//__/g;s/\s//g')" ;
    
  json="{hash:\"$(echo ${hash} | sed -e 's/\//__/g;s/\s/\"\,name:\"/g')\"}," ;
  echo $json >> results.json
  echo "$FILE -> ./results/$newfile" ;
  cp $FILE ./results/$newfile ;  



done
echo "]" >> results.json ;




 
