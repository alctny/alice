# 自動補全，忽略大小寫
# bind "set completion-ignore-case on"

# 系統代理
export PROXY_PORT=7890
export HTTPS_PROXY=http://127.0.0.1:$PROXY_PORT
export HTTP_PROXY=http://127.0.0.1:$PROXY_PORT
export ALL_PROXY=socks5://127.0.0.1:$PROXY_PORT
export NO_PROXY="localhost,127.0.0.1,172.30.0.0,172.28.0.0"

# npm 代理
export NODE_MIRROR=https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/
export NPM_CONFIG_PREFIX=/home/$USER/.local/lib/node-module

# Rust 代理
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# Golang 代理
export GOPROXY=https://www.goproxy.cn,direct

# 輸入法
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx

# 命令行上限
export HISTSIZE=
export HISTFILESIZE=

# history 默认格式
export HISTTIMEFORMAT='%F %T '

# 默認編輯器
export EDITOR=/usr/local/nvim/bin/nvim
export VISUAL=/usr/local/nvim/bin/nvim

# 默认终端模拟器
export TERMINAL=alacritty

# 命令提示符 prompt
export PS1="\033[7;97;36m \w \033[0m\033[0;47;100m \u \033[0m\n🦚"  # 🦚 🪷 📦 🎀
if [ "$RANGER_SHELL" == 'true' ]; then
  export PS1='\w\n(R)'
fi

# 默认翻页工具
export PAGER=less

# man page
# export LESS='-R'
# export MANPAGER='less -R'
export LESS_TERMCAP_so=$'\e[7;34m' # 反白
export LESS_TERMCAP_mb=$'\e[1;31m' # 加粗
export LESS_TERMCAP_md=$'\e[1;32m' # 双加粗
export LESS_TERMCAP_us=$'\e[4;33m' # 下划线
export LESS_TERMCAP_me=$'\e[0m'    # 取消加粗和双加粗
export LESS_TERMCAP_se=$'\e[0m'    # 取消翻拍
export LESS_TERMCAP_ue=$'\e[0m'    # 取消下划线

# export PATH="/home/$USER/.perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="/home/$USER/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/$USER/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/$USER/.perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/$USER/.perl5"

# fzf 配置
export FZF_DEFAULT_OPTS='--border'

# ls 顏色配置
export LS_COLORS='rs=0:di=00;34:ln=01;36:mh=00:pi=00;33:so=01;35:do=01;35:bd=00;33;01:cd=00;33;01:or=00;31;01:mi=00:su=33;31:sg=36;33:ca=00:tw=36;32:ow=34;32:st=33;34:ex=00;36:*.7z=01;31:*.ace=01;31:*.alz=01;31:*.apk=01;31:*.arc=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.cpio=01;31:*.crate=01;31:*.deb=01;31:*.drpm=01;31:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.egg=01;31:*.esd=01;31:*.gz=01;31:*.jar=01;31:*.lha=01;31:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.pyz=01;31:*.rar=01;31:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.udeb=01;31:*.war=01;31:*.whl=01;31:*.wim=01;31:*.xz=01;31:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:';

