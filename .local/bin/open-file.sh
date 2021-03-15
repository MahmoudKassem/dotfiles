#!/bin/sh

if [ $# -ne 1 ]
  then printf "%s\\n" "Usage: open-file <file path>" 
       exit 1
fi

fileExtension=$(printf "%s\\n" "$1" | sed 's/ /\\ /g' | xargs basename | sed -n -E 's/.*\.(.*)$/\1/p')
case $fileExtension in
  "gif" | "jpg" | "jpeg" | "png" | "svg") $IMAGE "$1";;
  "pdf") $READER "$1";;
  "mkv" | "mp3" | "mp4"| "wav") $VIDEO "$1";;
  *) $EDITOR "$1";;
esac
