#! /bin/bash
 
# FIXME: wmctl -l 在新开启的应用固定到非当前 workspace 时出现如下错误
# X Error of failed request:  BadWindow (invalid Window parameter)
# Major opcode of failed request:  20 (X_GetProperty)
# Resource id in failed request:  0xa0000d
# Serial number of failed request:  12
# Current serial number in output stream:  12


interval=0.3
empt="Deus Vult"
data_file="/home/$USER/.config/polybar/data/winname.txt"

# custom windows name
wnamecustom() {
  wname=$1
  if [ ! -f $data_file ]; then
    echo $wname
    return
  fi

  if [ "$(grep "$wname" "$data_file" | wc -l)" -gt 0 ];then
    wname=$(grep "$wname" "$data_file" | awk -F',' '{print $2}')
  fi
  echo $wname
}

# 查看当前 workspace 所有窗口
winlis() {
  act_ws_id=$(wmctrl -d | awk -F' ' '$2 == "*"' | awk '{print $1}')
  ids=$(wmctrl -l -x | awk  -v awi="$act_ws_id" '$2 == awi {print $1}' | sed -E 's/^0x0+/0x/')
  if [ -z "$ids" ]; then
    echo $empt
    return
  fi

  aid=$(xprop -root | grep '_NET_ACTIVE_WINDOW(WINDOW)' | awk '{print $NF}')
  for id in $ids; do
    wn=$(xprop -id $id WM_CLASS | awk -F'"' '{print $2}')
    wn=$(wnamecustom "$wn")
    if [ "$id" = "$aid" ]; then
      wn="*${wn}"
    fi
    echo -n "${wn} | "
  done
  echo
}

while true; do
  winlis
  sleep $interval
done
