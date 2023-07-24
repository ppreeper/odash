#!/bin/bash
filelist=$(ls ${1}*vob | sort)
mapa=0

if [ "${2}" != "" ]; then
    mapa=${2}
fi

rm ${1}*.input

for f in $filelist
do
    echo "file '$f.mp4'" >> ${1}.input
    echo ffmpeg -i $f -map 0:v -map 0:a:${mapa} -c:v copy -c:a copy -f mp4 -y $f.mp4
    ffmpeg -i $f -map 0:v -map 0:a:${mapa} -c:v copy -c:a flac -ac 2 -strict -2 -f mp4 -y $f.mp4
done

cat ${1}.input
echo ffmpeg -f concat -i ${1}.input -c:v copy -c:a copy -strict -2 -f mp4 -y ${1}.mp4
ffmpeg -f concat -i ${1}.input -c:v copy -c:a copy -strict -2 -f mp4 -y ${1}.mp4
