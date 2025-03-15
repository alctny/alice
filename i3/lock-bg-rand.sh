#!/bin/bash
#
# 随机使用一张图片作为 i3lock 的锁屏壁纸
#

dir="$HOME/.local/share/wallpaper"

cnt=$(ls $dir/*.png | wc -l)
if [ $cnt -eq 0 ]; then
  i3lock -e -f -c 416E74
  exit
fi

rand=$(($RANDOM % $cnt  + 1))
lcbg=$(ls $dir/*.png | sed -n "${rand}p")

i3lock -e -f -c f0f8ff -i $lcbg
