
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
  sudo mkdir -p "/mnt/$dir" || exit 1
  sudo mount "$dev" "/mnt/$dir" && lsblk || echo "mount error"
}

# 在 umount 时自动删除 smnt 创建的目录
function umnt() {
  mounton=$1
  sudo umount $mounton || echo "unmount error"
  sudo rmdir $mounton
}
