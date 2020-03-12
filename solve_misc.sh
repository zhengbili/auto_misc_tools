TOOLS_DIR=$(dirname `command -v $0`)
FILE=$1
FILE_TYPE=$(file -b --mime-type $1)
echo "特殊字符串："
STRING_OUTPUT=/tmp/${RANDOM}.txt
strings $FILE > $STRING_OUTPUT
cat $STRING_OUTPUT|grep -i -E "flag|key|hint|secret"
echo "文件头："
file $FILE
echo "文件信息："
exiftool $FILE
echo "文件偏移信息："
binwalk $FILE
if [ "${FILE_TYPE:0:5}" == "image" ];then
    $TOOLS_DIR/solve_image.sh $FILE $FILE_TYPE
elif [ "${FILE_TYPE:0:4}" == "text" ];then
    $TOOLS_DIR/solve_text.sh $FILE
fi
echo "可见字符分析："
$TOOLS_DIR/solve_text.sh $STRING_OUTPUT
