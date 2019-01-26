---
title: 解决manjaro用vscode替代nautilus的问题
date: 2019-01-26 08:51:22
categories: 操作系统
tags:[manjaro,vscode]
---

在 manjaro 下安装完 vscode 后，发现打开文件夹的默认程序从`nautilus`变成了 vscode 了。一番搜索，找到了解决方案：

# 修改 mineapps.list

`vi ~/.config/mimeapps.list`
在`[default Applications]`下添加一行：
`inode/directory = org.gnome.Nautilus.desktop`

问题解决
