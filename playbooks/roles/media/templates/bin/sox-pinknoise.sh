#!/bin/bash
sox -t sl -r 48000 -c 2 /dev/zero -r 48000 -c 2 -b 16 ${HOME}/Music/pinknoise.wav synth 10:00 pink vol 0.6 fade q 10 10:00 10
