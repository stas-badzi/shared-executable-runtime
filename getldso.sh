#!/bin/sh
echo "int main() {}" > tmp.c
if [ -z $1 ]
then
  export CC=cc
else
  export CC=$1
fi
$CC tmp.c -o tmp.out $CFLAGS || exit 1
readelf -Wl tmp.out | \
  sed -n 's/.*interpreter: \(.*\)]/\1/p'