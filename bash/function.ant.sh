
# 一個簡單的進度條
function progress_bar() {
    local progress=$1
    local total_steps=$2
    local max_length=50
    local filled_length=$(( progress * max_length / total_steps ))
    local empty_length=$(( max_length - filled_length ))
    local filled_bar=$(printf "%0.s#" $(seq 1 $filled_length))
    local empty_bar=$(printf "%0.s-" $(seq 1 $empty_length))
    
    printf "\r\033[0;40;32m[%s%s] %d%% (%d / %d)\033[0m" "$filled_bar" "$empty_bar" "$(( progress * 100 / total_steps ))" "$progress" "$total_steps"
}

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

# 快速设置桌面背景
function fbi() {
  feh --bg-fill $1
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
    [[ "$dir" =~ ^\$.* ]] && continue
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
    echo "${pic} fill"
    feh --bg-fill  "$pic"
    sleep 1

    echo "${pic} tile"
    feh --bg-tile  "$pic"
    sleep 1
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
    echo "必须输入需要挂载的磁盤"
    return 1
  fi
  dir=${dev##*/}
  sudo mkdir -p "/mnt/$dir"
  sudo mount "$dev" "/mnt/$dir" && lsblk || echo "mount error"
}

# 在 umount 时自动删除 smnt 创建的目录
function umnt() {
  mounton=$1
  sudo umount $mounton && lsblk || (echo "unmount error" && return 1)
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
#   $1: 視頻文件列表，为空则自动搜索 mp4/mkv/flv 文件
#   $2: 将具体每个视频时长输出到特定文件，为空则不输出
# 注意: 
#   1. 此函數計算視頻時長依賴 ffprob，需要自行安裝
#   2. 此函數並不會主動去發現和判斷視頻文件是那些，需要使用者通過 find 命令或其他手段將所有視頻文件路徑輸出到文本文件，
#      然後作爲參數傳遞給此函數
function video_duration() {
  local vlist=$1
  local detail=$2
  if [ "$vlist" == "" ]; then
    vlist=video_duration_list.txt
    find . -type f -iname "*.mkv" -or -iname "*.mp4" -or -iname "*.flv" > $vlist
  fi
  [ ! -f "$vlist" ] && echo "$vlist not file" && return
    

  local time=0
  local total=$(wc -l $vlist | awk '{print $1}')
  local i=1
  while read line; do
    local t=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$line")
    # 具体每个文件时长
    if [ "$detail" != "" ]; then
      local tt=$(echo "$t/1" | bc)
      local line_hou=$(( $tt / 3600 ))
      local line_min=$(( ($tt - $line_hou * 3600) / 60 ))
      local line_sec=$(( $tt - $line_hou * 3600 - $line_min * 60 ))
      printf "%dh:%02dm:%02ds %s\n" "$line_hou" "$line_min" "$line_sec" "$line" >> $detail
    fi
    # 累积
    time=$(echo "$time + $t" | bc)
    i=$(( $i + 1  ))
    progress_bar "$i" "$total"
  done < "$vlist"

  # 输出结果
  time=$(echo "$time/1" | bc)
  echo
  local hou=$(( $time / 3600 ))
  local min=$(( ($time - $hou * 3600) /60 ))
  local sec=$(( $time - $hou * 3600 - $min * 60 ))
  printf "\033[6;90;34m%dh:%dm:%ds\033[0m\n" "$hou" "$min" "$sec"
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

# 输出 ASCII CODE 对照表
function ascii-code () {
  cat << 'EOF'
| ASCII Code | Character | Description            |  ASCII Code | Character | Description           | 
|------------|-----------|------------------------|-------------|-----------|-----------------------| 
| 000  0x00  | NUL       | Null character         |  064  0x40  | @         | At symbol             |
| 001  0x01  | SOH       | Start of Heading       |  065  0x41  | A         | Uppercase A           |
| 002  0x02  | STX       | Start of Text          |  066  0x42  | B         | Uppercase B           |
| 003  0x03  | ETX       | End of Text            |  067  0x43  | C         | Uppercase C           |
| 004  0x04  | EOT       | End of Transmission    |  068  0x44  | D         | Uppercase D           |
| 005  0x05  | ENQ       | Enquiry                |  069  0x45  | E         | Uppercase E           |
| 006  0x06  | ACK       | Acknowledge            |  070  0x46  | F         | Uppercase F           |
| 007  0x07  | BEL       | Bell                   |  071  0x47  | G         | Uppercase G           |
| 008  0x08  | BS        | Backspace              |  072  0x48  | H         | Uppercase H           |
| 009  0x09  | TAB       | Horizontal Tab         |  073  0x49  | I         | Uppercase I           |
| 010  0x0a  | LF        | Line Feed (New Line)   |  074  0x4a  | J         | Uppercase J           |
| 011  0x0b  | VT        | Vertical Tab           |  075  0x4b  | K         | Uppercase K           |
| 012  0x0c  | FF        | Form Feed              |  076  0x4c  | L         | Uppercase L           |
| 013  0x0d  | CR        | Carriage Return        |  077  0x4d  | M         | Uppercase M           |
| 014  0x0e  | SO        | Shift Out              |  078  0x4e  | N         | Uppercase N           |
| 015  0x0f  | SI        | Shift In               |  079  0x4f  | O         | Uppercase O           |
| 016  0x10  | DLE       | Data Link Escape       |  080  0x50  | P         | Uppercase P           |
| 017  0x11  | DC1       | Device Control 1       |  081  0x51  | Q         | Uppercase Q           |
| 018  0x12  | DC2       | Device Control 2       |  082  0x52  | R         | Uppercase R           |
| 019  0x13  | DC3       | Device Control 3       |  083  0x53  | S         | Uppercase S           |
| 020  0x14  | DC4       | Device Control 4       |  084  0x54  | T         | Uppercase T           |
| 021  0x15  | NAK       | Negative Acknowledge   |  085  0x55  | U         | Uppercase U           |
| 022  0x16  | SYN       | Synchronous Idle       |  086  0x56  | V         | Uppercase V           |
| 023  0x17  | ETB       | End of Transmit Block  |  087  0x57  | W         | Uppercase W           |
| 024  0x18  | CAN       | Cancel                 |  088  0x58  | X         | Uppercase X           |
| 025  0x19  | EM        | End of Medium          |  089  0x59  | Y         | Uppercase Y           |
| 026  0x1a  | SUB       | Substitute             |  090  0x5a  | Z         | Uppercase Z           |
| 027  0x1b  | ESC       | Escape                 |  091  0x5b  | [         | Left square bracket   |
| 028  0x1c  | FS        | File Separator         |  092  0x5c  | \         | Backslash             |
| 029  0x1d  | GS        | Group Separator        |  093  0x5d  | ]         | Right square bracket  |
| 030  0x1e  | RS        | Record Separator       |  094  0x5e  | ^         | Caret                 |
| 031  0x1f  | US        | Unit Separator         |  095  0x5f  | _         | Underscore            |
| 032  0x20  | Space     | Space                  |  096  0x60  | `         | Grave accent          |
| 033  0x21  | !         | Exclamation mark       |  097  0x61  | a         | Lowercase a           |
| 034  0x22  | "         | Double quote           |  098  0x62  | b         | Lowercase b           |
| 035  0x23  | #         | Number                 |  099  0x63  | c         | Lowercase c           |
| 036  0x24  | $         | Dollar                 |  100  0x64  | d         | Lowercase d           |
| 037  0x25  | %         | Percent                |  101  0x65  | e         | Lowercase e           |
| 038  0x26  | &         | Ampersand              |  102  0x66  | f         | Lowercase f           |
| 039  0x27  | '         | Single quote           |  103  0x67  | g         | Lowercase g           |
| 040  0x28  | (         | Left parenthesis       |  104  0x68  | h         | Lowercase h           |
| 041  0x29  | )         | Right parenthesis      |  105  0x69  | i         | Lowercase i           |
| 042  0x2a  | *         | Asterisk               |  106  0x6a  | j         | Lowercase j           |
| 043  0x2b  | +         | Plus                   |  107  0x6b  | k         | Lowercase k           |
| 044  0x2c  | ,         | Comma                  |  108  0x6c  | l         | Lowercase l           |
| 045  0x2d  | -         | Hyphen                 |  109  0x6d  | m         | Lowercase m           |
| 046  0x2e  | .         | Period                 |  110  0x6e  | n         | Lowercase n           |
| 047  0x2f  | /         | Slash                  |  111  0x6f  | o         | Lowercase o           |
| 048  0x30  | 0         | Digit 0                |  112  0x70  | p         | Lowercase p           |
| 049  0x31  | 1         | Digit 1                |  113  0x71  | q         | Lowercase q           |
| 050  0x32  | 2         | Digit 2                |  114  0x72  | r         | Lowercase r           |
| 051  0x33  | 3         | Digit 3                |  115  0x73  | s         | Lowercase s           |
| 052  0x34  | 4         | Digit 4                |  116  0x74  | t         | Lowercase t           |
| 053  0x35  | 5         | Digit 5                |  117  0x75  | u         | Lowercase u           |
| 054  0x36  | 6         | Digit 6                |  118  0x76  | v         | Lowercase v           |
| 055  0x37  | 7         | Digit 7                |  119  0x77  | w         | Lowercase w           |
| 056  0x38  | 8         | Digit 8                |  120  0x78  | x         | Lowercase x           |
| 057  0x39  | 9         | Digit 9                |  121  0x79  | y         | Lowercase y           |
| 058  0x3a  | :         | Colon                  |  122  0x7a  | z         | Lowercase z           |
| 059  0x3b  | ;         | Semicolon              |  123  0x7b  | {         | Left curly bracket    |
| 060  0x3c  | <         | Less than              |  124  0x7c  | |         | Vertical bar          |
| 061  0x3d  | =         | Equals                 |  125  0x7d  | }         | Right curly bracket   |
| 062  0x3e  | >         | Greater than           |  126  0x7e  | ~         | Tilde                 |
| 063  0x3f  | ?         | Question mark          |  127  0x7f  | DEL       | Delete                |
EOF
}

