#! /bin/bash

low=20
pstatus=$(cat /sys/class/power_supply/BAT0/status)

while true; do
  status=$(cat /sys/class/power_supply/BAT0/status)
  capacity=$(cat /sys/class/power_supply/BAT0/capacity)

  if [ "$capacity" == 100 ];then
    continue
  fi

  if [ "$pstatus" != "$status" ];then
    dunstify -u low -t 1500 -i battery-060 "$status" "current status: $capacity !!!"
    pstatus=$status
  fi

  if [ $status == "Charging" ]; then
    low=20
    continue
  fi

  if [ $capacity -le $low ]; then
    dunstify -u critical -i battery-empty "电量过低!!!" "当前电量: ${capacity}%"
    low=$((low - 5))
  fi
  sleep 1
done
