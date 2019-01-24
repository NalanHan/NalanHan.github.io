---
title: kali下oracle java安装与字体设置
categories: 操作系统
tags:
  - kali
  - java
  - font
abbrlink: 46a183b4
date: 2018-12-31 13:53:04
---
本文中的操作，都是基于kali 2018.4版本，不排除随着版本更新失效的可能。

# kali下安装oracle java
kali自带的openjdk版本太新了，有些好用的旧软件并不能很好的运行;而且openjdk在某些方面有兼容性的问题,不如oracle官方的java稳定。
因此,在kali里安装oracle的java 8是一个很好的选择.

在这里,采取ubuntu的ppa的方式安装.

## 设置ppa软件源

`vi /etc/apt/sources.list.d/java.list`

添加下面的内容：
<!--more-->
```auto
deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
```
## 添加ppa的key

`apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886`

## 安装oracle java 8

```
apt-get update
apt-get install oracle-java8-installer
```
写本文时最新的java8 版本是191.

这样安装完成后，会自动把oracle java 8设置为系统默认的java。

可以用下面命令查看java的版本：
`java -version`

# 设置java的字体

在kali中，java程序的默认字体极其难看，字体毛边现象十分严重，基本上没法看。

在网上找了大量的中文资料，都是过时的。有些还写的十分认真，但是照着做了之后，一点效果没用。最后还是通过英文搜索找到了答案。在此分享给中文用户。

想让java字体变得好看，有三个步骤。

## 删除65-nonlatin.conf

这个文件位于`/etc/fonts/conf.d`里。此文件不删除，基本上是不可能让java字体变得漂亮的。所以先删除了它。

## 添加关于java字体效果的环境变量

`vi /etc/environment`

添加下面的内容：

`_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'`

上面这条命令请一定添加在`/etc/environment`里，不要添加在`~/.bashrc`里。这么做的目的是让java的字体设置对所有的java程序都有效。

同时，上面的命令还有其他选择，比如


参数 | 描述
---------|----------
off, false, default| No anti-aliasing |
on |	Full anti-aliasing|
gasp| Use the font's built-in hinting instructions |
lcd, lcd_hrgb|Anti-aliasing tuned for many popular LCD monitors|
lcd_hbgr, lcd_vrgb, lcd_vbgr|Alternative LCD monitor setting|

一般来说,使用`gasp`或者`lcd`都可以,根据具体的显示效果来定.

## 设置系统的默认中文字体

这里的默认字体，不是通过控制中心的字体选项来查看的,而是用`fc-match `来查看:

```auto
fc-match sans
fc-match serif
fc-match sans-serif
fc-match monospace
```

在终端里运行上面四条命令,查看默认的中文字体是什么.

对java起作用的是sans字体的默认值.

这里说一个结论:linux下常用的字体中,微软雅黑和noto-cjk这两种中文字体怎么调都没法看,只有文泉驿(wqy)字体的效果最好,所以一定要把文泉设置为默认字体.


通过上面三个步骤,你的java程序的中文字体就很漂亮了.
