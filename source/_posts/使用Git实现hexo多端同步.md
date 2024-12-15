---
title: 使用Git实现hexo多端同步
tags: [git,hexo同步]
categories: [前端,网站建设]
cover: false
date: 2024-12-15 20:21:48
mathjax:
---
## 前言
最近需要用两台电脑来更新博客，但是用U盘来回拷贝太麻烦而且有点捞，使用开始尝试使用git和github来实现hexo的多端同步
Hexo 本地和部署到Git page上的文件是不同的东西
在执行hexo g命令后，会在public目录下生成网页的静态文件，我们用hexo d上传的文件其实就是public目录下的这些静态文件。如果执行hexo clean，那么public文件夹就会消失。实现多端同步，只要让每台电脑上都有最新的资源文件就行了。

主要参考了以下文章：
[利用Github实现hexo多端同步](https://www.zhouw.top/2023/02/27/%E5%88%A9%E7%94%A8Github%E5%AE%9E%E7%8E%B0hexo%E5%A4%9A%E7%AB%AF%E5%90%8C%E6%AD%A5/)

[Hexo在多台电脑上提交和更新](https://blog.csdn.net/K1052176873/article/details/122879462?spm=1001.2101.3001.6650.4&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-4-122879462-blog-118383963.pc_relevant_aa&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-4-122879462-blog-118383963.pc_relevant_aa&utm_relevant_index=8)

## hexo同步原理



## 操作步骤

### 将hexo文件push到github仓库

