#! /bin/bash

bash shell/extension.sh
bash shell/keybinding.sh
bash shell/snippet.sh

# add function to bash use for create new workspace

echo <<EOF >>~/.bashrc
function codews() {
  echo "create workspace: $1"
  if [ -d .vscode ]; then
    mkdir .vscode
  fi
  cp "~/.local/share/vscode/workspace/$1.code-workspace" .vscode/
}
EOF


