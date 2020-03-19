TOOLS_DIR=$(dirname `command -v $0`)
FILE=$1
FILE_TYPE=$2
if [ "${FILE_TYPE:6:9}" == "png" ];then
    zsteg $FILE
    pngcheck $FILE
    if [ $? != 0 ];then
        ${TOOLS_DIR}/tool/crc_repair.py $FILE -t height -r
        ${TOOLS_DIR}/tool/crc_repair.py $FILE -t width -r
    fi
fi
if [ "${FILE_TYPE:6:10}" == "jpeg" ];then
    stegdetect $FILE
fi
echo "OCR字符识别："
tesseract $FILE stdout
echo "OCR识别结果仅供参考"
