---
title: 服务器部署Komga漫画阅读器
date: 2022-09-13 20:29:53
tags: comic,Komga
categories: 实用工具教程
---

## 前言

本地本子存太多了，突发奇想想搭建一个在线看漫画的服务，遂找到了Komga。
下面记录一下如何在服务器的docker上部署
<!-- more -->
## 安装步骤
1. 服务器端需要安装Java环境，至少在JDK17及以上
    - Centos为例：
    ``` bsah
    #查看云端yum库中目前支持安装的jdk软件包
    yum search java|grep jdk 

    #选择版本安装jdk
    yum install -y java-17-openjdk

    #安装完成后，验证是否安装成功
    java -version
    ```
2. [Komga的GitHub地址](https://github.com/gotson/komga/releases/)，下载最新版本的jar文件，上传到服务器即可

3. 在 CentOS 安装
``` bash
# 在komga中创建子目录
mkdir config 
mkdir data

# 创建文件
cd config
touch database.sqlite

# 运行komga,版本号具体而论
java -jar komga-***.jar
```
4. 运行
在浏览器中输入 http://服务器IP:8080，就能看到主界面了，登录即可
如果有其它服务在使用8080端口会导致安装失败，把另一个服务暂时关闭即可

5. docker运行
``` docker

docker create \
  --name=komga \
  --user 1000:1000 \
  -p 3080:8080 \ #我这里选择3080端口映射
  --mount type=bind,source=/path/to/config,target=/config \ #/path/to/config 是刚才创建的文件
  --mount type=bind,source=/path/to/data,target=/data \ #/path/to/data 也是刚才创建的文件
  --restart unless-stopped \
  gotson/komga

#启动docker
docker start komga
```

-----------

内容部分来自互联网
