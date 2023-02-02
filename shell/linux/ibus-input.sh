#! /bin/bash

sudo dnf install ibus ibus-rime

cat << EOF >> ~/.bashrc
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -x -d
EOF

if [ ! -d ~/.config/ibus/rime ]; then
  mkdir -p ~/.config/ibus/rime
fi
