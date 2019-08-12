---
title: Xubuntu 18.04使用设置
categories: 操作系统
tags: xubuntu
abbrlink: 19337d22
date: 2019-08-12 14:45:41
---

电脑比较旧了，Intel I5-4790 的 CPU。在使用 ubuntu18.04 的时候，总是感觉 gnome 使用起来不流畅，有些拖延和卡顿，于是换用 xubuntu 18.04。

从目前的使用体验来看，非常满意，用着比 ubuntu 顺手。

下面记录一下使用 xubuntu 的一些设置和调整。

## 输入法

xubuntu 默认安装 fcitx 输入法，并且配置好了 fcitx-qimpanel 的三套皮肤。

fcitx-qimpanel 所带的皮肤位于`/usr/share/fcitx-qimpanel/skin/`，如果想修改字体，需要在这里修改。

## 字体配置

看我写的[这篇文章](https://www.yufael.com/posts/b52a3d62.html)。里面介绍的非常清楚了，不会的话直接抄配置就可以。

## 高分辨率屏幕（Hi-DPI）设置

其实就是修改`设置-外观-字体`下面的 dpi，嫌字体小就把 dpi 调大一点。

## 更改快捷键

在`设置-键盘-应用程序快捷键`里调整，一目了然。

需要注意的是显示桌面这个快捷键，是在`设置-窗口管理器-键盘`里调整的，默认是 ctrl+alt+D。

## 主题

推荐使用 parrot 的主题，虽然是用于 mate 桌面，但是 xubutu 可以完美使用。

下载址：[parrot-themes](https://github.com/ParrotSec/parrot-themes)。

## 交换 ctrl 和 caps

xubuntu 没有比较方便的更改按键的工具，比如交换 ctrl 和 caps。

可以使用配置文件修改：
1、打开`/etc/default/keyboard`

`sudo vi /etc/default/keyboard`

2、修改`XKBOPTIONS`这一项，添加`ctrl:swapcaps`来交换 ctrl 和 caps，如下：

`XKBOPTIONS="ctrl:swapcaps"`

3、然后运行`sudo dpkg-reconfigure keyboard-configuration`来保存配置。

注意，在保存配置时，问到是否使用新的配置时，选择是。
