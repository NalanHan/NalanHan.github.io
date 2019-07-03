---
title: Deepin 15.10交换ctrl和caps
abbrlink: fedbf5d6
date: 2019-07-03 10:37:17
categories: 操作系统
tags: deepin
---
Deepin采用自己的dde窗口管理器，没有像ubuntu里的gnome-tweaks一样，提供图形界面的交换ctrl和caps的方法，不过可以用一条命令达到同样的目的。
```
gsettings set com.deepin.dde.keyboard layout-options '["ctrl:swapcaps"]'
```
重启后一样有效。