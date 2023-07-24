#!/bin/bash
mapa=0
f=${1}

if [ "${2}" != "" ]; then
    mapa=${2}
fi

echo ffmpeg -i $f -map 0:v -map 0:a:${mapa} -c:v copy -c:a copy -f mp4 -y $f.mp4
ffmpeg -i $f -map 0:v -map 0:a:${mapa} -c:v copy -c:a flac -ac 2 -strict -2 -f mp4 -y $f.mp4
