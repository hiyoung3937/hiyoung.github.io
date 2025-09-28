---
title: hexo引用站内文章
tags: [hexo]
categories: [前端,网站建设]
cover: false
date: 2025-05-21 14:33:04
mathjax:
---
## 语法
基本的语法结构如下：
``` bash
{% post_link 文件夹名/文章名字 %}
```
如果没有放在文件夹中直接使用文章名字也是可以的
``` bash
{% post_link 文章名字 %}
```
例如：
站内文章：{% post_link hexo/使用Git实现hexo多端同步 %}

除了直接使用之外，也可以自定义链接的标题
```  bash
{% post_link 文件夹名/文章名字 自定义的链接标题%}
```
- 如果自定义的链接标题留空，则自动使用文章标题

站内文章：{% post_link hexo/MacOS上配置Hexo教程 点击这里学习新知识 %}