#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import eyed3
import argparse
import re

us = re.compile(r' ')
sq = re.compile(r"'")
dq = re.compile(r'""')
ex = re.compile(r"!")
colon = re.compile(r":")
semicolon = re.compile(r";")
question = re.compile(r'\?')

parser = argparse.ArgumentParser()
parser.add_argument("filename")

args = parser.parse_args()

audiofile = eyed3.load(args.filename)
track_num = "%02d" % audiofile.tag.track_num[0]
disc_num = "%02d" % audiofile.tag.disc_num[0]
# print(disc_num)
title = us.sub('_', audiofile.tag.title)
title = sq.sub('', title)
title = dq.sub('', title)
title = ex.sub('', title)
title = colon.sub('', title)
title = semicolon.sub('', title)
title = question.sub('', title)
print("%s-%s.mp3" % (track_num, title))
new_filename = "{0}-{1}.mp3".format(track_num, title)
os.rename(args.filename, new_filename)
