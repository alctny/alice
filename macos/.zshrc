# Append "$1" to $PATH when not already in.
# This function API is accessible to scripts in /etc/profile.d
function append_path () {
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      PATH="${PATH:+$PATH:}$1"
  esac
}

# 使新配置生效
function resource() { source ~/.zshrc }

# .gitignore 生成器
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}

# 命令别名
alias c='clear'
alias e='exit'
alias l='ls'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias lsblk='diskutil list'

# 自动补全忽略大小写
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# 禁止生成緩存文件
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# history 默认格式
export HISTTIMEFORMAT='%F %T '

# Homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/ #ckbrew

# Golang
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export GOPATH=$HOME/.go

# npm 代理
export NODE_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
export NPM_CONFIG_PREFIX=/home/$USER/.local/lib/node-module
append_path $HOME/.local/lib/node-module/bin

# Rust 代理
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# 命令行提示前綴
export PROMPT='%~
(^•ﻌ•^)'

# 禁止 tar 命令生成 ._文件
export COPYFILE_DISABLE=1

# 系统代理
export HTTPS_PROXY=http://127.0.0.1:1087
export HTTP_PROXY=http://127.0.0.1:1087
export ALL_PROXY=socks5://127.0.0.1:1080
export NO_PROXY="localhost,127.0.0.1,172.30.0.0,172.28.0.0"

# 默認編輯器
export EDITOR=nvim
export VISUAL=nvim

# user function and script, no sync
if [[ -f $HOME/.function.416e74.sh ]]; then
  source $HOME/.function.416e74.sh
else
  cat > $HOME/.function.416e74.sh << 'EOF'
#!/bin/zsh
EOF
fi

# user alias, no sync
if [[ -f $HOME/.alias.416e74.sh ]]; then
  source $HOME/.alias.416e74.sh
else
  cat > $HOME/.alias.416e74.sh << 'EOF'
#!/bin/zsh
EOF
fi

# user ENV and PATH, no sync
if [[ -f $HOME/.env.416e74.sh ]]; then
  source $HOME/.env.416e74.sh
else
  cat > $HOME/.env.416e74.sh << 'EOF'
#!/bin/zsh

function append_path () {
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      PATH="${PATH:+$PATH:}$1"
  esac
}
EOF
fi

# other shell
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search.zsh
