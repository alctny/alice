#! /bin/bash

# 上海时区
timedatectl set-timezone Asia/Shanghai

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

# i3wm tool
sudo dnf install -y w3m-image
sudo dnf install -y rofi
sudo dnf install -y polybar
sudo dnf install -y picom
sudo dnf install -y nemo
sudo dnf install -y feh
sudo dnf install -y ranger

echo "configure end!!!"

# ------------------------------------------------------

sudo dnf remove -y yelp
sudo dnf remove -y mousepad
sudo dnf remove -y i3status