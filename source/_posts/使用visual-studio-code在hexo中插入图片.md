---
title: 使用visual studio code在hexo中插入图片
categories: 软件应用
tags:
  - vscode
  - hexo
abbrlink: 50952d2f
date: 2019-01-22 09:33:55
---
`Visual studio code`有一个`Past Image`插件，它的作用是直接把剪贴版的图像保存到设定的位置，并把链接插入到markdown文件里，非常方便。
但是这个插件需要一些设置才能适配不同的博客系统，比如它针对hexo和hexo的设置就不一样。
下面介绍一下如何针对`hexo`设置`Past Image`：

# 要实现的功能
`hexo`保存静态文件的文件夹是`source`，生成网站的时候，会把`source`文件夹下的文件原样拷贝到网站的根目录下。
现在的设想是，在`source`下新建一个`images`文件夹，保存图片的时候自动在`images`下新建一个和博客文章同名的目录，并把图片保存到里边。

# 安装xclip
`sudo apt install xclip`
`xclip`是Linux下读取剪贴板内容的软件，有些linux没有安装，需要先安装上。
# 设置`Past Image`
1、按`ctrl`+`,`,打开vscode的自定义选项界面，并输入past image,如下图：
![opensettings](/images/使用visual-studio-code在hexo中插入图片/opensettings.png)
<!-- more -->
2、找到`Default Name`，设置成`MM`：
![defaultname](/images/使用visual-studio-code在hexo中插入图片/defaultname.png)
默认的年-月-日-时-分-秒格式太长了，修改名字不方便，这里只显示两个数字的月份。
3、找到`Encode Path`,设置成`urlEncodeSpace`:
![urlencode](/images/使用visual-studio-code在hexo中插入图片/urlencodespace.png)
这是为了能够正确渲染图片文件路径和名称中的空格。
4、找到`base path`这一项，设置成`${projectRoot}/source`，如下图：
![basepath](/images/使用visual-studio-code在hexo中插入图片/basepath.png)
5、找到`File Path Confirm Input Box Mode`，这一项，设置成`onlyName`，如下图：
![confirmimagename](/images/使用visual-studio-code在hexo中插入图片/confirmimagename.png)
设置成`onlyName`而不是`fullPath`,是只显示图片名称而不包含路径。
和第2步类似，同样是为了方便修改所生成图片的名字。
6、找到`Insert Pattern`，修改成`![${imageFileNameWithoutExt}](/${imageFilePath})`，如下图：
![insertpattern](/images/使用visual-studio-code在hexo中插入图片/insertpattern.png)
解释下上面的参数的意义:
- 图片链接采用标准的markdown语法，即`![imagename](path/to/file)`的格式。
- `${imageFileNameWithoutExt}`是插入不带后缀的图片名称，比如`test.png`这个图片只插入名称`test`，不插入后缀`.png`。
- `/${imageFilePath}`这个参数需要分两部分说：
  - `/`是图片链接采用绝对路径，`Past Image`默认插入图片不会带`/`，这里手动插入。
  - `${imageFilePath}`是图片的路径。因为我们在第2步里已经设置了`base path`为`${projectRoot}/source`，所以这里只填`${imageFilePath}`就可以了。如果`base path`不是像第2步里那样设置的，需要自行调整。

7、找到`Path`，设置成`${projectRoot}/source/images/${currentFileNameWithoutExt}/`，如下图：
![path](/images/使用visual-studio-code在hexo中插入图片/path.png)
这是设置图片保存的路径，`${currentFileNameWithoutExt}`，是生成和当前博客文章同名的文件夹且不带`.md`的后缀。
8、选中`Show File Path Confirm Input Box`这一项：
![confirminputbox](/images/使用visual-studio-code在hexo中插入图片/confirminputbox.png)
这是为了在保存图片的时候能够修改文件名，不然的话只能以第2步里设置名称保存图片了。
就像下图的效果一样：
![inputboxexample](/images/使用visual-studio-code在hexo中插入图片/inputboxexample.png)

设置完毕。直接按`ctrl`+`alt`+`v`，就能把剪贴板的图像直接保存到指定位置并把链接插入到markdown里了。
你需要做的只是修改一下图片文件名。
