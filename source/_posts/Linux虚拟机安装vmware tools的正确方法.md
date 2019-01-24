---
title: Linux虚拟机安装vmware tools的正确方法
categories: 软件应用
tags: vmware
abbrlink: 1e4f9aaa
date: 2018-05-16 08:42:09
---
vmware对Linux虚拟机的显卡驱动支持可以说是最完善的，不但有二进制编译包可用，开源的open-vm-tools也走进了各大主流的Linux发行版。

但是我从来都是使用官方的二进制包来安装，宁可麻烦点也不愿用开源vmware驱动，主要是因为我发现使用开源驱动后，桌面依然不能自适应分辨率，无法全屏，无法和Host拖文件分享，安装了开源驱动和不安一个样。

直到有一天我发现，一直以来我误会open-vm-tools了，出现上述问题是因为开源驱动没安装完整。

只安装open-vm-tools是不行的，还需要安装open-vm-tools-desktop才可以。这样才是完整的vmware开源驱动的安装方法。有些发行版还会提供open-vm-tools-dkms，请一并安装上。

在ubuntu下安装：

```bash
sudo apt install open-vm-tools open-vm-tools-desktop open-vm-tools-dkms

```
