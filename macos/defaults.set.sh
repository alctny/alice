#!/bin/zsh

# 位置: left bottom right
defaults write com.apple.dock "orientation" -string "bottom"
# 图标大小
defaults write com.apple.dock "tilesize" -int "36"
# 自动隐藏
defaults write com.apple.dock "autohide" -bool "true" && killall Dock
# 自动隐藏动画时长
defaults write com.apple.dock "autohide-time-modifier" -float "0.5" && killall Dock
# 自动隐藏触发时长
defaults write com.apple.dock "autohide-delay" -float "0.2" && killall Dock
# 显示最近使用的程序
defaults write com.apple.dock "show-recents" -bool "true" && killall Dock
# 窗口最小化动作 scale genie suck
defaults write com.apple.dock "mineffect" -string "genie" && killall Dock
# 仅显示打开的应用
defaults write com.apple.dock "static-only" -bool "true" && killall Dock
# 通过滚轮切换应用
defaults write com.apple.dock "scroll-to-open" -bool "true" && killall Dock

# 阴影
defaults write com.apple.screencapture "disable-shadow" -bool "false"
# 文件名包含日期
defaults write com.apple.screencapture "include-date" -bool "true"
# 文件存储路径
defaults write com.apple.screencapture "location" -string "~/Desktop" && killall SystemUIServer
# 显示缩略图
defaults write com.apple.screencapture "show-thumbnail" -bool "true"
# 文件格式
defaults write com.apple.screencapture "type" -string "png"

# 显示完整 URL
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true" && killall Safari

# 显示扩展
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder
# 显示隐藏文件
defaults write com.apple.finder "AppleShowAllFiles" -bool "false" && killall Finder
# 显示当前路径
defaults write com.apple.finder "ShowPathbar" -bool "true" && killall Finder
# 默认视图类型 clmv Nlsv glyv icnv
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv" && killall Finder
# 优先显示目录
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder
# 按住 Cmd 双击文件夹显示在新窗口/tab打开
defaults write com.apple.finder "FinderSpawnTab" -bool "true" && killall Finder
# 默认搜索 SCcf SCsp SCev
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" && killall Finder
# 30 天自动清空废纸篓
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true" && killall Finder
# 修改文件后缀名时提示
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "true" && killall Finder
# 默认保存到 iCloud
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
# 是否在标题栏显示文件夹的图标
# defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "false" && killall Finder
# 光标移动到标题栏延迟显示图标的时长
# defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0.5" && killall Finder
# 侧边栏图标大小
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1" && killall Finder

# 排序是目录在先
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true" && killall Finder
# 隐藏所有桌面图标
defaults write com.apple.finder "CreateDesktop" -bool "true" && killall Finder
# 显示硬盘图标
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false" && killall Finder
# 显示外部磁盘
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "false" && killall Finder
# 显示可插拔媒体设备
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "false" && killall Finder
# 显示连接的服务
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "false" && killall Finder

# 时钟的分隔符是否闪烁
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "false" && killall SystemUIServer
# 日期格式
# ss for seconds.
# HH for 24-hour clock.
# EEE for 3-letter day of the week.
# d MMM for day of the month and 3-letter month.
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""

# 自动排列
defaults write com.apple.dock "mru-spaces" -bool "true" && killall Dock
# 按照应用分组
defaults write com.apple.dock "expose-group-apps" -bool "true" && killall Dock
# 自动打开应用所在 workspace
defaults write NSGlobalDomain "AppleSpacesSwitchOnActivate" -bool "true" && killall Dock
