#! /bin/bash

# base package
sudo dnf install -y fcitx5                  # fcitx service
sudo dnf install -y fcitx5-gtk              # support for gtk program
sudo dnf install -y fcitx5-qt               # support for qt program
sudo dnf install -y fcitx5-rime             # rime input
sudo dnf install -y fcitx5-configtool        # config by gui tool
# sudo dnf install -y kcm-fcitx5              # fcitx5-configtool but kde version
# sudo dnf install -y fcitx5-chinese-addons   # fcitx chinese input method addons
# sudo dnf install -y fcitx5-table-extra      # i forget

# set input evnrionment
cat << EOF >> ~/.bashrc
export INPUT_METHOD=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
EOF

# autostart
# if [ ! -d ~/.config/autostart ]; then
#   mkdir ~/.config/autostart
# fi
# ln -s /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart/
# cat << EOF >> ~/.i3/conf
# exec --no-startup-id fcitx5
# EOF

# select and add chinese input method by self
fcitx5-configtool
