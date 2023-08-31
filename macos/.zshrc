#------------------------命令别名----------------------------
alias ls='ls --color'
alias ls='lsd'
alias c='clear'
alias e='exit'
# alias ls='exa'
alias l='ls'
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -l'
alias lla='ls -al'
alias llh='ls -lh'
alias t='tmux attach || tmux'

#------------------自动补全忽略大小写------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

#----------------------环境变量-------------------------------
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/ #ckbrew

export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export GOPATH="/Users/violet/.go"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

export PROMPT='%~
>'

#--------------------自定义函数--------------------------
function resource() {
  source ~/.zshrc
}

function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/macos,linux,visualstudiocode,xcode,$@ ;}

#--------------------外部脚本-------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source "$HOME/.cargo/env"
