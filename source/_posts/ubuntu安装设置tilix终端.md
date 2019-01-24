---
title: ubuntu安装设置tilix终端
categories: 软件应用
tags:
  - terminal
  - tilix
abbrlink: 4d5cdca7
date: 2019-01-17 11:02:33
---

tilix 是 linux 下的一种平铺式的终端应用程序。平铺式是指它可以在同一个窗口内平铺式的显示多个 shell，这样在需要多个 shell 之间对比调试的的时候就显得非常方便了。
tilix 内置了多种主题，可以说是开箱即用。

# 安装 tlix

`sudo apt install tilix`

# 设置 tilix

官方提示在开始使用前，需要做一些设置来解决一些小问题：

## 编辑`~/.bashrc`（如果是 zsh 就编辑`~/.zshrc`）

在文件的最后添加如下内容：

    if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
            source /etc/profile.d/vte.sh
    fi

<!--more-->

## 建立链接

`sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh`

## 更新 bash 配置

`source ~/.bashrc`

# 设置 tilix 为 gnome 默认的终端

`sudo update-alternatives --config x-terminal-emulator`
根据提示选择 tilix 对应的数字,如图：
![set  tilix as default terminal](../images/ubuntu安装设置tilix终端/set-tilix-as-default-terminal.png)
