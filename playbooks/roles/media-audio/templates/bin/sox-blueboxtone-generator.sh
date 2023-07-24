#!/bin/bash
for freq in 700 900 1100 1300 1500 1700; do
 sox -c1 -r8000 -n -t wav - synth 0.3 sin $freq vol 0.7 > $freq.wav
 done

sox -m  700.wav 900.wav bb.1.wav
sox -m  700.wav 1100.wav bb.2.wav
sox -m  900.wav 1100.wav bb.3.wav
sox -m  700.wav 1300.wav bb.4.wav
sox -m  900.wav 1300.wav bb.5.wav
sox -m 1100.wav 1300.wav bb.6.wav
sox -m  700.wav 1500.wav bb.7.wav
sox -m  900.wav 1500.wav bb.8.wav
sox -m 1100.wav 1500.wav bb.9.wav
sox -m 1300.wav 1500.wav bb.0.10.wav
sox -m  700.wav 1700.wav bb.11.st3.wav
sox -m  900.wav 1700.wav bb.12.st2.wav
sox -m 1100.wav 1700.wav bb.kp.wav
sox -m 1300.wav 1700.wav bb.kp.st2.wav
sox -m 1500.wav 1700.wav bb.st.wav

