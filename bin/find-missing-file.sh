#!/usr/bin/env bash

# check if any file is missing

# ALWAYS QUOTE VARIABLES!
# BASH REALLY HATE WHITESPACES
# IT'S ALWAYS THE SOURCE OF MY MISSING HAIRS

path='/Volumes/HQPOOL/Images/Manga/One Piece/'
file='Chapter'
ext='.zip'
file_count=1011

for ((i = 1; i <= file_count; i++)); do
  # %03d is the padding size
  printf -v name "%s%s %04d%s" "$path" "$file" "$i" "$ext"

  if [[ ! -f $name ]]; then
    echo "$name missing!"
  fi
done

# for i in $(seq -f "%03g" 1 15); do
#   echo "$path$file$i"
# done
