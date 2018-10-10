#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 directory_name"
  exit
fi

WORK_DIR=$1/tmp_frames
mkdir $WORK_DIR

cp $(ls $1/*.jpg | head -n1) $WORK_DIR/previous.jpg

pushd $WORK_DIR

j=0
for f in ../*.jpg
do
	for i in {0..4}
	do
		let "j+=1"
		composite -blend $((i*25)) $f previous.jpg -matte blend_$j.jpg
	done
	cp $f previous.jpg
done

popd

ffmpeg -r "60" -i $WORK_DIR/blend_%d.jpg -qscale 6 $1.mp4
rm -rf $WORK_DIR
