---
title: 萌百黑幕CSS代码
date: 2022-08-22 20:27:34
tags: css
categories: [前端,CSS]
---

## 萌百黑幕CSS代码

代码来自互联网，仅copy下来以方便自己使用<span class="heimu" title="你知道的太多了">，没错就是抄袭(bushi)</span>

在HTML中在```<head>```的```<style>```中直接引入即可；
在MD中直接添加```<style>```即可
<!-- more -->
使用例：

``` html
<span class="heimu" title="黑幕小弹框里的字">你需要隐藏的文字</span>
```
具体代码如下：

``` css

<style>
    /*黑幕实现*/
.heimu, .heimu a, a .heimu, .heimu a.new 
{
  background-color: #252525;
  color: #252525;
  text-shadow: none;
}
.heimu:hover, .heimu:active,
.heimu:hover .heimu, .heimu:active .heimu 
{
  color: white !important;
}
.heimu:hover a, a:hover .heimu,
.heimu:active a, a:active .heimu 
{
  color: lightblue !important;
}
.heimu:hover .new, .heimu .new:hover, .new:hover .heimu,
.heimu:active .new, .heimu .new:active, .new:active .heimu 
{
  color: #BA0000 !important;
}
</style>
```

## 在Hexo中自定义CSS

首先，在主题的样式文件的source文件夹下找到css文件夹，打开main.styl（next主题下）或者index.styl（butterfly主题下）文件，在最后添加：
路径是：Hexo\themes\butterfly\source\css

``` css
//My Layer
//--------------------------------------------------
@import "_my/mycss";
```

### 新建自定义样式
找到样式文件夹css 新建_my文件夹，在其中新建mycss.styl文件，之后就可以按照stylus的格式自定义样式了。

路径是：\Hexo\themes\next\source\css\ _my