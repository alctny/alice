# Ant's Config

> 一个懒人的各种配置文件和一个还没有写的自动部署脚本罢了
>
> 目录经过多次调整，以下大部分目录已经失效，待更新

- [Ant's Config](#ants-config)
  - [Visual Studio Code](#visual-studio-code)
    - [各配置文件所在目录](#各配置文件所在目录)
    - [插件列表](#插件列表)
  - [Rime](#rime)
  - [Windows Terminal](#windows-terminal)
    - [几点说明](#几点说明)
  - [Sublime Text](#sublime-text)
  - [相关资源下载地址](#相关资源下载地址)
    - [字体](#字体)
    - [Windows Terminal 在线配色方案网站](#windows-terminal-在线配色方案网站)

目录结构：

- config: 现成可用的配置文件
- shell: 软件安装和其他辅助脚本
- resousrce: 外部文件，如壁纸，字体，主题等

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

> 对于 Rime 明月拼音输入法的配置主要参考 [ssnhd/rime](https://github.com/ssnhd/rime) 修改而来，而五笔则主要使用 [官方](https://github.com/rime/rime-wubi) 的配置。  
> ⚠️: [ssnhd/rime](https://github.com/ssnhd/rime) 仓库文件内容并不多，但 commit 次数很多，导致项目整体体积很大。考虑到并不需要查看其提交记录，因此在 git clone 的时候最好添加 `--dep=1` 参数或从网页只下载配置文件，不下载 .git 文件。

配制文件所在地址

- Windows: `~/AppData/Roaming/Rime`
- Linus
  - ibus: `~/.config/ibus/rime/`
  - fcitx: `~/.local/share/fcitx/rime/`
  - fcitx5: `~/.local/share/fcitx5/rime/`

## Windows Terminal

### 几点说明

1. Windows Terminal 集成 Git Bash 存在中文乱码问题,添加 `-i -l` 参数可解决.详情可参考文章: [Windows Terminal修复Git Bash中文乱码&添加WT到右键菜单](https://zhuanlan.zhihu.com/p/166407830)
2. `ms-appdata:///local/` 指向的路径是为配置文件所所在路径
3. 几个不错的其他字体: *Fira Code*，*JetBrains Mono Thin*，*IBM 3270*
4. Windows Terminal 配制文件所在目录为：`~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json`

## Sublime Text

Sublime Text 配置文件所在目录：

- Windows: `C:\Users\USER_NAME\AppData\Roaming\Sublime Text\Packages\User\Preferences.sublime-settings`

---

## 相关资源下载地址

### 字体

- IBM 3270 Fonts: <https://github.com/rbanffy/3270font>
- Fira Code: <https://github.com/tonsky/FiraCode>
- JetBrains Mono Fonts: <https://www.jetbrains.com/lp/mono/>

### Windows Terminal 在线配色方案网站

- Windows Terminal Themes: <https://windowsterminalthemes.dev/>
- Terminal Splash: <https://terminalsplash.com/>
