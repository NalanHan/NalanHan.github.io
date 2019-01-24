---
title: Linuxmint 19下安装nodejs并升级到最新版本
categories: 操作系统
tags: [nodejs,linuxmint]
abbrlink: f982b26b
date: 2018-12-22 18:59:36
---
1、安装系统自带的nodejs

`sudo apt install nodejs`

2、安装npm

`sudo apt install npm`

3、给npm设置淘宝源,速度快

`sudo npm config set registry https://registry.npm.taobao.org`

4、查看下配置是否生效
<!--more-->
`sudo npm config list`

更多的介绍查看[这篇文章](https://www.yufael.com/posts/ef248641.html)

5、安装更新版本的工具`n`

`sudo npm install n -g`

6、安装最新的长期支持版

`sudo n lts`

更新工具`n`的其他操作命令：

```
sudo n 10.13.0    //安装指定的nodejs版本
sudo n rm 11.0.0  //删除指定的Nodejs版本
n                 //查看已安装的版本，然后按上下键来切换版本
sudo n latest     //安装最新的版本
sudo n stable     //安装最新稳定版
sudo n lts        //安装最新长期支持版本
```
