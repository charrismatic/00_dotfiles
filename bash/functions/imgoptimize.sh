DIRECTORY = optimzed
if [ ! -d "$DIRECTORY" ]; then
  mkdir optimized
fi

for f in *.png
do
	echo "${f%%.*}"
	convert $f -sample 1920x -quality 80 ./optimized/"${f%%.*}".jpg ; done
done
