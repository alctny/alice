# Fcitx5

## 環境變量

使用 Fcitx5 輸入中文需要額外的環境變量配置：

```bash
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=fcitx
```

## 主題配置

Fcitx5 的配置文件在 `~/.config/fcitx5/classicui.conf` 但是主題文件需要存放在目錄 `~/.local/share/fcitx5/themes`，且 `classicui.conf` 的 `Theme` 字段值爲主題的目錄名，而非主題下 `theme.conf` 中的 `Name` 字段值。

## 額外插件

如果安裝了 Fcitx5 和 fcitx5-rime 還是無法使用中文輸入法有可能是因爲缺乏對應的程序支持，可以安裝對應的前端支持（對應的包名在不同發行版中可能有所不同，此處以 Debian 爲例）：

```bash
apt install kde-config-fcitx5     # Fcitx5 內嵌到系統配置裏面的 Fcitx5 配置面版
apt install fcitx5-frontend-gtk2  # GTK2 程序支持
apt install fcitx5-frontend-gtk3  # GTK3 程序支持
apt install fcitx5-frontend-qt5   # QT5 程序支持
apt install fcitx5-frontend-qt6   # QT6 程序支持
apt install fcitx5-frontend-tmux  # tmux 支持
```
