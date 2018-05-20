# ./preprocess.sh <input> <output>
for i in {$1,*.wsa}; do
    cp "$i" "$i.tmp.c"
    sed -E -i '
        s/\s*#.+$//g
        s/\s*;\s*/\n/g
        s/^\s*@/#/g
        s/^#include\s*"(.+?)"/#include "\1.tmp.c"/g
    ' "$i.tmp.c"
done
gcc -E -P $1.tmp.c > $2
rm *.tmp.c
