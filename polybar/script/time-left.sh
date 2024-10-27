#! /bin/bash

points=("11:35:00" "13:00:00" "18:30:00" "24:00:00")
if [ $# -gt 0 ];then
  points=($*)
fi

mode=0
gap=1

switch() {
  mode=$((($mode + 1) % 2))
}

trap "switch" USR1

# 计算 H:M:S 格式的时间字符串与 00:00:00 的时间差，单位为秒
function time2sec() {
  IFS=":" read -ra tm <<< "$1"
  local sec=$((${tm[0]} * 3600 + ${tm[1]} * 60 + ${tm[2]}))
  echo "$sec"
}


function left() {
  pass_tody=$(($(date +%H) * 3600 + $(date +%M | sed s/^0//) * 60 + $(date +%S | sed s/^0//)))

  for tp in "${points[@]}"; do
    pass_tp=$(time2sec "$tp")
    if [ $pass_tody -gt $pass_tp ]; then
      continue
    fi

    diff_sec=$(($pass_tp - $pass_tody))
    dh=$(($diff_sec / 3600))
    dm=$((($diff_sec - $dh * 3600) / 60))
    ds=$(($diff_sec - $dh * 3600 - $dm * 60))
    printf "$(date +"%Y/%m/%d") %02d:%02d:%02d\n" $dh $dm $ds
    break
  done
}

while true; do
  case $mode in
    0)
      left
      ;;
    1)
      date +"%Y/%m/%d %H:%M:%S"
      ;;
    *)
      echo Fuck You
      ;;
  esac
  sleep $gap
done
