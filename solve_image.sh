FILE=$1
FILE_TYPE=$2
if [ "${FILE_TYPE:6:9}" == "png" ];then
    zsteg $FILE
    pngcheck $FILE
fi
if [ "${FILE_TYPE:6:10}" == "jpeg" ];then
    stegdetect $FILE
fi

