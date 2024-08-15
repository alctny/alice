#! /bin/bash

# 仅获取当前 workspace 的窗口
act_ws_id=$(wmctrl -d | awk -F' ' '$2 == "*"' | awk '{print $1}')
wins=$(wmctrl -l -x | awk  -v awi="$act_ws_id" '$2 == awi {print $3}')
[ "$wins" == "" ] && echo "Deus vult" && exit

act_win_id=$(xprop -root | grep '_NET_ACTIVE_WINDOW(WINDOW)' | awk '{print substr($5, 3)}')
# PS：此处获得的窗口顺序默认按照窗口 ID 进行排序
# 所以输出的内容可能与窗口顺序不同
act_win_name=$(wmctrl -l -x | grep "$act_win_id" | awk '{print $3}' )

for w in $wins; do
  # FIXME: 同个程序的所有实例前都会加 *
  [ "$w" == "$act_win_name" ] && w="*${w}"
  echo -n "${w%%.*}/ "
done
