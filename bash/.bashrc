# 
# /etc/skel/.bashrc
#
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

# SHE YOUR EVNIROMENT VALUE OR ALIS IN THERE

unset -f ifalias
unset -f append_path
