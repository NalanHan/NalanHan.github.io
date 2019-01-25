---
title: manjaro下安装vmware workstation
categories: 操作系统
tags: 'vmware,manjaro,kernel'
abbrlink: 72c3c316
date: 2019-01-25 14:17:30
---

在 manjaro linux 下，可以通过 aur 安装 wmware workstation。

# 安装 manjaro 内核头文件

默认情况下，manjaro 并没有安装 linux-headers，需要先安装好才能编译 vmware 的各种内核模块。

## 查看内核版本

`uname -r`

## 安装内核文件

`sudo pacman -S linux-headers`
根据你的内核版本，选择对应的内核头文件来安装。

# 安装 vmware workstation

`pamac build vmware-workstation`
**注**：最好挂上代理，不然下载很慢。

# 设置 wmvware workstation

## 启动 vmware workstation 的系统服务

```bash
sudo systemctl start vmware-networks.service #启动网络模块服务
sudo systemctl start vmware-usbarbitrator.service  #启动usb挂载服务
sudo systemctl start vmware-hostd.service  #启动共享服务
```

## 设置系统服务开机自动启动

```bash
sudo systemctl enable vmware-networks.service
sudo systemctl enable vmware-usbarbitrator.service
sudo systemctl enable vmware-hostd.service
```
