---
title: macos使用iterm2和zsh并配置oh-my-zsh
categories: 软件应用
tags: [macos,iterm,zsh]
abbrlink: 1f35ea77
date: 2018-09-01 12:35:32
---
iterm2和zsh应该是使用macos必备的两个软件了，分别替换系统自带的terminal和bash。

# zsh相关设置

## 安装zsh

系统自带的zsh是5.0，而最新的zsh是5.5。
在此，使用homebrew安装最新的5.5版本的zsh

`brew install zsh`

## 一条命令替换系统自带bash为zsh，并使用最新的5.5版本的zsh

`sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh`
<!--more-->
关闭终端并重新打开，查看当前zsh的版本：

`zsh --version`

发现系统默认的shell已经是zsh并且是5.5版本了。

## 安装oh-my-zsh

终端中输入如下命令：
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

```
## 安装oh-my-zsh的插件
*   zsh-autosuggestions
*   autojump
*   zsh-syntax-highlighting
*   osx
*   zsh-completions
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

### 关于zsh-syntax-highlighting的设置

在~/.zshrc文件的最后面，加上以下内容：

```
# For zsh syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

## oh-my-zsh终端字体大全
到[https://github.com/powerline/fonts到](https://github.com/powerline/fonts)去下载想要的字体。

# Iterm2相关设置
Iterm2下载地址： [https://www.iterm2.com/downloads.html](https://www.iterm2.com/downloads.html)

注意：从3.2.0开始，只支持10.12+，最后一个支持10.11及以下的是3.1.7版本。

## iterm2的主题

主题下载地址： [https://iterm2colorschemes.com/](https://iterm2colorschemes.com/)
网站右上角有tar.gz和zip两种格式的压缩包，可以把所有主题都下载下来。
推荐使用Monokai Soda
