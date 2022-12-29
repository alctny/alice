#! /bin/bash

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

# office repotory
sudo dnf install -y flameshot
sudo dnf install -y vim
sudo dnf install -y emacs
sudo dnf install -y neofetch
sudo dnf install -y thunderbird

# flatpak
sudo flatpak install obs
sudo flatpak install xmind
sudo flatpak install steam

# snap

# 使用清华源

bash fcitx5-chinese-input.sh
neofetch
