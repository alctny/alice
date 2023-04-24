#! /bin/bash

# 上海时区
timedatectl set-timezone Asia/Shanghai

# base tool
sudo dnf install -y git
sudo dnf install -y vim

# daily tool
sudo dnf install -y flameshot
sudo dnf install -y thunderbird
sudo dnf install -y firefox

# program evnrionment
sudo dnf group install 'C Development Tools and Libraries'
sudo dnf install cmake

# i3wm tool
sudo dnf install -y feh
sudo dnf install -y rofi
sudo dnf install -y caja
sudo dnf install -y picom
sudo dnf install -y ranger
sudo dnf install -y polybar
sudo dnf install -y w3m-image

echo "configure end!!!"

# ------------------------------------------------------

sudo dnf remove -y yelp
sudo dnf remove -y mousepad
sudo dnf remove -y i3status
