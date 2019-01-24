---
title: Windows下搭建一个完整的Hexo博客
tags:
  - hexo
  - git
abbrlink: 138c93e5
date: 2018-05-09 21:11:30
categories: 网络服务
---

# Hexo安装和部署的设置

## 安装基本运行环境

hexo依赖Node.js和git。因此，在windows下安装hexo，首先要做的就是把这两个软件安装上。

-   Node.js的下载地址在[这里](https://nodejs.org/zh-cn/)，安装8.11.1LTS版本即可。
-   Git的下载地址在[这里](https://git-scm.com/download/win)，安装时一路默认即可。

## 安装并初始化hexo

1、 安装hexo

 `npm install -g hexo-cli`

<!--more-->

2、初始化一个hexo目录

```npm
 hexo init <folder>
 cd <folder>
 npm install
 git init
```

## 安装hexo的插件

有几个插件是必装的:

-   通过git部署：

`npm install hexo-deployer-git --save`

-   生成文章唯一链接：

`npm install hexo-abbrlink --save`

-   生成sitemap：

`npm install hexo-generator-sitemap --save`

-   生成网站搜索：

    `npm install hexo-generator-searchdb --save`

具体的用法以后再讲。

## 安装hexo主题

我用的是Next主题，地址在[这里](https://github.com/theme-next/hexo-theme-next)。

## 发布hexo网站到Github Pages上

假设你的Github用户名是username，则在github上新建一个名为username.github.io的库。

在hexo的`_config.yml`里，添加如下设置：

```yaml
# Deployment
## Docs: https://hexo.io/docs/deployment.html
deploy:
  type: git
  repo: git@github.com:username/username.github.io.git
  branch: master
```

此时，运行`hexo g`, `hexod`就可以把本地网站部署网站到github上了。

至此，一个hexo的本地网站就搭建起来了。

# Hexo多台电脑同步维护的设置

有时候想要在不同的电脑上来维护Hexo博客，应该怎么操作呢？

这时候可以利用github的分支功能，来实现同一个github仓库里，网站的源文件和生成页面文件分别存储的功能。

假设两台电脑A和B，A已经搭建好了一个Hexo博客并成功部署到github上，现在想在B电脑上也能维护此博客：

## 在A电脑上操作：

1、在hexo博客目录下初始化git，并添加远程仓库地址:

```git
git init
git remote add origin git@github.com:username/username.github.io.git
```

2、创建一个source分支，并把源文件提交到source分支上：

```git
 git checkout -b source
 git add .
 git commit -m 'add source'
 git push origin source
```

至此，已经把hexo博客的源文件保存到github的source分支上了。

3、在github上，把source分支设置为主分支，具体在Settings-->Branches里设置。

## 在B电脑上操作：

B电脑上要确认已经安装完Node.js、Git,并使用npm安装hexo。

1、克隆网站源文件：

`git clone git@github.com:username/username.github.io.git <folder>`

2、进入到<folder>,并安装依赖:

`npm install`

执行`npm install`，会把`package.json`里所包含的在A电脑上安装的插件一并安装好。因此，不需要重复执行A电脑上的安装各个插件的命令。

B电脑上所有的环境至此都已经搭建完成。

# Hexo自定义域名设置

网上很多教程都是使用域名的A记录来设置自定义域名，其实根据github的建议，是使用类似于`www.example.com`这样的二级自定义域名。这样做的好处是可以让github自动选择离你最近的服务，有点类似于CDN加速。

## 域名DNS供应商设置

把你想使用的自定义二级域名指向github pages仓库，只需要一条CNAME记录就可以了。

例如：

```text
www.example.com  username.github.io
```

## hexo里添加CNAME文件

新建一个CNAME文件，放在博客根目录下的source目录里，内容如下：
`www.example.com`
放在source目录下，可以在每次使用`hexo g`生成网站的时候，自动生成CNAME文件。
