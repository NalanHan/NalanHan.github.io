---
title: 使用privoxy把socks5 proxy转换成http proxy
categories: 网络服务
tags: proxy
abbrlink: 4ee7cd3d
date: 2019-01-17 08:45:10
---
最近在使用atom的时候让网络给恶心到了,apm安装软件时经常连接失败。
如果使用代理，则atom只支持http代理，而常用代理都是socks5的。
因此就有了本文，通过privoxy把socks5的代理转换成http代理。

## 安装
`sudo apt install privoxy`
## 配置
`sudo vi /etc/privoxy/config`
在文件的最后添加下面的内容：
```
forward-socks5 / 127.0.0.1:1080 .
```
注意，上行配置最后有个点，别漏了。
## 启动
```
sudo systemctl start privoxy
sudo systemctl enable privoxy
```
## 使用
`export http_proxy=http://127.0.0.1:8118 && curl ip.gs`
看看ip地址是否为代理的ip，如果是，则说明转换成功了。
