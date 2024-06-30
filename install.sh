#! /bin/bash
#

source_path=$(dirname $(readlink -f "$0"))

ln -sf ${source_path}/ranger /etc/

ln -sf ${source_path}/i3                 ~/.config/
ln -sf ${source_path}/rofi               ~/.config/
ln -sf ${source_path}/joshuto            ~/.config/
ln -sf ${source_path}/polybar            ~/.config/
ln -sf ${source_path}/flameshot          ~/.config/
ln -sf ${source_path}/xdg/user-dirs.dirs ~/.config/

ln -sf ${source_path}/gtk                ~/.config/gtk
ln -sf ${source_path}/gtk                ~/.config/gtk-2.0
ln -sf ${source_path}/gtk                ~/.config/gtk-3.0
ln -sf ${source_path}/gtk                ~/.config/gtk-4.0

ln -sf ${source_path}/tmux/.tmux.conf ~/
ln -sf ${source_path}/git/.gitconfig  ~/

ln -sf ${source_path}/ssh/config      ~/.ssh/

cd bash
bash install.sh

unset source_path