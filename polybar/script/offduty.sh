#! /bin/bash

# set -x

# 计算 HH:MM:SS 格式的时间字符串与 00:00:00 的时间差，单位为秒
function time2sec() {
  IFS=":" read -ra tm <<< "$1"
  local sec=$((${tm[0]} * 3600 + ${tm[1]} * 60 + ${tm[2]}))
  echo "$sec"
}

# 使用表达式是为了可读性和后续修改的时候方便
time_points=("11:35:00" "13:00:00" "18:15:00" "24:00:00")
# FIXME: 分钟为 01-09 时会报错
pass_tody=$(($(date +%H) * 3600 + $(date +%M) * 60 + $(date +%S)))

for tp in "${time_points[@]}"; do
  pass_tp=$(time2sec "$tp")
  if [ $pass_tody -gt $pass_tp ]; then
    continue
  fi

  diff_sec=$(($pass_tp - $pass_tody))
  dh=$(($diff_sec / 3600))
  dm=$((($diff_sec - $dh * 3600) / 60))
  ds=$(($diff_sec - $dh * 3600 - $dm * 60))
  printf "%02d:%02d:%02d\n" $dh $dm $ds
  
  break
done
