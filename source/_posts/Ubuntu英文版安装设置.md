---
title: Ubuntu英文版使用指南
categories: 操作系统
tags:
  - ubuntu
  - font
abbrlink: a8dea4d2
date: 2019-01-15 16:35:57
---

之所以要使用英文版的 Ubuntu 操作系统，原因有两个：
1、锻炼自己的英文水平
2、ubuntu 英文版的字体渲染，无论是渲染英文字体还是中文字体，都比中文版的要漂亮很多。

下面以 ubuntu 18.04 为例，介绍一些相关的设置。

# 系统字体设置

看我写的[这篇文章](https://www.yufael.com/posts/b52a3d62.html)

# 中文输入法设置

在 Ubuntu 下可以正常使用 fcitx 输入法。

## 安装 fcitx

`sudo apt install fcitx fcitx-table-wbpy`

## 设置 fcitx

1、打开`Settings`-->`Region & Language`-->`Manage Installed Language`，在最下方的
`Keyboard input method system`里，选中 fcitx：
![system-input-method](../images/Ubuntu英文版使用指南/system-input-method.png)

然后**重启操作系统**，不然会打不开 fcitx 输入法设置。

2、 在 fcitx 里添加中文输入法，比如 wbpy（五笔拼音）。
![fcitx-add-input-method](../images/Ubuntu英文版使用指南/fcitx-add-input-method.png)

安装完毕，可以像中文版系统一样使用 fcitx，没有任何区别。

# 系统美化设置

美化也就是设置主题、图标、壁纸之类的东西，漂亮的主题让人心情愉悦，间接提高工作效率。

## 必备的插件

1、安装`chrome-gnome-shell`
`sudo apt install chrome-gnome-shell`
这个是必备的，没有这个软件，使用 firefox 无法在线安装扩展。不要被名字欺骗，firefox 也是用这个。

2、 安装`User Themes`
[安装地址](https://extensions.gnome.org/extension/19/user-themes/)
这个也是必备的，用来在`gnome-tweaks`里更改`shell`主题。

3、 安装`Dash to Panel`
[下载地址](https://extensions.gnome.org/extension/1160/dash-to-panel/)
这个基本上算是必备的，作用是把左侧 dash 和上方的菜单栏挪到底部并统一起来，看下图：
![dash to panel](../images/Ubuntu英文版使用指南/dash-to-panel.png)

## 主题和图标

1.  主题：[Ant-Nebula](https://github.com/EliverLara/Ant-Nebula)
    这个主题色彩明快，对比分明，右上角三个图标是仿 mac 格式的。
2.  图标：[Vimix](https://github.com/vinceliuice/vimix-icon-theme)
    这个图标算是还满意吧，没找到更好看的前先用它。
