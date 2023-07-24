#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import time
import argparse
import subprocess

year = 365*24*60*60

def main():
    parser = argparse.ArgumentParser("uptime calculator")
    parser.add_argument("-p",action="store",dest="periods",help="patching periods",default=12)
    parser.add_argument("--hour",action="store",dest="hours",help="hour",default=0)
    parser.add_argument("--minute",action="store",dest="minutes",help="minute",default=0)
    parser.add_argument("--second",action="store",dest="seconds",help="second",default=0)
    args = parser.parse_args()
    print(year,args)
    downtime = (int(args.hours)*60*60+int(args.minutes)*60+int(args.seconds))
    periods = int(args.periods)
    print((100*(year - (downtime*periods)))/year)
    return

if __name__ == "__main__":
        main()
