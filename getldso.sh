#!/bin/sh
echo "int main() {}" > tmp.c
export readelf=readelf
(uname -s | grep Darwin 2>/dev/null >/dev/null) && export readelf=greadelf

if [ -z $1 ]
then
  export CC=cc
else
  export CC=$1
fi
$CC tmp.c -o tmp.out $CFLAGS || exit 1
$readelf -Wl tmp.out | \
  sed -n 's/.*interpreter: \(.*\)]/\1/p'
