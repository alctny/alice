# Windows Terminal 配置说明

## 配置默认终端

- `terminal.integrated.profiles.windows` 中可以配置 shell 列表
  - `path` 参数指定 shell 路径
  - `args` 指定启动时候的参数
- `terminal.integrated.defaultProfile.windows` 选择默认 shell

```json
"terminal.integrated.profiles.windows": {
    "git-bash": {
      "path": "D:\\env\\git\\bin\\bash.exe",
      "args": ["-i", "-l"]
    }
},
"terminal.integrated.defaultProfile.windows": "git-bash",
```
