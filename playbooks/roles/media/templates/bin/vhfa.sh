#!/bin/bash
filelist=$(ls ${1}*vob | sort)
mapa=0
f=${1}

if [ "${2}" != "" ]; then
    mapa=${2}
fi

cat ${1}.input
echo ffmpeg -f concat -i ${1}.input -c:v copy -c:a copy -strict -2 -y ${1}.mkv
ffmpeg -f concat -i ${1}.input -c:v copy -c:a copy -strict -2 -y ${1}.mkv
