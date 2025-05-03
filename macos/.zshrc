ZSH_HOME=$HOME/.config/zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# enable edit-command-line with editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# history 默认格式
export HISTTIMEFORMAT='%F %T '

# Homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/ #ckbrew

# Golang
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export GOPATH=$HOME/.go
append_path $GOPATH/bin

# npm 代理
export NODE_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
export NPM_CONFIG_PREFIX=/home/$USER/.local/lib/node-module
append_path $HOME/.local/lib/node-module/bin

# Rust 代理
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# 命令行提示前綴
# export PROMPT='%~
# (^•ﻌ•^)'

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

# 插件管理器
ZINIT_HOME="${ZSH_HOME}/zinit.git"
[[ ! -d $ZINIT_HOME ]] && mkdir -p "$(dirname $ZINIT_HOME)"
[[ ! -d $ZINIT_HOME/.git ]] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
# 補全建議
[[ ! -d $ZSH_HOME/zsh-autosuggestions/.git ]] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_HOME}/zsh-autosuggestions
source ${ZSH_HOME}/zsh-autosuggestions/zsh-autosuggestions.zsh
# 歷史記錄補全
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit load zsh-users/zsh-history-substring-search
zinit ice wait atload _history_substring_search_config
# 語法高亮
zinit light zsh-users/zsh-syntax-highlighting
# zsh 自動補全
zinit light zsh-users/zsh-completions
# p10k 主題
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

