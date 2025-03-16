#!/bin/bash

readonly PID_FILE=$HOME/.config/i3/data/floting_term.pid

cnt=$(wmctrl -lx | awk  '$3=="st-256color.st-256color"' | wc -l)
if [[ $cnt -gt 0 ]]; then
  kill -9 $(cat $PID_FILE)
else
  st -e /bin/bash -lc 'tmux a || tmux' &
  echo $! > $PID_FILE
fi
