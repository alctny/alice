#! /bin/bash
 
mode=1
interval=0.2
empt="Deus Vult"

toggle() {
  mode=$(((mode + 1) % 4))
}

trap "toggle" USR1

# 把 xprop -id $id | grep _NET_WM_NAME 的内容直接传入可以获得一个更详细的窗口名称
# e.g. "Visual Studio Code/" "Mozilla Firefox/"
# 但由于单格窗口名称会更长，如果屏幕分辨率较低不建议使用
prettier() {
  wn=$@
  if [[ "$wn" == *"- "* ]]; then
    wn=$(echo $wn | awk -F'- ' '{print $NF}' | tr -d '" ')
  elif [[ "$wn" == *"— "* ]]; then
    wn=$(echo $wn | awk -F'— ' '{print $NF}' | tr -d '" ')
  else
    wn=$(echo $wn | awk -F'= ' '{print $NF}' | tr -d '" ')
  fi
  echo "${wn}/"
}

winall() {
  ids=$(wmctrl -l -x | awk '{print $1}' | sed -E 's/^0x0+/0x/')
  if [ -z "$ids" ]; then
    echo $empt
    exit
  fi

  aid=$(xprop -root | grep '_NET_ACTIVE_WINDOW(WINDOW)' | awk '{print $NF}')
  for id in $ids; do
    wn=$(xprop -id $id WM_CLASS | awk -F'"' '{print $2}')
    if [ "$id" = "$aid" ]; then
      wn="*${wn}"
    fi
    echo -n "${wn} | "
  done
  echo
}

# 查看当前 workspace 所有窗口
winlis() {
  act_ws_id=$(wmctrl -d | awk -F' ' '$2 == "*"' | awk '{print $1}')
  ids=$(wmctrl -l -x | awk  -v awi="$act_ws_id" '$2 == awi {print $1}' | sed -E 's/^0x0+/0x/')
  if [ -z "$ids" ]; then
    echo $empt
    exit
  fi

  aid=$(xprop -root | grep '_NET_ACTIVE_WINDOW(WINDOW)' | awk '{print $NF}')
  for id in $ids; do
    wn=$(xprop -id $id | grep CLASS | awk -F'"' '{print $2}')
    if [ "$id" = "$aid" ]; then
      wn="*${wn}"
    fi
    echo -n "${wn} | "
  done
  echo
}

# 只查看当前焦点窗口
winact() {
  id=$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $NF}')
  if [ "$id" = "0x0" ]; then
    echo $empt
    exit 0
  fi

  xprop -id $id WM_CLASS | awk -F'"' '{print $2}'
}

while true; do
  case $mode in
    0)
      winact
      ;;
    1)
      winlis
      ;;
    2)
      winall
      ;;
    *)
      echo $empt
      ;;
  esac
  sleep $interval
done
