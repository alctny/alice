#! /bin/bash

source_path=$(dirname $(readlink -f "$0"))

ln -sf ${source_path}/.gitconfig ~/