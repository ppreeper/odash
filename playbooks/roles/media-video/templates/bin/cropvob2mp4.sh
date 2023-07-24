#!/bin/bash
echo $1 $2
RIPDIR='/opt/rips'
DISC=$1
TITLE=$2
stdbuf -oL `ffmpeg -i $RIPDIR/$DISC.$TITLE.vob -t 300 -vf cropdetect -f null - 2>&1 | awk '/crop/ { print $NF }'` | {
while IFS= read -r crop
do
	echo $crop
done
}
#CROPLIST=$(ffmpeg -i $RIPDIR/$DISC.$TITLE.vob -t 300 -vf cropdetect -f null - 2>&1 | awk '/crop/ { print $NF }')
count=0
width=720
height=480
xx=0
yy=0
for crop in $CROPLIST
do
    ww=`echo $crop | awk '{split($0,a,"="); print a[2]}' | awk '{split($0,a,":"); print a[1]}'`
    if [[ $ww -lt "720" ]] && [[ $ww -ge "640" ]]
    then
        width=$ww
    fi
    hh=`echo $crop | awk '{split($0,a,"="); print a[2]}' | awk '{split($0,a,":"); print a[2]}'`
    if [[ $hh -lt "480" ]] && [[ $hh -ge "306" ]]
    then
        height=$hh
    fi
    x=`echo $crop | awk '{split($0,a,"="); print a[2]}' | awk '{split($0,a,":"); print a[3]}'`
    if [[ $x -gt "0" ]] && [[ $x -le "40" ]]
    then 
        xx=$x
    fi

    y=`echo $crop | awk '{split($0,a,"="); print a[2]}' | awk '{split($0,a,":"); print a[4]}'`
    if [[ $y -gt "0" ]] && [[ $y -le "87" ]]
    then 
        yy=$y
    fi
    count=$((count + 1))
done
CROP="crop="$width":"$height":"$xx":"$yy
echo vob2mp4 $1 $title $CROP
