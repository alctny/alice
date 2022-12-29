#! /bin/bash

sudo dnf update -y
sudo dnf install -y fcitx5 fcitx5-gtk fcitx5-qt kcm-fcitx5 fcitx5-chinese-addons fcitx5-table-extra fcitx5-rime
# set input
cat <<EOF >>~/.bashrc
export INPUT_METHOD=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
EOF
# autostart
if [ ! -d ~/.config/autostart ]; then
  mkdir ~/.config/autostart
fi
ln -s /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart/
# configure rime input
if [ ! -d ~/.share/fcitx5/rime ]; then
  mkdir -p ~/.share/fcitx5/rime
fi
cp -r ../rime/* ~/.share/fcitx5/rime/
# select and add chinese input method by self
fcitx-configtool
