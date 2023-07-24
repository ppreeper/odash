#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import hashlib,os,sys,sqlite3
conn = sqlite3.connect(':memory:')
curs = conn.cursor()

def dbInit(curs):
    curs.execute('''create table filetable (hashsum, filepath);''')
    return

def fileChecksum(filePath):
    try:
        hsh = ""
        with open(filePath, 'rb') as fh:
            m = hashlib.sha1()
            while True:
                data = fh.read(8192)
                if not data:
                    break
                m.update(data)
            hsh=m.hexdigest()
    except IOError:
        pass
    return hsh

def pall():
    for x in curs.execute(''' select hashsum,filepath from filetable '''):
        print(x)

def dups():
    for x in curs.execute('''select f.hashsum,f.filepath from filetable f join (select hashsum from filetable group by hashsum having count(hashsum)>1) s on f.hashsum = s.hashsum order by f.hashsum,f.filepath;'''):
        print(x)

def main(path):
    dbInit(curs)
    for dirpath, dirs, files in os.walk(path):
        for f in files:
            #print(f)
            y=os.path.abspath(dirpath)
            xfile=os.path.join(y,f)
            hashsum = fileChecksum(xfile)
            #print(hashsum, xfile)
            curs.execute(''' insert into filetable values (?,?) ''', (hashsum,xfile))
        conn.commit()
    dups()

if __name__ == "__main__":
    main(".")
