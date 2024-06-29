
# 设置系统代理
function setproxy() {
  port=7890
  export HTTPS_PROXY=http://127.0.0.1:$port
  export HTTP_PROXY=http://127.0.0.1:$port
  export ALL_PROXY=socks5://127.0.0.1:$port
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

# 自动解压缩，并判断是否需要创建新的文件夹
function ziptodir() {
  echo "doing"
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
    [[ "$dir" =~ ^\$.* ]] && continue  # 过滤 $PATH
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
    feh --bg-center  "$pic" 2>/dev/null
    if [ $? != 0 ]; then
      continue
    fi
    echo "${pic} center"
    sleep 2

    echo "${pic} scale"
    feh --bg-scale  "$pic"
    sleep 2

    echo "${pic} fill"
    feh --bg-fill  "$pic"
    sleep 2

    echo "${pic} max"
    feh --bg-max  "$pic"
    sleep 2

    echo "${pic} tile"
    feh --bg-tile  "$pic"
    sleep 2
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
    echo "必须输入需要挂载的文件"
    exit 1
  fi
  dir=${dev##*/}
  sudo mkdir -p "/mnt/$dir"
  sudo mount "$dev" "/mnt/$dir" && lsblk || echo "mount error"
}

# 在 umount 时自动删除 smnt 创建的目录
function umnt() {
  mounton=$1
  sudo umount $mounton && lsblk || echo "unmount error"
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
#   $1: 視頻文件列表
# 注意: 
#   1. 此函數計算視頻時長依賴 ffprob，需要自行安裝
#   2. 此函數並不會主動去發現和判斷視頻文件是那些，需要使用者通過 find 命令或其他手段將所有視頻文件路徑輸出到文本文件，
#      然後作爲參數傳遞給此函數
function video_duration() {
  time=0
  while read line; do
   t=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$line")
   time=$(echo "$time + $t" | bc)
  done < "$1"

  printf "%.2f s\n" $time
  time=$(echo "$time / 60" | bc)
  printf "%.2f m\n" $time
  time=$(echo "$time / 60" | bc)
  printf "%.2f h\n" $time
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

