#!/bin/bash

readonly PIC_PATH="$HOME/.local/share/wallpaper"
screen_num=$(xrandr | grep ' connected' | wc -l)

size=$(ls $PIC_PATH | wc -l)
pic_list=()
for i in $( seq 1 $screen_num ); do
  idx=$((RANDOM % $size + 1))
  pic=$(ls $PIC_PATH | sed -n "${idx}p")
  pic_list+=("$PIC_PATH/$pic")
done

feh --bg-fill ${pic_list[*]}

out=""
for p in ${pic_list[*]}; do
  out="$out/$(basename $p | sed 's/\..*$//')"
done
echo $out | sed 's/^\///'
