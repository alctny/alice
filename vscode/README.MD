# Visual Studio Code

## 推薦安裝插件列表（Extension ID）

### Rust

* bungcip.better-toml: Toml 文件高亮顯示
* vadimcn.vscode-lldb: Rust 調試用插件
* rust-lang.rust-analyzer: Rust 開發插件，語法高亮和提示插件

### Golang

* golang.go: Golang 開發和調試用插件

### Markdown

* yzhang.markdown-all-in-one: Markdown 語法高亮和其他 Markdown 功能
* DavidAnson.vscode-markdownlint: Markdown 語法標準檢測插件

### Myself

* cliffordfajardo.highlight-line-vscode: 當前光標行高亮線提示
* PKief.material-icon-theme: 更好看的 VSCode 圖標庫
* zhuangtongfa.material-theme： One Dark Pro Theme

## 一些没有列出的设置选项说明

### 自定义文本样式

> 虽然可以注释样式，但是会被主题中的样式覆盖
> 如果使用了主题，则需要单独设置，且设定后部分主题不一定生效

```json
"editor.tokenColorCustomizations": {
  // 默认配置
  "comments": {
    "fontStyle": "",        // 设置字体样式
    "foreground": "#867171" // 设置字体颜色
  },
  "keywords": "#0a0",         // 关键字
  "variables": "#f00",        // 变量名
  "strings": "#e2d75dbd",     // 字符串
  "functions": "#5b99fcc9",   // 函数名
  "numbers": "#AE81FF",       // 数字

  "[Angular Dark Theme]": {// 单独设定某个主题
    "comments":{
      "fontStyle": "",
      "foreground": "#867171"
    },
    "keywords": "#0a0",
    "variables": "#f00",
    "strings": "#e2d75dbd",
    "functions": "#5b99fcc9",
    "numbers": "#AE81FF"
  }
}
```

### Windows 下修改终端默认值为 Git Bash

在 `terminal.integrated.profiles.windows` 中可以配置终端列表，而通过不同的名字配置不同的终端（同一个 shell 可以重复配置）。`path` 参数指定 shell 路径，`args` 指定启动时候的参数。然后通过 `terminal.integrated.defaultProfile.windows` 选择默认开启终端。保存配置后重启终端即可（如果之前已经打开了其他终端程序需要先关闭）。

```json
"terminal.integrated.profiles.windows": {
    "git-bash": {
      "path": "D:\\env\\git\\usr\\bin\\bash.exe",
      "args": ["-i", "-l"]
    }
},
"terminal.integrated.defaultProfile.windows": "git-bash",
```
