#!/bin/sh

TARGET_DIR=$1
if [ "$TARGET_DIR" = "" ]; then
  echo "TARGET_DIR ex: /usr/bin"
  TARGET_DIR=/usr/bin
fi

OBJPREFIX=$2
if [ "$OBJPREFIX" = "" ]; then
  BARCH=`uname -m`
  OBJPREFIX=objdir-$BARCH
fi

mkdir -p $TARGET_DIR

FILES_LIST="
$OBJPREFIX/qmlMozEmbedTest
$OBJPREFIX/qmlMozEmbedTestQt5
"
for str in $FILES_LIST; do
  if [ -f $str ]; then
    fname="${str##*/}"
    rm -f $TARGET_DIR/$fname;
    ln -s $(pwd)/$str $TARGET_DIR/$fname;
  fi
done
