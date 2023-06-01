#! /bin/bash

repo_path=$(dirname $(readlink -f $0))
home_path=/home/$USER

# i3
ln -s ${repo_path}/config/i3 ${home_path}/.config/i3

# polybar
ln -s ${repo_path}/config/polybar ${home_path}/.config/polybar

# flameshot
ln -s ${repo_path}/config/flameshot ${home_path}/.config/flameshot

# rofi
ln -s ${repo_path}/config/rofi ${home_path}/.config/rofi

# bash
ln -s ${repo_path}/config/bash/alias.ant ${home_path}/.alias.ant
ln -s ${repo_path}/config/bash/env.ant ${home_path}/.env.ant
ln -s ${repo_path}/config/bash/function.ant ${home_path}/.function.ant
ln -s ${repo_path}/config/bash/bashrc ${home_path}/.bashrc
ln -s ${repo_path}/config/bash/inputrc ${home_path}/.inputrc

# git
ln -s ${repo_path}/config/git/gitconfig ${home_path}/.gitconfig

# vscode
ln -s ${repo_path}/config/vscode/snippets ${home_path}/.config/Code/User/snippets
ln -s ${repo_path}/config/vscode/settings.json ${home_path}/.config/Code/User/settings.json
ln -s ${repo_path}/config/vscode/keybindings.json ${home_path}/.config/Code/User/keybindings.json

# rime
ln -s ${repo_path}/config/rime ${home_path}/.local/share/fcitx5/rime
