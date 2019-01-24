---
title: Excel修改默认字体的正确方法
categories: 软件应用
tags:
  - excel
abbrlink: f5ccc4ae
date: 2018-05-19 16:32:01
---

网上搜索一下如何修改 Excel 的默认字体,基本上都是打开文件--选项-常规,然后修改自己想要的默认字体,保存就行了。似乎很简单的样子？

然而事实是,如果你新建一个 excel 文件后就会发现,依然还是原来的字体,这是怎么回事呢?

等来看两张图：

![excel1](/images/Excel修改默认字体的正确方法/excel1.png)
![excel2](/images/Excel修改默认字体的正确方法/excel2.png)

一个是新建工作簿，一个是新建工作表，这两个是不一样的。

<!--more-->

其实，桌面右键新建 excel 工作表的时候，是复制了一份现有的 excel 工作表模板。这个模板的名字是`EXCEL12`，位于`C:\Windows\ShellNew`里边。

因此，正确的修改 Excel 字体的方法是：

1、打开 Excel-文件-选项-常规-新建工作簿时-修改默认字体&字号-保存-关闭 Excel。

2、打开电脑左下角-开始-所有程序-Excel-新建空白工作簿-另存到桌面-修改名称为`EXCEL12`

3、打开位置`C:\Windows\ShellNew`，把桌面上新建的`EXCEL12`复制进去就可以了。
