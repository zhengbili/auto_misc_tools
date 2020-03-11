ARCH=$(dpkg --print-architecture)
#ARCH=amd64

if [ $(command -v binwalk) ];then
    echo "binwalk已安装"
else
    echo "binwalk未安装，准备安装……"
    sudo apt install -y binwalk
fi
if [ $(command -v gem) ];then
    echo "gem已安装"
else
    echo "gem未安装，准备安装……"
    sudo apt install -y gem
fi
if [ $(command -v zsteg) ];then
    echo "zsteg已安装"
else
    echo "zsteg未安装，准备安装……"
    gem install zsteg
fi
if [ $(command -v stegdetect) ];then
    echo "stegdetect已安装"
else
    echo "stegdetect未安装，准备安装……"
    wget http://old-releases.ubuntu.com/ubuntu/pool/universe/s/stegdetect/stegdetect_0.6-6_${ARCH}.deb -O /tmp/stegdetect.deb
    sudo apt install /tmp/stegdetect.deb
    #rm /tmp/stegdetect.deb
fi
#wget ***
#echo $?
