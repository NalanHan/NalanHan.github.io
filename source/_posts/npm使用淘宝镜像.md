---
title: npm使用淘宝镜像
categories: 编程实践
tags: nodejs
abbrlink: ef248641
date: 2018-05-27 17:08:12
---

把 npm 软件源换成淘宝的镜像地址，能有效的提高速度，下面说下具体方法。

# 临时使用

`npm --registry https://registry.npm.taobao.org install express`

# 永久使用

`npm config set registry https://registry.npm.taobao.org`

配置后可
`npm config get registry`
或
`npm info express`
