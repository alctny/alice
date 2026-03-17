# Ant's Config

## 外部網站

### 字體

|字體|描述|
| -- | -- |
| [IBM 3270 Fonts](https://github.com/rbanffy/3270font) | 上世紀像素風風格 |
| [Fira Code](https://github.com/tonsky/FiraCode) |  開發者友好，支持連體字 |
| [JetBrains Mono Fonts](https://www.jetbrains.com/lp/mono) | JetBrains 推出的免費字體，同 size 比 FiraCode 略大 |
| [Recursive](https://www.recursive.design) | 開發者友好，但是更像手寫體，同時中文的等寬也很好 |
| [NerdFont](https://www.nerdfonts.com) | 一些字體的 icon 擴展版本，終端用戶友好 |

### 主題

| 對象                                            | 描述                                                        |
| ----------------------------------------------- | ----------------------------------------------------------- |
| [Terminal Splash](https://terminalsplash.com)   | Windows Terminal 主題，有預覽圖，主題很多                   |
| [Dracula Theme](https://draculatheme.com)       | Dracula 配色的各種主題，包含 VSCode、GTK、Kitty Terminal 等 |
| [Gnome Look](https://www.gnome-look.org/browse) | 主要是 Gnome 的各種主題，如 GTK、GRUB、GMD 等               |
| [KDE store](https://store.kde.org/browse)       | 主要是 KDE 的各種主題，如 SDDM、Cursor 等                   |

## 工具推薦

### go install


```bash
go install https://github.com/babarot/gomi@latest     # rm 替代品, 自動放置到回收站
go install github.com/jesseduffield/lazygit@latest    # git 管理
go install github.com/boyter/scc/v3@latest            # 代碼統計工具,比 cloc 更好用
go install github.com/charmbracelet/glow/v2@latest    # markdown 閱讀工具
go install github.com/maaslalani/slides@latest        # 在終端通過 markdown 編寫和分享 PPT
go install github.com/schollz/croc/v10@latest         # 終端文件傳輸工具，但是需要雙方都安裝了 croc
go install github.com/mgechev/revive@latest           # golang 靜態檢查工具
go install github.com/ofabry/go-callvis@latest        # golang 函數調用關係分析工具
go install github.com/kisielk/godepgraph@latest       # golang 函數調用關係分析工具
```

### cargo install

```bash
cargo install du-dust         # 更好看的 du
cargo install exa             # 更好看的 ls
cargo install fd-find         # 更好看的 find
cargo install ripgrep         # 更好看的 grep
cargo install gping           # 可視化的 ping
cargo install zoxide --locked # 更好用的 cd
cargo install bat    --locked # 彩色的 cat
```

### manual

| 工具                                                         | 描述                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [fzf](https://github.com/junegunn/fzf/releases)              | 查詢工具，可以提供更好的命令行查詢，以及配合 zoxide          |
| [yazi](https://github.com/sxyazi/yazi/releases)              | 終端文件管理工具                                             |
| [ffmpeg](https://www.ffmpeg.org/download.html)               | 音視頻處理工具，既是 mpv 部分功能需要，也可以用於日常部分簡單的視頻處理任務 |
| [Image Magick](https://imagemagick.org/script/download.php#gsc.tab=0) | 圖片處理工具                                                 |
| [7zip](https://www.7-zip.org/download.html)                  | 壓縮和解壓工具，Linux 版需要手動安裝，軟件倉庫中的版本無法解壓私有協議的 rar 包 |
| [jq](https://jqlang.org/)                                    | JSON 命令行解析工具                                          |
| [Poppler](https://gitlab.freedesktop.org/poppler/poppler)    | PDF 預覽工具，主要配合 yazi 使用                             |
| [resvg](https://github.com/linebender/resvg/releases)        | SVG 預覽工具，主要配合 yazi 使用                             |
| [httpie](https://httpie.io/cli)                              | 命令行 HTTP Client 工具，比 cutl 更好用 |
