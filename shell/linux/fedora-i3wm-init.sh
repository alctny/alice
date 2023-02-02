#! /bin/bash

# 上海时区
timedatectl set-timezone Asia/Shanghai

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
sudo dnf group install 'C Development Tools and Libraries'
# TODO: golang, rust, python, clang, cpp

# coding program
# TODO: VisualStudioCode

# i3wm tool
sudo dnf install -y w3m-image
sudo dnf install -y rofi
sudo dnf install -y polybar
sudo dnf install -y picom
sudo dnf install -y sddm
sudo systemctl disable lightdm.service
sudo systemctl enable sddm.service
sudo dnf install -y nemo
sudo dnf install -y feh
sudo dnf install -y ranger

# flatpak
sudo flatpak install obs
sudo flatpak install xmind
sudo flatpak install steam

# snap

# isn't requair, just cool
sudo dnf install -y neofetch

neofetch

echo "configure end!!!"

# ------------------------------------------------------

sudo dnf remove -y yelp
sudo dnf remove -y mousepad
sudo dnf remove -y lightdm
sudo dnf remove -y i3status 
sudo dnf remove -y firefox