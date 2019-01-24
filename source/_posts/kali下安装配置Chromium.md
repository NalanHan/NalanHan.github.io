---
title: kali下安装配置Chrome/Chromium
categories: 软件应用
tags:
  - kali
  - chrome
abbrlink: 8cd312b
date: 2018-05-22 16:13:06
---

Kali 默认用户是 root，而 chrome 默认是不支持在 root 用户下使用的，这就导致必须修改 chrome 的设置，才能让 chrome 在 kali 下运行。

网上有很多文章介绍如何修改，但是没有一个说到点子上的，今天发现了一篇文章，完美的解决了 chrome 在 kali 下运行问题。

# 安装 chromium

我们安装 chromium 而不是 chrome,感觉修改起来更方便。

`apt install chromium`

# 修改 chromium 的配置文件

`vi /etc/chromium.d/default-flags`

<!--more-->

添加下面的内容：

```bash
# Run as root Kali
export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --password-store=detect --no-sandbox --user-data-dir"

# Disable Chromium security features for web app testing
export CHROMIUM_FLAGS="$CHROMIUM_FLAGS --disable-web-security"
```

上面的配置有两个作用：
1、让 chromium 以 root 运行。
2、安装 chromium 的安全特性，可以进行一些基于 DOM 的 xss 安全测试。

# chromium 以代理模式运行

`chromium --proxy-server="socks5://localhost:1080"`

同样的配置应该对 Chrome 同样起作用，但是没有测试。
