---
title: 云服务器部署code-server
date: 2022-08-15 21:37:12
tags:
categories: 实用工具教程
---
## 部署 code-server

1. 首先，我们需要下载 **code-server**，我们这里需要下载[最新版本的 code-server](https://github.com/coder/code-server)
<!--more-->
2. 之后，我们使用 tar 工具解压下载得到的压缩包，之后进入解压好的文件目录中：

``` bash
# 解压缩 tar.gz 压缩包
tar xf code-server-3.1.1.tar.gz #3.1.1版本为例，具体按照包名而定

# 进入解压得到的文件夹
cd code-server-3.1.1-linux-x86_64

```

3. 设置登录密码启动

``` bash
export PASSWORD="设置登录密码" 
#这里我们是在服务器上面设置了名为 PASSWORD 的环境变量为 {YOUR_CODE_SERVER_PASSWORD}
#这样后面 code-server 启动后就会直接读取这一环境变量并将之作为你的登录密码。

./code-server --host="0.0.0.0" #启动服务
```

4. 验证登录

之后，code-server 进程就在远程服务器上启动并开始监听 8080 端口了，同时可以看到 code-server 正在使用我们自定义的密码（custom password）作为认证密码。这里，我们还需要将 code-server 默认监听的 8080 端口在服务器防火墙中设置开放，之后我们才能直接通过 ```{服务器 IP 地址}:{code-server 端口}``` 的 URL 地址在浏览器中直接访问 code-server。

如果一切顺利，此时我们在 iPad 上面用浏览器直接访问 {服务器 IP 地址}:{code-server 端口}，输入刚刚设置的密码，就能够打开一个完整的在线版 VS Code:

![云服务器部署code-server1](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/云服务器部署code-server1.2fypthb8vlhc.jpg)

## Docker部署

``` bash

docker run -it -d -p 8080:8080 \
  -v "$PWD:/home/coder/project" \
  -e PASSWORD='设置你的登录密码' \
  -u "$(id -u):$(id -g)" \
  codercom/code-server:latest
```

------------ 
引用： https://www.bbsmax.com/A/x9J2YBAKz6/

