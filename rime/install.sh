#! /bin/env bash

RIME=~/.local/share/fcitx5/rime/

[[ ! -d $RIME ]] && mkdir -p $RIME

for yml in *.yaml; do
  cp $yml $RIME
done
