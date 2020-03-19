#!/bin/env python3
import argparse
import binascii
import struct

parser = argparse.ArgumentParser()
parser.add_argument('file',help='png文件路径')
parser.add_argument('-t','--type',default='height',choices=['width','height'],help='爆破方式')
parser.add_argument('-r','--repair',action='store_true',help='修复原文件')
args = parser.parse_args()
path = args.file
type = args.type

if type=='width':w=16
elif type=='height':w=20

f=open(path,"rb")
misc=f.read()
f.close()

l=struct.unpack('>I',misc[8:12])[0]
crc=struct.unpack('>I',misc[16+l:20+l])[0]

for i in range(2048):
    data=misc[12:w]+struct.pack('>I',i)+misc[w+4:16+l]
    crc32=binascii.crc32(data)&0xffffffff
    if crc32==crc:
        print('%s:%d像素'%(type,i))
        break

if args.repair:
    f=open(path+'.bak','wb')
    f.write(misc)
    f.close()
    f=open(path,'wb')
    f.write(misc[:w]+struct.pack('>I',i)+misc[w+4:])
    f.close()
    print('%s已修复'%type)
