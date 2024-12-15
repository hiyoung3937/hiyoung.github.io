---
title: 在虚拟机中设置静态Ip（centos为例）
date: 2022-09-03 11:08:20
tags: [Linux,网络配置]
category: [学习笔记,Linux]
---
### 一、虚拟机设置

在菜单栏选择编辑→ 虚拟网络编辑器，打开虚拟网络编辑器对话框，选择Net网络连接方式，随意设置子网IP，点击NAT设置页面，查看子网掩码和网关，后面修改静态IP会用到。

在VMnet8模式下选择nat连接，并且取消DHCP服务。
<!-- more -->

![设置静态IP_](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/blog_config/设置静态IP_.1png.17pkik590cyo.webp)
点击NAT设置，记录下此时的网关

![设置静态IP_2](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/blog_config/设置静态IP_2.7ekm3kk01u40.webp)

在系统的网络设置处，检查VMnet8的网络配置

![设置静态IP_3](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/blog_config/设置静态IP_3.7jon5g0ujuc0.webp)

### 二、Liunx主机设置

1. 在root权限下输入命令 ```cd /etc/sysconfig/network-scripts``` 进入该文件夹，输入命令 ```ls``` 浏览该文件夹下的文件，找到```ifcfg-en***```文件，如下图所示：

![设置静态IP_4](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/blog_config/设置静态IP_4.17zbfvv7ytuo.webp)

2. ```vim ifcfg-en***```打开文件

![](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/设置静态IP_5.1dtjdfu2j734.jpg)

1. 将BOOTPROTO="dhcp"改为BOOTPROTO="static"、ONBOOT="no"改为ONBOOT="yes"

并在下方添加
``` bash

IPADDR=*your ip*（静态IP地址）

NETMASK=*your netmask*（子网掩码，一般为255.255.255.0）

GATEWAY=*your gateway*（网关地址）

DNS1=8.8.8.8（国内外公共DNS即可）

DNS2=8.8.4.4
```
4. 最后输入:wq退出即可
