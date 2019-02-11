---
title: LInux下使用交换分区文件替代交换分区
categories: 操作系统
tags:
  - linux
  - swap
abbrlink: 982921b1
date: 2019-02-11 10:16:19
---

现在计算机的内存越来越大,交换分区存在的意义也就越来越小了。像 ubuntu，从 18.04 开始已经取消了交换分区,使用交换分区文件来替代。下面介绍如何在 linux 操作系统上使用交换分区文件替代交换分区。

# 增加交换分区文件

依次执行下面的命令，来新建启用交换分区

## 新建交换分区文件，大小为 1G：（bs\*count=文件大小）

`sudo dd if=/dev/zero of=/swapfile bs=1M count=1024`

## 格式化交换分区文件：

`sudo mkswap /swapfile`

## 启用交换分区文件：

`sudo swapon /swapfile`

## 开机自动挂载:

`sudo vi /etc/fstab`
添加下面内容:
`/swapfile swap swap defaults 0 0`

## 验证是否有交换分区

`free -m`

# 移除 swap 分区文件

执行下面的命令：

`sudo swapoff /swapfile && sudo rm /swapfile`
