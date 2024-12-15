---
title: 搭建TG贴纸下载Robot
date: 2023-04-09 19:03:05
tags: TG_Robot
categories: 实用工具教程
---
## 前情提要
最近回家用TG贴纸下载机器人的时候发现太大的贴纸包无法下载，无奈只好自己搭建一个，正好在网上看到一个不错的，于是正好写这篇教程记录一下
<!--more-->
## 源码下载和必备环境
- Robot源代码来源[Github](https://github.com/phoenixlzx/telegram-stickerimage-bot)
- Imagemagick[下载](https://download.imagemagick.org/archive/releases/)
- 所需环境：
    - Node.js v8.0.0及以上
    - ImageMagick with webp support (Check with ``identify -list format | grep -i 'webp' ``on Linux systems)

## 开始搭建Robot
1. 因为 Imagemagick 没有 webp 支持，可以使用``identify -list format``查看支持的图片格式
2. Imagemagick源码编译webp
``` bash
#先安装webp
yum install libwebp -y

#卸载系统自带的ImageMagick
yum remove ImageMagick -y

#下载ImageMagick源码包，编译
wget -c https://download.imagemagick.org/archive/releases/ImageMagick-7.1.1-4.tar.gz
tar -zxf ImageMagick-7.1.1-4.tar.gz && cd ImageMagick-7.1.1-4
./configure --with-webp
make && make install

#查看是否成功支持webp
identify -list format | grep -i 'webp'
```

- tips:
    - **编译时一定要带上 ``--with-webp``**
    - **ERROR:编译imagemagick时一直无法将webp成功一起编译无法使用机器人,输入以下命令后成功``sudo ldconfig /usr/local/lib``**（如果出现同样的问题尝试一下，未找到准确原因，可以参考Imagemagick[官方文档](https://imagemagick.org/script/install-source.php#linux)）
    

3. Robot代码配置
    1. ``git clone https://github.com/phoenixlzx/telegram-stickerimage-bot.git``
    2. Get a bot token from [@BotFather](https://telegram.me/BotFather)
    3. Copy ``config.js.example`` to ``config.js`` and edit as your needs
    4. ``npm install && npm start``

4. 设置开机自启
    1. 可以直接写一个shell脚本

        ``` shell
        #!/bin/bash

        # 切换到目标项目目录下
        cd 你的Robot应用根目录

        # 启动服务
        npm start
        ```
    2. centos自启动配置(我的机器是Centos机器不同可能不一致)
    在CentOS 7中，开机启动脚本的位置为``/etc/rc.d/rc.local``文件

    ``` bash
    sudo vim /etc/rc.d/rc.local

    #在开机时自动启动一个名为``auto-start.sh``的脚本，只需要在rc.local文件中添加如下内容：
    sh /path/to/auto-start.sh

    #需要注意的是，rc.local 文件必须具有可执行权限，因此你需要运行以下命令来添加权限：
    sudo chmod +x /etc/rc.d/rc.local
    ```

## 完成参考
![搭建TG贴纸下载Robot-1](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/搭建TG贴纸下载Robot-1.5xf2bdnpjp80.webp)
![搭建TG贴纸下载Robot-2](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/搭建TG贴纸下载Robot-2.5vciz3o18d00.webp)

----------------------------------------------------
参考文章：
机器人源码：
https://github.com/phoenixlzx/telegram-stickerimage-bot

开机自启动node.js服务：
https://juejin.cn/post/7215100409156157497

imagemagick：
https://imagemagick.org/script/install-source.php#linux
https://download.imagemagick.org/archive/releases/

教程：
https://halo.sherlocky.com/archives/imagemagick-heic
https://github.com/phoenixlzx/telegram-stickerimage-bot/issues/13
