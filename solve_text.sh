FILE=$1
for line in $(grep -o -E "[A-Za-z0-9+/=]{8,}" $FILE);do
    echo $line|base64 -d|strings
done
for line in $(grep -i -o -E "[a-z2-7=]{8,}" $FILE);do
    echo $line|base32 -d|strings
done
for line in $(grep -i -o -E "[0-9a-f]{8,}" $FILE);do
    echo $line|base16 -d|strings
done
for line in $(grep -o -E "&#[&#;0-9]+;" $FILE);do
    python -c "print(''.join([chr(int(c)) for c in ('${line}')[2:-1].split(';&#')]))"|strings
done
