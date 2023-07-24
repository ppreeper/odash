#!/bin/bash
mapa=0
f=${1}

if [ "${2}" != "" ]; then
    mapa=${2}
fi

ffmpeg -i $f -map 0:v -c:v huffyuv -an -y $f.v.mkv
ffmpeg -i $f -map 0:a:${mapa} -vn -c:a flac -ac 2 -strict -2 -y $f.a.flac
ffmpeg -i $f.v.mkv -i $f.a.flac -c:v copy -c:a copy -y $f.mkv
