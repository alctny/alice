#! /bin/bash

source_path=$(dirname $(readlink -f "$0"))

ln -sf "$source_path/.alias.ant.sh" ~
ln -sf "$source_path/.env.ant.sh" ~
ln -sf "$source_path/.function.ant.sh" ~
ln -sf "$source_path/.inputrc" ~

cat "$source_path/bashrc" >> ~/.bashrc
