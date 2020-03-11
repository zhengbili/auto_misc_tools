FILE=$1

if [ "$FILE_TYPE" == "png" ];then
    zsteg $FILE
    pngcheck $FILE
fi
