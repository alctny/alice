#! /bin/bash

source_path=$(dirname $(readlink -f "$0"))

ln -sf "$source_path/alias.ant.sh" /etc/profile.d/
ln -sf "$source_path/env.ant.sh" /etc/profile.d/
ln -sf "$source_path/function.ant.sh" /etc/profile.d/

