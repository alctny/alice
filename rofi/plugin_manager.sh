#!/bin/bash

# 作用: rofi 插件管理脚本
#   1. 自动为 plugin/ 下的可执行程序生成 .desktop 文件
#   2. 通过 dmenu 调用 plugin 下的可执行程序
#   3. 清理自动生成的 .desktop 文件

readonly PLUGIN_DIR=$HOME/.config/rofi/plugin
readonly APP_DIR=$HOME/.local/share/applications
readonly DATA_DIR=$HOME/.config/rofi/data
readonly DATA_FIL=$DATA_DIR/desktop.lis

# load_plugin 加载 plugin 目录下的可执行程序
function load_plugin() {
  for f in $PLUGIN_DIR/*; do
    [[ ! -x "$f" ]] && continue
    basename "$f"
  done
  echo clean
  echo sync
}

# create_desktop 为插件自动创建 .desktop(方便在 rofi 中快速调用)
function create_desktop() {
  desks=()
  i=0
  for f in $PLUGIN_DIR/*; do
    [[ ! -x "$f" ]] && continue
    bn=$(basename "$f")
    rp=$(realpath "$f")
    desk="$APP_DIR/${bn}.desktop"
    cat > "$desk" <<EOF
[Desktop Entry]
Type=Application
Name=$bn( Rofi Plugin )
Exec=rofi -show "$bn" -modi "$bn:$rp"
Icon=plugin
Terminal=false
EOF
    desks[$i]=$desk
    ((i++))
  done
  mkdir -p $DATA_DIR
  printf "%s\n" ${desks[*]} > $DATA_FIL
}

# clean_desktop 清理自动生成的可执行程序
function clean_desktop() {
  while read -r f ; do
    rm $f
  done < "$DATA_FIL"
  rm $DATA_FIL
}

mode=$(load_plugin | rofi -dmenu)

case "$mode" in
  sync)
    create_desktop
    ;;
  clean)
    clean_desktop
    ;;
  "")
    load_plugin
    ;;
  *)
    if [[ -f "$PLUGIN_DIR/$mode" ]]; then
      exec rofi -show "$mode" -modi "$mode:$PLUGIN_DIR/$mode"
    fi
    ;;
esac

