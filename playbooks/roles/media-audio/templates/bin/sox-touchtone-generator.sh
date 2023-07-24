#!/bin/bash
for freq in 697 770 852 941 1209 1336 1477 1633; do
 sox -c1 -r8000 -n -t wav - synth 0.3 sin $freq vol 0.7 > $freq.wav
 done

sox -m  697.wav 1209.wav dtmf.1.wav
sox -m  697.wav 1336.wav dtmf.2.wav
sox -m  697.wav 1477.wav dtmf.3.wav
sox -m  697.wav 1633.wav dtmf.A.wav
sox -m  770.wav 1209.wav dtmf.4.wav
sox -m  770.wav 1336.wav dtmf.5.wav
sox -m  770.wav 1477.wav dtmf.6.wav
sox -m  770.wav 1633.wav dtmf.B.wav
sox -m  852.wav 1209.wav dtmf.7.wav
sox -m  852.wav 1336.wav dtmf.8.wav
sox -m  852.wav 1477.wav dtmf.9.wav
sox -m  852.wav 1633.wav dtmf.C.wav 
sox -m  941.wav 1209.wav dtmf.star.wav
sox -m  941.wav 1336.wav dtmf.0.wav
sox -m  941.wav 1477.wav dtmf.pnd.wav 
sox -m  941.wav 1633.wav dtmf.D.wav 

