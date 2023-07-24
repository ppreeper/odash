#!/bin/bash
cat ${1}.input
echo ffmpeg -f concat -i ${1}.input -c:v copy -c:a copy -strict -2 -f mp4 -y ${1}.mp4
ffmpeg -f concat -i ${1}.input -c:v copy -c:a copy -strict -2 -f mp4 -y ${1}.mp4
