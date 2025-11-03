---
title: 飞牛NAS备忘录
tags: [nas,飞牛OS]
categories: [软件,NAS]
cover: false
date: 2025-10-20 15:01:21
mathjax:
---

## DNS拦截与Nginx设置

在本地网络中使用nas应用一般都是直接访问IP地址使用，使用DNS拦截可以在本地使用域名访问相应的应用
在 NAS 或家庭局域网 中，DNS 拦截非常有用。
比如:
- emby.hiyoung.icu → 永远指向 NAS 局域网 IP
- 让 Cloudflare DDNS 只影响公网，而内网访问时走本地 IP

下面是操作步骤：
1. 飞牛Nginx操作
   飞牛OS自带Nginx，我们想要去使用nginx-UI去使用web管理反代，所以首先要对飞牛进行一些操作
   飞牛默认会监听80和443端口，要对他进行一些设置，有两个方法可以解决
   - 使用Docker安装的Nginx可以映射到其他的端口，例如：8080:80，但是这样设置后使用域名访问还是需要加上8080的端口才可以，因此不推荐。
   - 在**系统设置→安全性→端口设置→高级设置**里把**重定向80与443端口**的勾去掉，确认之后就释放了80，443端口，因为飞牛系统默认的nginx官方加了防篡改，因此在```/usr/trim/nginx/conf/nginx.conf```路径中直接修改配置文件是不生效的。
2. 安装nginx-ui
    1. 确定80和443端口释放之后就可以安装nginx-ui了，下面使用docker compose安装
    ``` yaml
    version: '3.1' 
    services: 
        nginx-ui:
            image: uozi/nginx-ui:latest
            container_name: nginx_UI
            volumes:
            - /vol1/1000/docker/nginx/nginx:/etc/nginx          #编辑为docker安装的路径
            - /vol1/1000/docker/nginx/nginx-ui:/etc/nginx-ui    #编辑为docker安装的路径
            - /vol1/1000/docker/nginx/www:/www                  #编辑为docker安装的路径
            environment:    
            - NGINX_UI_IGNORE_DOCKER_SOCKET=true
            ports:
            - 80:80
            - 443:443
            restart: always
    ```
    安装好后在80端口启动即可
    2. 操作过程
       1. 进入nginx ui，**网站管理->添加站点**，配置名称中填写这个服务的名字
       ```server_name```字段填写需要劫持的域名，例如：**emby.XXX.com（这里要确保这个域名你不用）**
       其他不用修改，点击下一步即可
       2. 回到**网站管理->站点列表**，就可以看到你刚才创建的配置了
       点击**编辑->右边搜索配置模板->反向代理->查看**，到最下面找到Locations字段
       ```yaml
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
        client_max_body_size 1000m;
        proxy_redirect off;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Forwarded $proxy_add_forwarded;
        proxy_pass http://127.0.0.1:9000/;  #edit
        ```
        需要将```proxy_pass http://127.0.0.1:9000/; ``` 修改为```proxy_pass http://172.17.0.1:docker应用的端口号/;```
        > 这里将要将IP设置为172.17.0.1，这是docker默认的网关
        点击**添加**即可。
3. 路由器设置
   进入路由器后台，每个路由器可能不太一样，我这里是openwrt。
   在**网络->DHCP/DNS->自定义挟持域名**，这里要注意，连接网络的设备DNS服务器要是路由器才可以，一般默认都是路由器。

至此，在内网中使用DNS劫持进行内网重定向设置完成。

## 设置windows本地访问并挂载盘符

在飞牛中设置smb访问权限，注意这里飞牛的系统如果在**我的文件**下直接新建文件夹会导致在smb共享时无法访问所有文件夹，所以在建立文件时建议建立一个大的文件夹，将所有文件放在此文件夹下。

设置完成后，回到windouws。
使用```win+R```，进入cmd，输入以下命令：
``` bash
net use  //查看当前所有映射
net use * /delete //删除所有映射，如果没有可以不执行
net use Z: \\192.168.1.10\samba /user:用户名 密码 /persistent:yes
explorer.exe Z:
```
> 命令解释
>映射到盘符Z， \\192.168.1.10\samba  这里是nas的smb路径自己设置即可
>/user:用户名 密码   这里填写nas的管理员账号和登陆密码

完成以上步骤之后就可以在资源管理器中查看nas已经被映射为Z盘了，有一定概率资源管理器缓存没刷新，强制重启一下资源管理器即可