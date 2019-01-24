---
title: 更改Python中pip的安装源
categories: 编程实践
tags: python
abbrlink: feebb727
date: 2018-08-14 10:46:05
---
在使用pip安装python的软件时，速度实在是太慢了，而且经常连接断开。
经过在网上的一番搜索，找到了解决办法：

## Windows系统
在user目录中创建一个pip目录，如：C:\Users\xx\pip，然后在pip目录下新建一个文件名为`pip.ini`，内容如下：

```ini
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
[install]
trusted-host=mirrors.aliyun.com
```

## Linux系统

在用户目录下新建一个`.pip`文件夹，然后在此文件夹下新建一个名为`pip.conf`的文件，例如：`~/.pip/pip.conf`，内容同上。

PS：清华大学的这个软件源速度是真的快，而且是联通、电信、移动三网速度都快,下载基本满速，推荐使用。
