#! /bin/bash

git clone --depth=1 https://framagit.org/MarianArlt/sddm-sugar-candy.git
git clone --depth=1 https://github.com/yeyushengfan258/BigSur-icon-theme.git
git clone --depth=1 https://github.com/vinceliuice/WhiteSur-gtk-theme.git

wget https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.304.zip
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip

tar -xf font/fira_code.tar.gz -C font
tar -xf font/jetbrain-mono.tar.gz -C font

sudo cp -r /font/* /usr/local/share/fonts/

tar -xf theme/BIgSur-icon-theme.tar.gz -C theme
tar -xf theme/sddm-sugar-candy.tar.gz -C theme
tar -xf theme/WhiteSur-gtk-theme.tar.gz -C theme
