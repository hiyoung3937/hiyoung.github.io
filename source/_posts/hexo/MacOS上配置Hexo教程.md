---
title: MacOS上配置Hexo教程
tags: [hexo,MacOS]
categories: [前端,网站建设]
cover: false
date: 2025-05-21 13:56:00
mathjax:
---

## 前言
最近买了台Macbook，之前一直使用的都是Win机子，换到mac后又是一个重新学习的过程。
当然拿到电脑后第一件事就是把我的博客同步到mac上来，然而由于mac和win的环境配置有一定区别，也是折腾了一段时间才搞好
今天终于是把环境配置好了，遂记录一篇如何在macos上配置hexo并多端同步。

## 环境配置
macos与win的一大区别就是环境配置工作，我前几次失败也都是倒在环境配置这一步，下面是操作步骤。
主要教程也是参考网上别人的方法：[mac环境下使用hexo搭建个人博客](https://blog.l3zc.com/2022/05/mac%E7%8E%AF%E5%A2%83%E4%B8%8B%E4%BD%BF%E7%94%A8hexo%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2/)
本文也记录一些本人安装时遇到的一些问题和解决方法。
### 准备工作
#### 安装 Homebrew
一开始我是并不想使用Homebrew包管理器的，觉得能直接装就直接装了，多装个东西反而麻烦。但是在查找了多方教程后发现大多数人在mac上使用的都是Homebrew，所以最后还是选择了使用这个包管理器。

1. 如果网络环境良好（不在中国大陆），可以略过设置环境变量的步骤并直接使用正常的安装脚本：
``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. 如果在大陆的话可以换成国内源来安装（即使是在大陆的玩家使用代理的话也有一定可能导致安装失败，毕竟网络问题是最玄学的了）
在中国大陆，可以使用镜像源安装 Homebrew，下面以中科大镜像源为例。

设置环境变量：
``` bash
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
```
运行中科大 Homebrew 安装脚本：
``` bash
/bin/bash -c "$(curl -fsSL https://mirrors.ustc.edu.cn/misc/brew-install.sh)"
```

#### 安装node.js & Git
hexo 主要就是使用Node.js和Git工作的，所以使用Homebrew去安装这两个包即可
Homebrew安装完成后，安装 Git 和 Node.js：
``` bash
brew install git   
brew install node   // npm随node安装
```

测试一下是否都安装完成
``` bash
npm -v
node -v
git --version
```

出现npm、Node.js和git的版本号即代表安装成功。

![MacOS上配置Hexo教程1](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/MacOS上配置Hexo教程1.33893ptvsai0.webp)

#### 安装 Hexo

这里可以参考站内文章：{% post_link hexo/使用Git实现hexo多端同步 %}
从**在新电脑上的操作** 开始操作即可

**注意：**
在macos上执行生成 SSH Key之后生成的密钥和win的保存路径不同

如果已经创建过会出现 Overwrite (y/n)? n提示可以输入 n。
没有创建过的话三个回车就好（不设置密码），执行完成后会在~/.ssh/id_rsa.pub目录下生成 需要使用的 key，也就是公钥。（使用 **Command+Shift+G** 可以跳转）

到账户主文件夹下同时按 **Command+Shift+.** 显示隐藏文件，找到.ssh文件夹，打开id_rsa.pub，将里面的内容全部复制。

#### 完成
按照以上步骤完成之后即可同步其他端的文章和设置了，十分的方便和便捷。
如果在配置中出现了网络问题可以尝试关闭或者开启代理重试一下，也可以在
{% post_link hexo/搭建hexo错误记录 %}中查找一下是否有相同的问题

### 配置个人域名
本步骤计划单独使用一篇文章来记录，因为之前在尝试换绑域名时也遇到了许多问题，值得单独开篇文章来记录
