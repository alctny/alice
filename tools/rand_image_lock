#! /bin/bash
#
# 随机使用一张图片作为 i3lock 的锁屏壁纸
#

if ! command -v feh > /dev/null 2>&1; then
  echo "feh command not fond"
  exit 1
fi

dir=$1
if [ "$dir" == "" ]; then
  dir="$HOME/picture/wallpaper"
fi

if  [[ "$dir" == */ ]]; then
  dir=${dir%/}
fi

echo "$dir/*.png"

cnt=$(ls $dir/*.png 2>/dev/null | wc -l)
if [ $cnt -eq 0 ]; then
  i3lock -e -f -c 416E74
  exit
fi

rand=$(($RANDOM % $cnt))

lcbg="lock"
i=0
for f in $dir/*.png; do
  if [ $i -eq $rand ]; then
    lcbg=$f
  fi
  i=$(($i + 1))
done

i3lock -e -f -c f0f8ff -i $lcbg
