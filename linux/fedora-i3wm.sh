#! /bin/bash

# 使用清华源

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

# base tool
sudo dnf install -y git
sudo dnf install -y vim
sudo dnf install -y emacs

# daily tool
sudo dnf install -y flameshot
sudo dnf install -y thunderbird
sudo dnf install -y chromium

# program evnrionment
# TODO: 
#   - golang
#   - rust
#   - python
#   - clang
#   - cpp

# coding program
# TODO
#   - Visual Studio Code

# i3wm tool
sudo dnf install -y w3m-image
sudo dnf install -y rofi
sudo dnf install -y polybar
sudo dnf install -y picom

# flatpak
sudo flatpak install obs
sudo flatpak install xmind
sudo flatpak install steam

# snap

# isn't requair, just cool
sudo dnf install -y neofetch

neofetch

echo "configure end!!!"