---
title: 搭建hexo错误记录
date: 2022-06-24 16:25:02
tags: 教程
category: [前端,网站建设]
---

## 搭建中遇到的问题

两次连接都遇到免密登录失败的问题。
首先按照教程操作

在本地Git设置个人信息：
```
git config --global user.name "user.name"
git config --global user.email "user@gmail.com"
```

生成密钥：
```
ssh-keygen -t rsa -C "你刚刚设置的邮箱"
```

本地SSH keys: 路径： C:\Users\（你的用户名）\.ssh

找到id_rsa.pub文件，用记事本打开，复制其内容。

！！注意：这里复制到服务器上后要看后面的邮箱的 ```“”``` 有没有去掉和前面是不是```ssh-rsa``` (两次都是这里出错)！！

然后就是按照教程设置权限等


### 2024/7/18记录

遇到了测试```ssh -T git@github.com```时```Connection closed by 20.205.243.166 port 22```
并且在部署hexo是也出现了```hexo Connection closed by 20.205.243.166 port 22```

解决方法：
先测试一下```ssh -T -p 443 git@ssh.github.com```是否能连通
如果可以
这时候在hexo的配置文件中把```deploy:```下的```rpeo```从```git@...改为https:// ```
然后重新部署（可能需要本地开代理）即可



