# Windows 配置說明

## 腳本說明

- [disable_application_connect_network.bat](./disable_application_connect_network.bat): 禁止應用聯網
- [windows_natual_scrolling.ps1](./windows_natual_scrolling.ps1): 啓用 Windows 鼠標自然捲動

## Windows Terminal

1. Windows Terminal 集成 Git Bash 存在中文乱码问题,添加 `-i -l` 参数可解决.详情可参考文章: [Windows Terminal修复Git Bash中文乱码&添加WT到右键菜单](https://zhuanlan.zhihu.com/p/166407830)
2. `ms-appdata:///local/` 指向的路径是为配置文件所所在路径
3. 几个不错的其他字体: *Fira Code*，*JetBrains Mono Thin*，*IBM 3270*
4. Windows Terminal 配制文件所在目录为：`~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json`

## 參考鏈接

- [Windows Terminal修复Git Bash中文乱码&添加WT到右键菜单](https://zhuanlan.zhihu.com/p/166407830)
