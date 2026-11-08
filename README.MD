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
# 個人工具
go install github.com/itchyny/bed@latest            # 二進制文本編輯器
go install github.com/schollz/croc/v10@latest       # 局域網文件傳輸工具
go install github.com/muesli/duf@latest             # du 命令的可視化版本
go install github.com/charmbracelet/glow@latest     # 更好的 markdown 預覽
go install github.com/b4b4r07/gomi@latest           # 具備回收站功能的 rm
go install github.com/charmbracelet/gum@latest      # 爲 shell 提供更好的交互效果
go install github.com/jesseduffield/lazygit@latest  # Lazygit 無須多言
go install github.com/gokcehan/lf@latest            # 終端文件管理工具
go install github.com/boyter/scc/v3@latest          # 代碼統計工具,比 cloc 更加人性化一些
go install github.com/maaslalani/slides@latest      # 終端演示工具(terminal 中演示PPT)
go install github.com/schachmat/wego@latest         # 獲取天氣

# 開發
go install github.com/go-delve/delve/cmd/dlv@latest # Golang debug 工具
go install github.com/ondrajz/go-callvis@latest     # 生成 Golang 函數調用關係圖
go install github.com/kisielk/godepgraph@latest           # 生成 Go 包依赖关系图, Graphviz 依賴
go install github.com/fatih/gomodifytags@latest           # 批量修改结构体字段的标签
go install github.com/haya14busa/goplay/cmd/goplay@latest # Go Playground 的命令行客户端
go install golang.org/x/tools/gopls@latest                # Go 官方语言服务器
go install github.com/cweill/gotests@latest               # 自动生成表驱动测试
go install github.com/josharian/impl@latest               # 生成接口实现的方法存根
go install github.com/mgechev/revive@latest               # 快速、可配置的 Go 代码检查器（linter）
go install honnef.co/go/tools/cmd/staticcheck@latest      # 高级静态分析工具
go install golang.org/x/tools/cmd/goimports@latest        # 自动导入工具


# go install github.com/chmln/sd@latest
go install github.com/taigrr/spank@latest # 讓 MacBook 發出令人面紅耳赤的呻吟
```

### cargo install

```bash
cargo install du-dust           # 更好看的 du
cargo install exa               # 更好看的 ls
cargo install fd-find           # 更好看的 find
cargo install ripgrep           # 更好看的 grep
cargo install gping             # 可視化的 ping
cargo install zoxide --locked   # 更好用的 cd
cargo install bat    --locked   # 彩色的 cat
cargo install --locked omnidiff # 更強大的對比工具
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
| [unar](https://theunarchiver.com/command-line)               | 自動編碼檢測的解壓命令行解壓軟件,可以避免中文解壓亂碼 |

```bash
brew install poppler
brew install p7zip
brew install unar
brew install ffmpeg
brew install jq
brew install resvg
brew install imagemagick
brew install fzf
```
