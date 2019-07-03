---
title: Deepin安装nodejs和npm
abbrlink: 88ba13f2
date: 2019-07-03 10:40:44
categories: 操作系统
tags: [deepin,nodejs]
---
最新版本的deepin是基于`debian stable`的，官方的安装方法不再支持，所以在`nodejs`和`npm`的安装上和ubuntu有一些区别。
# 安装nodejs和node
```
sudo apt install node nodejs
```
在这里，安装`node`这个软件包，是为了提供`npm`这个命令工具。
debian和ubuntu不同，没有提供单独的npm包，而是在`node`这个软件包里提供的。

# 修改源和使用`n`来提供升级
参考[这篇文章](https://www.yufael.com/posts/f982b26b.html)
