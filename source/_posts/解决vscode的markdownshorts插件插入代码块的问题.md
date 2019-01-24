---
title: 解决vscode的markdownshorts插件插入代码块的问题
categories: 软件应用
tags: 'vscode,markdown'
abbrlink: f0e99280
date: 2019-01-25 06:20:33
---
`markdown shortcuts`是vscode编辑markdown文件必备的插件，最近在使用中发现它的一个bug：
使用`ctrl+m ctrl+c`插入代码块的时候，它自动在代码块的前后加上了`auto`，很烦人：
![codeblock](/images/解决vscode的markdownshorts插件插入代码块的问题/codeblock.png)

这显然不要我想要的，我期待的是这种格式：
![expectcodestyle](/images/解决vscode的markdownshorts插件插入代码块的问题/expectcodestyle.png)

通过与作者的交流，发现这是由于最近vscode的一些改变造成的。

要解决这个问题，需要在vscode中做一些设置：
在vscode中，打开File > Preferences > Settings，搜索`eol`，把`eol`从`auto`变成`\n`即可：
![eolsettings](/images/解决vscode的markdownshorts插件插入代码块的问题/eolsettings.png)