#!/bin/env python3
import os
import zxing
import argparse

#命令行输入参数处理
parser = argparse.ArgumentParser()
parser.add_argument('image',help='图片文件路径')

#获取参数
args = parser.parse_args()
file = args.image
if not os.path.exists(file):
    raise Exception('路径不存在！')
if not os.path.isfile(file):
    raise Exception('请使用文件！')
path,file=os.path.split(file)
if path!='':
    os.chdir(path)

#识别二维码
qr=zxing.BarCodeReader()
try:
    print(qr.decode(file).raw)
except:
    print('不支持的文件格式！')
