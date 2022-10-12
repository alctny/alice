# Ant's Config

> 一个懒人的各种配置文件和一个还没有写的自动部署脚本罢了

- [Ant's Config](#ants-config)
  - [Visual Studio Code](#visual-studio-code)
    - [各配置文件所在目录](#各配置文件所在目录)
    - [插件列表](#插件列表)
  - [Rime](#rime)
  - [Windows Terminal](#windows-terminal)
    - [几点说明](#几点说明)
  - [相关资源下载地址](#相关资源下载地址)
    - [字体](#字体)
    - [Windows Terminal 在线配色方案网站](#windows-terminal-在线配色方案网站)

## Visual Studio Code

### 各配置文件所在目录

> `ROOT_PATH` 在不同平台下的取值:  
> `Linus`: ~/.config  
> `Windows`: ~/AppData/Roaming

- Linux
  - 用户配制: `ROOT_PATH/Code/User/settings.json`
  - 快捷键配制: `ROOT_PATH/Code/User/keybindings.json`
  - 自定义代码片段: `ROOT_PATH/Code/User/snippets/*.json`
- Windows
  - 用户配置(全局配置): `ROOT_PATH/Code/User/settings.json`
  - 快捷键配置: `ROOT_PATH/Code/User/keybindings.json`
  - 自定义代码片段: `ROOT_PATH/Code/User/snippets/*.json`

### 插件列表

在本項目的 **vscode** 目錄下有一個名爲 **my-config.code-workspace** 的文件，是一個 VSCode 的工作空間文件，使用 VScode 打開該文件即可在 VSCode 中打開本項目（命令:`code my-config.code-workspace`）。該工作空間已經設置了推薦的插件列表和不要推薦的插件列表（語言包），打開之後 VSCode 會自動推薦你添加擴展，只需要點擊下載即可。或者在擴展頁面的搜索欄輸入 `@recommended` 即可看到本工作空間的推薦擴展列表。

## Rime

> 关于 Rime 的配置只是最简单的配置,想要获取更好的配置可直接 clone 仓库 [ssnhd/rime](https://github.com/ssnhd/rime)  
> ⚠️: 该仓库文件内容并不多，但 commit 次数很多，所以整体体积很大。考虑到并不需要查看其提交记录，因此在 clone 的时候添加 `--dep=1` 参数为佳。

配制文件所在地址

- Windows: `~/AppData/Roaming/Rime`
- Linus
  - ibus: `~/.config/ibus/rime/`
  - fcitx: `~/.config/fcitx/rime/`

## Windows Terminal

### 几点说明

1. Windows Terminal 集成 Git Bash 存在中文乱码问题,添加 `-i -l` 参数可解决.详情可参考文章: [Windows Terminal修复Git Bash中文乱码&添加WT到右键菜单](https://zhuanlan.zhihu.com/p/166407830)
2. `ms-appdata:///local/` 指向的路径是为配置文件所所在路径
3. 几个不错的其他字体: *Fira Code*，*JetBrains Mono Thin*，*IBM 3270*
4. Windows Terminal 配制文件所在目录为：`~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json`

## 相关资源下载地址

### 字体

- IBM 3270 Fonts: <https://github.com/rbanffy/3270font>
- Fira Code: <https://github.com/tonsky/FiraCode>
- JetBrains Mono Fonts: <https://www.jetbrains.com/lp/mono/>

### Windows Terminal 在线配色方案网站

- Windows Terminal Themes: <https://windowsterminalthemes.dev/>
- Terminal Splash: <https://terminalsplash.com/>
