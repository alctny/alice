
# 一個簡單的進度條
function progress_bar() {
    local progress=$1
    local total_steps=$2
    local max_length=50
    local filled_length=$(( progress * max_length / total_steps ))
    local empty_length=$(( max_length - filled_length ))
    local filled_bar=$(printf "%0.s#" $(seq 1 $filled_length))
    local empty_bar=$(printf "%0.s-" $(seq 1 $empty_length))
    
    printf "\r\033[0;40;32m[%s%s] %d%% (%d / %d)\033[0m" "$filled_bar" "$empty_bar" "$(( progress * 100 / total_steps ))" "$progress" "$total_steps"
}

# 设置系统代理
function setproxy() {
  export HTTPS_PROXY=http://127.0.0.1:$PROXY_PORT
  export HTTP_PROXY=http://127.0.0.1:$PROXY_PORT
  export ALL_PROXY=socks5://127.0.0.1:$PROXY_PORT
}

# 清空系统代理
function unsetproxy() {
  unset HTTPS_PROXY
  unset HTTP_PROXY
  unset ALL_PROXY
}

# 查看系统代理
function showproxy() {
  echo "HTTP_PROXY  : $HTTP_PROXY"
  echo "HTTPS_PROXY : $HTTPS_PROXY"
  echo "ALL_PROXY   : $ALL_PROXY"
}

# 创建 .gitignorecase
function gi() { 
  curl -sL https://www.toptal.com/developers/gitignore/api/$@
}

# 快速设置桌面背景
function fbi() {
  feh --bg-fill $1
}

# 获取窗口 class
function win_class() {
  while true; do
    xprop | grep WM_CLAS
  done
}

# 对 PATH 变量进行检查
function ckpath() {
  IFS=":" read -ra path <<< "$PATH"
  for dir in "${path[@]}"; do
    [[ "$dir" =~ ^\$.* ]] && continue
    if [ ! -d "$dir" ] && [ "$dir" != '$PATH' ]; then
      echo -e "\e[31m${dir}\e[0m"
    else
      echo -e "\e[32m$dir\e[0m"
    fi
  done
}


# 将当前目录下的所有文件轮流设置为桌面背景
function wallpaper_walk() {
  for pic in *; do
    echo "${pic} fill"
    feh --bg-fill  "$pic"
    sleep 1

    echo "${pic} tile"
    feh --bg-tile  "$pic"
    sleep 1
  done 
}

# 清空废纸篓 Command + Option + Shift + Backspace
function cosb() {  
  # 如果该目录为空 size 依旧会是 4k，但是影响不是很大，所以不做特别修正
  size=$(du -d 0 -h ~/.local/share/Trash | awk '{print $1}')
  rm -rf ~/.local/share/Trash/*
  if [[ $? -eq 0 ]]; then
    echo "reclaimed: $size"
  fi
}


# 挂载外部磁盘的时候自动在 mnt 目录下创建相应的文件夹
function smnt() {
  dev=$1
  if [ "$dev" == "" ] || [ ! -b $dev ]; then
    echo "必须输入需要挂载的磁盤"
    return 1
  fi
  dir=${dev##*/}
  sudo mkdir -p "/mnt/$dir"
  sudo mount "$dev" "/mnt/$dir" && lsblk || echo "mount error"
}

# 在 umount 时自动删除 smnt 创建的目录
function umnt() {
  mounton=$1
  sudo umount $mounton && lsblk || (echo "unmount error" && return 1)
  sudo rmdir $mounton
}

# 功能: 將當前目錄下的所有文件（不包含隱藏文件）重命名爲“前綴+index” 的格式
# 參數:
#   $1: 文件名前綴，爲空時格式化之後的結果只有 index
#   $2: 序號，默認從 0 開始，且會按照目錄下文件數量自動在前方添加 0
# 注意: 此函數不會修改文件的後綴名，但默認了文件的後綴只有一個 .，對於 .tar.gz 的文件會被認爲後綴是 .gz 而不是 .tar.gz
function rename_with_index() {
  index=0
  if [ "$2" != "" ]; then
    index=$2
  fi

  file_count=$(expr $(ls | wc -l) + $index)
  digit=0
  t=$(expr $file_count / 10)
  while true; do
    digit=$(expr $digit + 1)
    if [ $t -eq 0 ]; then
      break
    fi
    t=$(expr $t / 10)
  done

  for f in *; do
    surfix=${f##*.}
    idx_str=$(printf "%0${digit}d" $index)
    new_name="${1}${idx_str}.${surfix}"
    mv "${f}" "${new_name}"
    index=$(expr $index + 1)
  done
}

# 功能: 計算一個目錄中所有視頻時長總和
# 參數:
#   $1: 視頻文件列表，为空则自动搜索 mp4/mkv/flv 文件
#   $2: 将具体每个视频时长输出到特定文件，为空则不输出
# 注意: 
#   1. 此函數計算視頻時長依賴 ffprob，需要自行安裝
#   2. 此函數並不會主動去發現和判斷視頻文件是那些，需要使用者通過 find 命令或其他手段將所有視頻文件路徑輸出到文本文件，
#      然後作爲參數傳遞給此函數
function video_duration() {
  local vlist=$1
  local detail=$2
  if [ "$vlist" == "" ]; then
    vlist=video_duration_list.txt
    find . -type f -iname "*.mkv" -or -iname "*.mp4" -or -iname "*.flv" > $vlist
  fi
  [ ! -f "$vlist" ] && echo "$vlist not file" && return
    

  local time=0
  local total=$(wc -l $vlist | awk '{print $1}')
  local i=1
  while read line; do
    local t=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$line")
    # 具体每个文件时长
    if [ "$detail" != "" ]; then
      local tt=$(echo "$t/1" | bc)
      local line_hou=$(( $tt / 3600 ))
      local line_min=$(( ($tt - $line_hou * 3600) / 60 ))
      local line_sec=$(( $tt - $line_hou * 3600 - $line_min * 60 ))
      printf "%dh:%02dm:%02ds %s\n" "$line_hou" "$line_min" "$line_sec" "$line" >> $detail
    fi
    # 累积
    time=$(echo "$time + $t" | bc)
    i=$(( $i + 1  ))
    progress_bar "$i" "$total"
  done < "$vlist"

  # 输出结果
  time=$(echo "$time/1" | bc)
  echo
  local hou=$(( $time / 3600 ))
  local min=$(( ($time - $hou * 3600) /60 ))
  local sec=$(( $time - $hou * 3600 - $min * 60 ))
  printf "\033[6;90;34m%dh:%dm:%ds\033[0m\n" "$hou" "$min" "$sec"
}

# 顯示所有顏色代碼在當前終端中的實際顯示效果
function ansi_colors() {
  bg_colors=($(seq 40 47) $(seq 90 97))
  fg_colors=($(seq 30 37) $(seq 100 107))
  for style in {0..9}; do
    echo -e "\nstyle: ${style}"
    for bg in ${bg_colors[@]}; do
      for fg in ${fg_colors[@]}; do
        echo -en " \033[${style};${bg};${fg}m\\\033[${style};${bg};${fg}m \033[0m"
      done
      echo
    done
  done
}

