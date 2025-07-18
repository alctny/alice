
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


# 获取窗口 class
function win_class() {
  while true; do
    xprop | grep WM_CLAS
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

function loop() {
  while true; do
    eval "$*"
    sleep 1
  done
}

