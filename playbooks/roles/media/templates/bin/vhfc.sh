#!/bin/bash
filelist=$(ls ${1}*vob | sort)
mapa=0
f=${1}

if [ "${2}" != "" ]; then
    mapa=${2}
fi

rm ${1}*.input

for f in $filelist
do
    ffmpeg -i $f -map 0:v -c:v huffyuv -an -y $f.v.mkv
    ffmpeg -i $f -map 0:a:${mapa} -vn -c:a flac -ac 2 -strict -2 -y $f.a.flac
    ffmpeg -i $f.v.mkv -i $f.a.flac -c:v copy -c:a copy -y $f.mkv
    echo "file '$f.mkv'" >> ${1}.input
done

cat ${1}.input
echo ffmpeg -f concat -i ${1}.input -c:v copy -c:a copy -strict -2 -y ${1}.mkv
ffmpeg -f concat -i ${1}.input -c:v copy -c:a copy -strict -2 -y ${1}.mkv
