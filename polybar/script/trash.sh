#! /bin/bash

colors=("#F0F8FF" "#66FF00" "#CCFF00" "#FFCC00" "#FF6600" "#FF0000")

if [ ! -e ~/.local/share/Trash/files ]; then
  echo " Empt"
  exit 0
fi

msg=$(du -d 1 -h ~/.local/share/Trash/files/ | tail -n 1 | awk '{print $1}')

size=$(du -d 1 ~/.local/share/Trash/files/ | tail -n 1 | awk '{print $1}')
color_index=0
if [ $size -lt 2000000 ];then
  color_index=0
elif [ $size -lt 4000000 ]; then
  color_index=1
elif [ $size -lt 8000000 ]; then
  color_index=2
elif [ $size -lt 16000000 ]; then
  color_index=3
elif [ $size -lt 20000000 ]; then
  color_index=4
else 
  color_index=5
fi

echo %{F${colors[$color_index]}} $msg%{F-}
