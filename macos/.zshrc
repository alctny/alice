#--------------------------------------------命令别名--------------------------------------------
alias c='clear'
alias e='exit'
alias l='ls'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias t='tmux attach || tmux'
# alias ffmpeg='ffmpeg -hide_banner '
#--------------------------------------------自动补全忽略大小写--------------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
#--------------------------------------------环境变量--------------------------------------------
# Homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/ #ckbrew
# Golang
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export GOPATH="/Users/violet/.go"
# 命令行提示前綴
# 👾 👘 🦄 🦋 🦚 🦑 🍀 🪷 🪽 🌸 🎉 🎊 📦 🦠 🧬 🎀
export PROMPT='%~
🦋'
# 禁止 tar 命令生成 ._文件
export COPYFILE_DISABLE=1
# PATH 路徑
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/.local/bin
#--------------------------------------------自定义函数--------------------------------------------
# 使新配置生效
function resource() {
  source ~/.zshrc
}

# .gitignore 生成器
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# 解压当前目录下的所有压缩包
function uzall() { find . -name "*.$1" -d 1 -exec 7z x {} \; }

# 将所有文件提取到当前目录
function come2here() { find . -type f -exec mv {} . \; }

# 批量重命名,将当前路径下的所有文件重命名为"xxx_序号"的格式
function allrename() {
  TMP_FILE=".`uuidgen`"
  ls > $TMP_FILE
  PREFIX=$1
  INDEX=0

  cat $TMP_FILE | while read fn; do
    suffix=${fn##*.}
    dn=`dirname $fn`
    dn=${dn##*/}
    nfn=`printf "%s_%03d.%s" $PREFIX $INDEX $suffix`
    mv "$fn" "$nfn"
    INDEX=$(( $INDEX + 1 ))
  done

  rm $TMP_FILE
}

function timels() {
  while true; do
    clear
    ls -l
    sleep 9
  done
}

function videotime() {
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

#--------------------------------------------外部脚本--------------------------------------------
# Rust
source "$HOME/.cargo/env"

if [ -f ~/.self ]; then
  source ~/.self
fi

#--------------------------------------------外部脚本--------------------------------------------
# defaults delete com.apple.desktopservices DSDontWriteNetworkStores
# 禁止生成緩存文件
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

export HTTPS_PROXY=http://127.0.0.1:7890
export HTTP_PROXY=http://127.0.0.1:7890
export ALL_PROXY=socks5://127.0.0.1:7890

