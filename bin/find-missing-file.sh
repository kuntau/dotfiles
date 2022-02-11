#!/usr/bin/env bash

# check if any file is missing

# ALWAYS QUOTE VARIABLES!
# BASH REALLY HATE WHITESPACES
# IT'S ALWAYS THE SOURCE OF MY MISSING HAIRS

path='/Volumes/Entertainment/Manga/Naruto [complete]/'
file='Chapter'
ext='.zip'

for ((i = 1; i <= 700; i++)); do
  # printf -v name "%s%s %03d\n" $path $file $i
  printf -v name "%s%s %03d%s" "$path" "$file" "$i" "$ext"
  # echo "$name"
  if [[ ! -f $name ]]; then
    echo "$name missing!"
  fi
done

# for i in $(seq -f "%03g" 1 15); do
#   echo "$path$file$i"
# done
