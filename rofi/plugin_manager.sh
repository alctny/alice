#!/bin/bash

readonly PLUGIN_DIR=$HOME/.config/rofi/plugin

function load_plugin() {
  for f in $PLUGIN_DIR/*; do
    [[ ! -x "$f" ]] && continue
    basename "$f"
  done
}

mode=$(load_plugin | rofi -dmenu)

case "$mode" in
  "")
    load_plugin
    ;;
  *)
    if [[ -f "$PLUGIN_DIR/$mode" ]]; then
      exec rofi -show "$mode" -modi "$mode:$PLUGIN_DIR/$mode"
    fi
    ;;
esac

