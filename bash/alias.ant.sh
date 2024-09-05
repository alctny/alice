
# 功能: 如果命令 A' 存在则使用 A 作为 A' 的别名替代原本的命令 A
#   并使用 oA 作为命令 A 的别名
# 参数:
#   $1: A' 外部命令，可能是自己安装的可执行程序，如 bat, ncdu, lsd
#   $2: A 内部命令，系统默认的命令，如 cat, du, ls
function ifalias() {
  local rej=$1
  local ori=$2
  type $rej > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    local ori_path=$(whereis $ori | awk '{print $2}')
    alias o$ori=$ori_path
    alias $ori=$rej
  fi
}

alias t='tmux attach || tmux'
alias e='tmux suspend-client || exit'
alias ls='ls --color=always'
alias l='ls'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -alh'
alias lah='du --max-depth=1 -h'
alias fbi='feh --bg-fill'
alias img='feh --auto-zoom --keep-zoom-vp --zoom-step=3 --image-bg='#416E74''
alias c='clear'
alias resource='source ~/.bashrc && source /etc/profile'
alias rime='killall fcitx5 && fcitx5-remote -r'
alias baidu='curl https://www.baidu.com'
alias google='curl https://www.google.com'
alias grep='grep --color=auto'
alias ffrecord='ffmpeg -video_size 2240x1400 -r 60 -f x11grab -i :0.0 -f pulse -i $(pactl list sinks | grep $(pactl get-default-sink).monitor | cut -d : -f 2) -qscale 0 ~/video/$(date +%Y-%m-%d_%H-%M-%S.mkv)'

ifalias ncdu du
ifalias lsd  ls
ifalias bat  cat
ifalias nvim vim
ifalias nvim vi

unset -f ifalias
