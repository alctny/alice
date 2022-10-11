# Ant's Config

> 一个懒人的各种配置文件和一个还没有写的自动部署脚本罢了

- [Ant's Config](#ants-config)
  - [Visual Studio Code](#visual-studio-code)
    - [各配置文件所在目录](#各配置文件所在目录)
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

## Rime

> 关于 Rime 的配置只是最简单的配置,想要获取更好的配置可直接 clone 仓库 [ssnhd/rime](https://github.com/ssnhd/rime)  
> ⚠️: 该仓库文件内容并不大，但 commit 次数很多，因此整体体积很大，考虑到并不需要查看其提交记录，因此在 clone 的时候添加 `--dep=1` 参数为佳

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
