---
comments: true
title: next主题的一些设置
date: 2022-11-20 15:11:02
category: [前端,网站建设]
tags: next
---
## Hexo默认 主题的config优先级高于Hexo的config
基于Hexo 6.2 和hexo-theme-next-8.12.1 不同版本设置可能不一样
<!-- more --> 
### 以下为next主题config设置：
#### 一.网站图标设置
1. 侧边栏链接图标设置：此版本使用的是 https://fontawesome.com/icons 图标库

![next主题设置1](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/next主题设置1.3kzrx9umrz60.jpg)

2. 在social下可以添加链接和图标   e.g Bilibili: 链接地址 || 图标库名称 
tips:有些是**fa** fa-XXXX 有些是**fab** fa-XXXX 

![next主题设置2](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/next主题设置2.541nq9bzafs0.jpg)

3. 网站站点的图标在本地Hexo\public\images中，在主题favicon中设置				

![next主题设置3](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/next主题设置3.63l02jbegvc0.jpg)

#### 生成文章默认生成属性

categories有点类似tags，写在文章属性之中，所以需要在文章生成时添加categories属性。
编辑```hexo/scaffolds/post.md```，在最下面添加一行categories
```
---
title: {{ title }}
date: {{ date }}
tags:
categories:
---
```

### 添加小功能

#### 添加本站运行时间
修改Hexo/themes/next/layout/_partials/footer.njk(footer.swig)文件，在末尾加入如下代码：
```
</br>  //换行
<!-- 网站运行时间的设置 -->
<span id="timeDate">载入天数...</span>
<span id="times">载入时分秒...</span>
<script>
    var now = new Date();
    function createtime() {
        var grt= new Date("04/21/2019 15:54:40");//此处修改你的建站时间或者网站上线时间
        now.setTime(now.getTime()+250);
        days = (now - grt ) / 1000 / 60 / 60 / 24; dnum = Math.floor(days);
        hours = (now - grt ) / 1000 / 60 / 60 - (24 * dnum); hnum = Math.floor(hours);
        if(String(hnum).length ==1 ){hnum = "0" + hnum;} minutes = (now - grt ) / 1000 /60 - (24 * 60 * dnum) - (60 * hnum);
        mnum = Math.floor(minutes); if(String(mnum).length ==1 ){mnum = "0" + mnum;}
        seconds = (now - grt ) / 1000 - (24 * 60 * 60 * dnum) - (60 * 60 * hnum) - (60 * mnum);
        snum = Math.round(seconds); if(String(snum).length ==1 ){snum = "0" + snum;}
        document.getElementById("timeDate").innerHTML = "本站已安全运行 "+dnum+" 天 ";
        document.getElementById("times").innerHTML = hnum + " 小时 " + mnum + " 分 " + snum + " 秒";
    }
setInterval("createtime()",250);
</script>
```
______________________________
参考资料：
[Hexo官方文档](https://hexo.io/zh-cn/docs/)
[Next主题文档说明](https://theme-next.iissnan.com/theme-settings.html#syntax-highlight-scheme)
