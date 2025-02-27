#!/bin/bash

# 失敗時輸出腳本名稱和行號
trap 'echo -e "\033[1;90;31m$BASH_SOURCE:$LINENO $BASH_COMMAND\033[0m"' ERR

# 輸出錯誤信息並退出
err() {
  eeho -e "\033[1;90;31m$@\033[0m" >& 2
  exit 1
}

# 一個簡單的進度條
function progress_bar() {
  progress=$1
  total_steps=$2
  max_length=50
  filled_length=$(( progress * max_length / total_steps ))
  empty_length=$(( max_length - filled_length ))
  filled_bar=$(printf "%0.s#" $(seq 1 $filled_length))
  empty_bar=$(printf "%0.s-" $(seq 1 $empty_length))

  printf "\r\033[0;40;32m[%s%s] %d%% (%d / %d)\033[0m" "$filled_bar" "$empty_bar" "$(( progress * 100 / total_steps ))" "$progress" "$total_steps"
}

# 輸出錯誤信息並推出
function err() {
  echo "$*"
  exit 1
}
