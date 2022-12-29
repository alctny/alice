# Visual Studio Code 配置说明

## 自定义文本样式

> 虽然可以注释样式，但是会被主题中的样式覆盖
> 如果使用了主题，则需要单独设置，且部分主题下无法生效

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