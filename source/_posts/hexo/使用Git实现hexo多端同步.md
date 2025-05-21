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

1. hexo博客目录结构说明
一般而言hexo的目录结构包含下面内容（shell脚本不属于hexo的目录结构）
![使用Git实现hexo多端同步-1](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/使用Git实现hexo多端同步-1.1vyqyut3b03k.webp)

| 文件夹 | 说明 | 是否需要上传github |
| :-----| :----:  | :---- |
| node_modules | hexo需要的模块，就是一些基础的npm安装模块，比如一些美化插件，在执行npm install的时候会重新生成 | 不需要 |
| themes | 主题文件 | 需要 |
| public | hexo g命令执行后生成的静态页面文件 | 不需要 |
| packages.json | 记录了hexo需要的包的信息，之后换电脑了npm根据这个信息来安装hexo环境 | 需要 |
| _config.yml | 全局配置文件 | 需要 |
| .gitignore | hexo生成的默认的.gitignore模块，不需要上传的文件需要写入到.gitignore中 | 需要 |
| scaffolds | 文章的模板 | 需要 |
| .deploy_git | hexo g自动生成的 | 不需要 |

2. 同步原理
主要思路是利用git分支来实现hexo的同步。
hexo生成的静态页面文件默认放在master分支上，这是由_config.yml配置文件所决定的
你可以在全局配置文件_config.yml中找到这么一段
``` yml
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: git
  repo: git@github.com:username/username.github.io.git
  branch: master
```

因此每当我们执行hexo d的时候，hexo都会帮我们把生成好的静态页面文件推到master分支上。

在我们第一次部署好博客的时候，github给我们创建的唯一一个分支就是master分支，同时也是默认分支。默认分支就意味着每次我们执行git clone 仓库地址或者git pull 仓库地址拉取的是默认分支的代码。

但是执行hexo d 对应的分支和默认分支是没有关系的，因为这是由配置文件决定的，配置文件写的哪个分支就是哪个分支。

因此，hexo生成的静态博客文件默认放在master分支上。hexo的源文件（部署环境文件，书写的MD源文件）可以都放在source分支上（可以新创建一个source分支或者hexo分支），分支的名字可以随意。然后把Hexo分支设置成默认分支。有小伙伴可能会担心默认分支的改变会不会影响到原来的网页的正常显示，其实如果是用GitHub Pages对博客进行托管的话也很简单，第一次搭建博客默认使用master分支作为页面。在下图所示的设置里可以找到。如果不小心搞错了只要把分支设置成静态页面对应的分支就好了。

- 新建一个source分支用于存放hexo的源文件
![使用Git实现hexo多端同步-2](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/使用Git实现hexo多端同步-2.7fdnswx21qw0.webp)

- 把source分支设置成默认分支，用来存放源文件，master分支依然存放静态文件。
![使用Git实现hexo多端同步-3](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/使用Git实现hexo多端同步-3.2xw1u3fcz5e0.webp)


在**老电脑**上，我们需要把必要的源文件push到source分支。换**新电脑**时，直接git clone 仓库地址此时会从**source分支下载源文件**，剩下的就是安装hexo环境，在新电脑上就可以重新生成静态页面了，并且因为配置文件clone下来，deploy配置依旧是master分支，所以在新电脑上执行hexo d还是会把更新过后的静态文件推送到master分支上。

由于master分支和source分支实际上是相互独立的两个普通的分支，所以我们源文件和静态页面的更新也是相互独立的，故而需要手动分别执行
下面git 代码来更新源文件,然后执行hexo d更新静态页面。
``` shell
git add . 
git commit -m "Description"
git push
```

## 操作步骤

### 老电脑上的操作
1. 按照上文操作建好新source分支并设为默认分支
2. 打包将要推送到GitHub上的原始文件
   1. clone该仓库到本地（clone的是hexo默认分支）
   2. 下载的文件夹里仅留下 **.git** 文件夹，其他的文件都删除
   3. 找到hexo的原位置，将hexo文件夹内除.deploy_git 以外的文件都复制到clone下来的文件夹中（这里的文件名应该是你仓库的名字）
**tips:** 
   4. 现在clone下来的文件夹内应该有个.gitignore文件，用来忽略一些不需要的文件，表示这些类型文件不需要git。如果没有，右键新建，内容如下： 
``` shell
 .DS_Store
 Thumbs.db
 db.json
 *.log
 node_modules/
 public/
 .deploy*/
```
   5. 如果你是使用git clone下载的主题文件，那么**需要把theme主题文件夹里的 .git 也删除**。因为git不能嵌套上传，最好是显示隐藏文件，检查一下有没有，否则上传的时候会出错，导致你的主题文件无法上传，这样你的配置在别的电脑上就用不了了。
3. 将clone并修改以后的文件夹推送到远程库
   
``` shell
git add .
git commit –m add_branch
git push
```
此时已经成功将整个网站推送到了远程库的默认分支source

### 将hexo文件push到github仓库  
至此，网站部署至master分支，整个网站备份至hexo分支。当网站的配置或文章修改后都要将远程仓库更新。首先，依次执行
``` shell
git add .
git commit -m ChangeFiles（更新信息内容可改）
git push （或者git push origin source）

#保证hexo分支版本最新。然后正常执行部署hexo
hexo clean
hexo d -g
```

### 在新电脑上的操作
#### 配置SSH密钥
1. 首先在新设备上安装node.js和git并且生成SSH Key

``` shell
git config --global user.name "你要设置的名字"
git config --global user.email "你要设置的邮箱"
```

2. 之后生成SSH密钥：
``` shell
ssh-keygen -t rsa -C "你刚刚设置的邮箱"
```

如果不需要设置密码的话，连续三个回车就好了。在这之后会得到两个文件： id_rsa 和 id_rsa.pub
找到id_rsa.pub文件(默认位置在C盘，一般也不建议改动位置)，用记事本打开，复制其内容。

Win路径： C:\Users\（你的用户名）\.ssh
MacOS路径：/Users/（你的用户名）/.ssh/

#### 在GitHub上添加SSH密钥
登录GitHub，在Settings里面选择 [SSH and GPG keys](https://github.com/settings/keys) ，然后点击 New SSH Key
这里应该包含你新老两个电脑的SHH密钥，如果你有多个电脑那就应该都要加入

完成之后测试一下，在git bash输入：
``` shell
ssh -T git@github.com
```

![image](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/image.4zjhmnniaas0.webp)

#### 安装hexo
在新设备上找到要存在博客文件的位置，然后clone仓库(仓库地址直接复制GitHub的SSH地址即可)：
```shell
git clone git@github.com:username/hexo
```

进入文件夹，执行如下命令配置Hexo：
``` shell
npm install -g hexo-cli
npm install
```

这里在新设备上一定要先用git clone来获取文件，如果是先安装hexo的话可能会因为hexo的版本不一致导致无法同步

在完成上面操作之后就是正常的使用 ```hexo d -g```来部署网页了

每次写完博客之后，需要顺便将修改push到github仓库中，操作和上面一样
每次转移到另一台设备的时候，先执行git pull命令就可以同步github仓库中的最新文件，然后就可以愉快地写博客了

## 写在最后
学计算机学到现在更能深刻的理解只有有需求才会去学习，早在一两年前刚开始折腾个人博客的时候就听说过git来同步很好用，但是当时觉得只会用一台设备没必要折腾，而且天然的会有一些畏惧心理。
最近因为有多台设备来写博客的原因才又把git捡回来了，之前觉得难以理解的操作现在尝试一遍后倒也觉得没那么难，但是回头想来如果没有之前的一点点尝试而是一开始就想一步到位也是很难的事情。
所以，在学习使用新工具的时候不要强求自己一步到位能彻底掌握，在使用的时候也不必强求一定要做到完美才去使用。发现痛点再去尝试解决不免也是一种好的方法，在学习中一定要及时的给自己一点正反馈。