---
title: Windows下搭建一个完整的Hexo博客
tags:
  - hexo
  - git
abbrlink: 138c93e5
date: 2018-05-09 21:11:30
categories: 网络服务
---

# Hexo 安装和部署的设置

## 安装基本运行环境

hexo 依赖 Node.js 和 git。因此，在 windows 下安装 hexo，首先要做的就是把这两个软件安装上。

* Node.js 的下载地址在[这里](https://nodejs.org/zh-cn/)，安装 8.11.1LTS 版本即可。
* Git 的下载地址在[这里](https://git-scm.com/download/win)，安装时一路默认即可。

## 安装并初始化 hexo

1、 安装 hexo

`npm install -g hexo-cli`

<!--more-->

2、初始化一个 hexo 目录

```npm
 hexo init <folder>
 cd <folder>
 npm install
 git init
```

## 安装 hexo 的插件

有几个插件是必装的:

* 通过 git 部署：

`npm install hexo-deployer-git --save`

* 生成文章唯一链接：

`npm install hexo-abbrlink --save`

* 生成 sitemap：

`npm install hexo-generator-sitemap --save`

* 生成网站搜索：

  `npm install hexo-generator-searchdb --save`

具体的用法以后再讲。

## 安装 hexo 主题

我用的是 Next 主题，地址在[这里](https://github.com/theme-next/hexo-theme-next)。

## 发布 hexo 网站到 Github Pages 上

假设你的 Github 用户名是 username，则在 github 上新建一个名为 username.github.io 的库。

在 hexo 的`_config.yml`里，添加如下设置：

```yaml
# Deployment
## Docs: https://hexo.io/docs/deployment.html
deploy:
  type: git
  repo: git@github.com:username/username.github.io.git
  branch: master
```

此时，运行`hexo g`, `hexod`就可以把本地网站部署网站到 github 上了。

至此，一个 hexo 的本地网站就搭建起来了。

# Hexo 多台电脑同步维护的设置

有时候想要在不同的电脑上来维护 Hexo 博客，应该怎么操作呢？

这时候可以利用 github 的分支功能，来实现同一个 github 仓库里，网站的源文件和生成页面文件分别存储的功能。

假设两台电脑 A 和 B，A 已经搭建好了一个 Hexo 博客并成功部署到 github 上，现在想在 B 电脑上也能维护此博客：

## 在 A 电脑上操作：

1、在 hexo 博客目录下初始化 git，并添加远程仓库地址:

```git
git init
git remote add origin git@github.com:username/username.github.io.git
```

2、创建一个 source 分支，并把源文件提交到 source 分支上：

```git
 git checkout -b source
 git add .
 git commit -m 'add source'
 git push origin source
```

至此，已经把 hexo 博客的源文件保存到 github 的 source 分支上了。

3、在 github 上，把 source 分支设置为主分支，具体在 Settings-->Branches 里设置。

## 在 B 电脑上操作：

B 电脑上要确认已经安装完 Node.js、Git,并使用 npm 安装 hexo。

1、克隆网站源文件：

`git clone git@github.com:username/username.github.io.git <folder>`

2、进入到<folder>,并安装依赖:

`npm install`

执行`npm install`，会把`package.json`里所包含的在 A 电脑上安装的插件一并安装好。因此，不需要重复执行 A 电脑上的安装各个插件的命令。

B 电脑上所有的环境至此都已经搭建完成。

# Hexo 自定义域名设置

网上很多教程都是使用域名的 A 记录来设置自定义域名，其实根据 github 的建议，是使用类似于`www.example.com`这样的二级自定义域名。这样做的好处是可以让 github 自动选择离你最近的服务，有点类似于 CDN 加速。

## 域名 DNS 供应商设置

把你想使用的自定义二级域名指向 github pages 仓库，只需要一条 CNAME 记录就可以了。

例如：

```text
www.example.com  username.github.io
```

## hexo 里添加 CNAME 文件

新建一个 CNAME 文件，放在博客根目录下的 source 目录里，内容如下：
`www.example.com`
放在 source 目录下，可以在每次使用`hexo g`生成网站的时候，自动生成 CNAME 文件。
