#! /bin/bash

# base package
sudo dnf install -y fcitx5                  # fcitx5 base package 
sudo dnf install -y fcitx5-gtk              # fcitx for gtk program
sudo dnf install -y fcitx5-qt               # fcitx for qt program
sudo dnf install -y kcm-fcitx5              # fcitx on kde environment
sudo dnf install -y fcitx5-chinese-addons   # fcitx chinese input method addons
sudo dnf install -y fcitx5-rime             # rime input
sudo dnf install -y fcitx5-table-extra      # i forget

# set input evnrionment
cat << EOF >> ~/.bashrc
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

# select and add chinese input method by self
fcitx5-configtool
