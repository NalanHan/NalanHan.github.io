---
title: macos使用iterm2和zsh并配置oh-my-zsh
categories: 软件应用
tags: [macos,iterm,zsh]
abbrlink: 1f35ea77
date: 2018-09-01 12:35:32
---

iterm2 和 zsh 应该是使用 macos 必备的两个软件了，分别替换系统自带的 terminal 和 bash。

# zsh 相关设置

## 安装 zsh

系统自带的 zsh 是 5.0，而最新的 zsh 是 5.5。在此，使用 homebrew 安装最新的 5.5 版本的 zsh

`brew install zsh`

## 一条命令替换系统自带 bash 为 zsh，并使用最新的 5.5 版本的 zsh

`sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh`

<!--more-->

关闭终端并重新打开，查看当前 zsh 的版本：

`zsh --version`

发现系统默认的 shell 已经是 zsh 并且是 5.5 版本了。

## 安装 oh-my-zsh

终端中输入如下命令：

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## 安装 oh-my-zsh 的插件

* zsh-autosuggestions
* autojump
* zsh-syntax-highlighting
* osx
* zsh-completions
  以上插件全部使用`homebrew`安装。

### 启用上述插件：

打开~/.zshrc,找到下面位置，并添加：

```
plugins=(
  git
  zsh-autosuggestions
  autojump
  osx
  zsh-completions
)
```

### 关于 zsh-syntax-highlighting 的设置

在~/.zshrc 文件的最后面，加上以下内容：

```
# For zsh syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

## oh-my-zsh 终端字体大全

到[https://github.com/powerline/fonts 到](https://github.com/powerline/fonts)去下载想要的字体。

# Iterm2 相关设置

Iterm2 下载地址： [https://www.iterm2.com/downloads.html](https://www.iterm2.com/downloads.html)

注意：从 3.2.0 开始，只支持 10.12+，最后一个支持 10.11 及以下的是 3.1.7 版本。

## iterm2 的主题

主题下载地址： [https://iterm2colorschemes.com/](https://iterm2colorschemes.com/)
网站右上角有 tar.gz 和 zip 两种格式的压缩包，可以把所有主题都下载下来。推荐使用 Monokai Soda
