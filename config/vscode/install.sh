#! /bin/bash

# see mor info about code manager in terminal:
# https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management

code --extensions-dir ~/.local/share/vscode/extensions

# general
code --install-extension christian-kohler.path-intellisense
code --install-extension Tyriar.sort-lines
# theme
code --install-extension GitHub.github-vscode-theme
code --install-extension illixion.vscode-vibrancy-continued
# icon theme
code --install-extension PKief.material-icon-theme
# hight line
code --install-extension cliffordfajardo.highlight-line-vscode
# csv viewer
code --install-extension GrapeCity.gc-excelviewer
code --install-extension mechatroner.rainbow-csv
# reg support
code --install-extension ionutvmi.reg

# markdown
code --install-extension yzhang.markdown-all-in-one
code --install-extension bierner.markdown-footnotes
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension yzane.markdown-pdf
code --install-extension gera2ld.markmap-vscode

# code tool
# c/cpp
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension twxs.cmake
code --install-extension ms-vscode.makefile-tools
# golang
code --install-extension golang.go
# python
code --install-extension ms-python.python
# rust
code --install-extension rust-lang.rust-analyzer
code --install-extension tamasfe.even-better-toml
code --install-extension vadimcn.vscode-lldb
code --install-extension tauri-apps.tauri-vscode
# fore-ent
code --install-extension ritwickdey.LiveServer
code --install-extension Vue.volar
code --install-extension ecmel.vscode-html-css
code --install-extension xabikos.JavaScriptSnippets
# shell
code --install-extension foxundermoon.shell-format
# version manager
code --install-extension donjayamanne.githistory
code --install-extension mhutchie.git-graph
code --install-extension johnstoncode.svn-scm
code --install-extension sumneko.lua

if [ $(uname -a) = "Gnu/Linux" ]; then
  cp -r settings.json keybindings.json snippets ~/.local/share/Code/User/
fi
