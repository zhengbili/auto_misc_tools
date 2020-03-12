TOOLS_DIR=$(dirname `command -v $0`)
FILE=$PWD/$1
OUTPUT_DIR=/tmp/$RANDOM
unar -q $FILE -o $OUTPUT_DIR
for f in $(find $OUTPUT_DIR);do
    if [ -f $f ];then
        $TOOLS_DIR/solve_misc.sh $f
    fi
done
