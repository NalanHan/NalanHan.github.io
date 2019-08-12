---
title: ubuntu及其衍生版中英文字体设置
categories: 操作系统
tags:
  - ubuntu
  - font
abbrlink: b52a3d62
date: 2019-08-12 15:21:18
---

对 ubuntu 及其衍生版来说，中文字体的显示效果在技术层面上已经很完美了，之所以看到字体显示效果有区别，更多的原因是在于你所用的字体。

对于我来说，非常看不习惯现在主流发行版(包括 ubuntu)的默认中文字体`noto`系列，总感觉它的笔划是歪的。

以我的审美来看，在 linux 下，微软雅黑显示效果绝对排第一，`wqy microhei` 排第二，其他的字体显示效果都比较差。

下面就以微软雅黑为例，系统介绍下`ubuntu`如何配置字体（注意字体版权）。

## 字体显示的技术层面

前面已经说到，ubuntu 在技术层面上，已经把中文字体显示的问题解决了。

什么意思呢？就是说现在配置字体，已经不需要像以前一样，去调整`fontconfig`、`freetype`这些底层的东西了。

ubuntu 已经把这些都设置好了，而且效果很完美，起码对于雅黑和`wqy microhei`来说是这样。

所以，现在的的配置字体，就是保证 ubuntu 能够正确的使用你所选择的字体。

## 字体优先级配置

### 查看字体优先级

澄清一下，不是说你用`gnome-tweaks`之类的工具或者在控制中心里，在字体选项里选中雅黑就可以了。

这样做，只是把部分界面调整为雅黑，很多软件并不会使用控制中心里的字体设置。

要查看系统到底优先使用什么字体，需要使用`fc-match`命令：

```bash
fc-match sans       #查看sans字体族的默认字体
fc-match serif      #查看serif字体族的默认字体
fc-match monospace  #查看monospace字体族的默认字体
```

查看输入结果，就能知道 sans、serif 和 monospace 这三个字体族到底优先使用什么字体了。

### 设置字体优先级

对所有的 ubuntu 来说，你需要关注的字体配置文件有两个，都在`/etc/fonts/conf.d`里面：

1.  `64-language-selector-prefer.conf`
2.  `69-language-selector-zh-cn.conf`

这两个字体配置文件，关系到系统的 sans、serif、和 monospace 这三种字体的优先使用级别。

调整方法也很简单，只需要把你想使用的字体放在每一个字体族下的第一行就可以，两个文件都要调整。

英文等宽字体也是一样，放在 monospace 下的第一行。

以下字体文件配置，sans 和 serif 都使用了微软雅黑，monospace 使用了 `dejavu sans mono`：

1、`64-language-selector-prefer.conf`

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
	<alias>
		<family>sans-serif</family>
		<prefer>
			<family>Microsoft YaHei</family>
			<family>Noto Sans CJK JP</family>
			<family>Noto Sans CJK KR</family>
			<family>Noto Sans CJK SC</family>
			<family>Noto Sans CJK TC</family>
			<family>Noto Sans CJK HK</family>
		</prefer>
	</alias>
	<alias>
		<family>serif</family>
		<prefer>
			<family>Microsoft YaHei</family>
			<family>Noto Serif CJK JP</family>
			<family>Noto Serif CJK KR</family>
			<family>Noto Serif CJK SC</family>
			<family>Noto Serif CJK TC</family>
		</prefer>
	</alias>
	<alias>
		<family>monospace</family>
		<prefer>
			<family>Dejavu Sans Mono</family>
			<family>Noto Sans Mono CJK KR</family>
			<family>Noto Sans Mono CJK SC</family>
			<family>Noto Sans Mono CJK TC</family>
			<family>Noto Sans Mono CJK HK</family>
		</prefer>
	</alias>
</fontconfig>
```

2、`69-language-selector-zh-cn.conf`

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>

	<match target="pattern">
        <test name="lang">
            <string>zh-cn</string>
        </test>
		<test qual="any" name="family">
			<string>serif</string>
		</test>
		<edit name="family" mode="prepend" binding="strong">
			<string>Microsoft YaHei</string>
			<string>Noto Serif CJK SC</string>
			<string>HYSong</string>
			<string>AR PL UMing CN</string>
			<string>AR PL UMing HK</string>
			<string>AR PL New Sung</string>
			<string>WenQuanYi Bitmap Song</string>
			<string>AR PL UKai CN</string>
			<string>AR PL ZenKai Uni</string>
		</edit>
	</match>
	<match target="pattern">
		<test qual="any" name="family">
			<string>sans-serif</string>
		</test>
        <test name="lang">
            <string>zh-cn</string>
        </test>
		<edit name="family" mode="prepend" binding="strong">
			<string>Microsoft YaHei</string>
			<string>Noto Sans CJK SC</string>
			<string>WenQuanYi Zen Hei</string>
			<string>HYSong</string>
			<string>AR PL UMing CN</string>
			<string>AR PL UMing HK</string>
			<string>AR PL New Sung</string>
			<string>AR PL UKai CN</string>
			<string>AR PL ZenKai Uni</string>
		</edit>
	</match>
	<match target="pattern">
		<test qual="any" name="family">
			<string>monospace</string>
		</test>
        <test name="lang">
            <string>zh-cn</string>
        </test>
		<edit name="family" mode="prepend" binding="strong">
			<string>DejaVu Sans Mono</string>
			<string>Noto Sans Mono CJK SC</string>
			<string>WenQuanYi Zen Hei Mono</string>
			<string>HYSong</string>
			<string>AR PL UMing CN</string>
			<string>AR PL UMing HK</string>
			<string>AR PL New Sung</string>
			<string>AR PL UKai CN</string>
			<string>AR PL ZenKai Uni</string>
		</edit>
	</match>

</fontconfig>
```

注销之后，使用`fc-match`查看效果。

### 英文等宽字体选择

英文等宽字体推荐`dejavu sans mono`。它最大的优点是中文和英文字体的大小比较协调。不像`ubuntu mono`一样，英文字体偏小，调大字号后中文字体又太大。

### 删除不需要的字体配置

如果配置完后，使用`fc-match`发现并没有如预想的一样使用所选字体，那就要注意一下`/etc/fonts/conf.d`其它的字体配置文件了。

在 ubuntu 里，会单独给一些字体设置一些配置文件，同样存放在`/etc/fonts/conf.d`里，比如 `wqy`、`arphic-uming`、``arphic-ukai`等。

这里需要**特别注意**`64-arphic-uming.conf`这个文件，必须删除或者改后缀名让其不生效，否则调整 serif 字体族这一项不会生效。

## 可选操作：雅黑字体处理

直接拷贝安装 windows 10 下的雅黑字体，效果已经不错了，但是可以对雅黑字体做进一步处理，让其显示效果更好。

### 处理方法

拷贝 windows 10 下的微软雅黑，注意有三个：msyh.ttc、msyhbd.ttc、msyhl.ttc。

然后去网上找字体去`hint`工具，把雅黑字体的 hint 信息去掉后，再安装到 ubuntu 里。

ps：处理完后，雅黑字体在 2k 屏的 windows 下效果也比原来强多了，基本能达到 mactype 的水平。

## 总结

字体配置，是一个很个人的东西，同样的字体和字体配置，有些人觉得好看，有些人就觉得难看。

其实本文通篇就讲了一个字体优先级配置的问题。方法是通用的，希望看完后，所有人都能正确设置自己中意的字体。
