#! /bin/env bash

RIME=~/.local/share/fcitx5/rime/

[[ ! -d $RIME ]] && mkdir -p $RIME

for yml in *.yaml; do
  sp=$(readlink -f $yml)
  ln -sf $sp $RIME
done
