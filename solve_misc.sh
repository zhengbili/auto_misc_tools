FILE=$1
echo "特殊字符串："
strings $FILE|grep -E "flag|key|hint"
echo "文件头："
file $FILE
echo "文件信息："
exiftool $FILE
echo "文件偏移信息："
binwalk $FILE
./solve_picture.sh $FILE
