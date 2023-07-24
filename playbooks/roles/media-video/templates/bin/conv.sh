#!/bin/bash

encode(){
    FILE="${1}"
    VID="$(echo ${FILE%.*})"
    VC=$(mediainfo --Inform="Video;%Format%" "${FILE}")
    AC=$(mediainfo --Inform="Audio;%Format%" "${FILE}")
    #echo ${FILE} $VC $AC
    case $VC in
        VP9)
            echo "To Webm"
            ffmpeg -i "${VID}.mkv" -c:v copy -c:a opus -strict -2 -threads 8 -f webm -y "${VID}.webm"
            rm -f "${VID}.mkv" 
            ;;
        AVC)
            echo "To MP4"
            ffmpeg -i "${VID}.mkv" -c:v copy -c:a aac -q:a 4 -strict -2 -f mp4 -y "${VID}.mp4"
            rm -f "${VID}.mkv" 
            ;;
        *)
            echo "Other"
            ;;
    esac
}

export -f encode
find . -type f -name "*mkv" -exec bash -c 'encode "${0}"' "{}" \;

