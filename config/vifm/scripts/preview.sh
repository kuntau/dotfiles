#!/bin/sh

file="$1"

mime=$(file --mime-type -Lb "$file")

case "$mime" in
  image/*)
    chafa "$file"
    ;;
  video/*)
    ffmpegthumbnailer -i "$file" -o - -s 0 | chafa
    ;;
  application/pdf)
    pdftotext "$file" - | sed -n '1,200p'
    ;;
  text/*)
    bat --style=plain --color=always "$file"
    ;;
  *)
    file "$file"
    ;;
esac

