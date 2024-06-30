#! /bin/bash

source_path=$(dirname $(readlink -f "$0"))

mkdir -p ~/.config/fcitx5/conf/
mkdir -p ~/.local/share/fcitx5/themes

ln -sf ${source_path}/classicui.conf  ~/.config/fcitx5/conf/
ln -sf ${source_path}/nord-dark ~/.local/share/fcitx5/themes