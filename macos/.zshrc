#--------------------------------------------命令别名--------------------------------------------
alias c='clear'
alias e='exit'
alias l='ls'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias t='tmux attach || tmux'
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
export PROMPT='%~
🦚'
# 禁止 tar 命令生成 ._文件
export COPYFILE_DISABLE=1
# PATH 路徑
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/bin
#--------------------------------------------自定义函数--------------------------------------------
function resource() {
  source ~/.zshrc
}
# .gitignore 生成器
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/macos,linux,visualstudiocode,xcode,$@ ;}
#--------------------------------------------外部脚本--------------------------------------------
# Rust
source "$HOME/.cargo/env"
