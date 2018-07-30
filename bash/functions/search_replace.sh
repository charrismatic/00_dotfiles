
------------------------
RENAME 
replace - a string-replacement utility


rename "s/SEARCH/REPLACE/g"  *.jpg


------------------------
SED - The stream editor 
http://www.grymoire.com/Unix/Sed.html

sed 

/s - for subtitue
's/SEARCH/REPLACE/'

-n	Classic
-e script	Classic
-f scriptfile	Classic
-e script (--expression=script)	GNU sed
-f scriptfile (--file=scriptfile)	GNU sed
-h (--help)	GNU sed
-n (--quiet --silent)	GNU sed
-V (--version)	GNU sed
-r (--regexp-extended)	GNU sed
-i[SUFFIX] (--in-place[=SUFFIX])	GNU sed
-l N (--line-length=N)	GNU sed
-b (--binary)	GNU sed
-s (--separate)	GNU sed
-z (--null-data)	GNU sed
-u (--unbuffered)	GNU sed
(--follow-symlinks)	GNU sed
(--posix)	GNU sed
-i SUFFIX	Mac OS X, FreeBSD
-a	Mac OS X, FreeBSD
-l	Max OS X, FreeBSD
-E	Mac OS X, FreeBSD
-r	FreeBSD
-I SUFFIX	FreeBSD




------------------------
EX 1:

for f in *.png; do mv "$f" "${f#image}"; done


EX 2:

find . -type f -name '*.jpg' | while read FILE ; do
    newfile="$(echo ${FILE} |sed -e 's/SEARCH/REPLACE/')" ;
    mv "${FILE}" "${newfile}" ;
done 


EX 3:
rename "s/SEARCH/REPLACE/g"  *.jpg



