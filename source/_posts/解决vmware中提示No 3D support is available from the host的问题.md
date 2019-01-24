---
title: 解决vmware提示“No 3D support is available from the host”的问题
categories: 软件应用
tags: vmware
abbrlink: 8fa071eb
date: 2018-07-17 16:10:03
---
这个问题出现在linux下使用开源显卡驱动的情况下，解决也很简单。

打开文件home目录下的配置文件

`gedit $HOME/.vmware/preferences`

在文件的最后添加如下内容：

`mks.gl.allowBlacklistedDrivers = "TRUE"`

问题解决。
