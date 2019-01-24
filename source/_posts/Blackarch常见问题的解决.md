---
title: Blackarch常见问题的解决
categories: 操作系统
tags:
  - blackarch
abbrlink: c0cd9028
date: 2018-08-21T16:48:52.000Z
---

尝试了一下Blackarch，把遇到的问题记录一下。

# 开机后没有网络连接的问题

启动系统的wicd服务就可以了：

```bash
systemctl start wicd.service
systemctl enable wicd.service
```

# 正确的系统升级方法

如果使用arch的`pacman -Syu`命令，就会发现提示软件冲突。
正确的系统升级命令如下：
`pacman -Syyu --needed --overwrite '*' blackarch`
