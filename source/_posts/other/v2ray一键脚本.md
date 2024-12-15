---
title: v2ray一键脚本
date: 2022-06-27 15:02:31
category: 实用工具教程 
tags: 一键脚本 
---
## 自己使用过的一些科学上网脚本
<!-- more -->
### 一：[ss2022](https://github.com/loyess/2022)

### 一键脚本：
``` bash
curl -OL https://github.com/loyess/2022/raw/main/2022script.sh

chmod +x 2022script.sh
./2022script.sh
```
#### 卸载：
``` bash
./2022script.sh --remove
```
#### 管理面板：
``` bash
./2022script.sh -h
```
>Writing <ss://links> information into: /root/rustss2022/url_scheme.conf //节点信息

>Writing service information into: /etc/systemd/system/ss-rust.service

### 二：[v2ray-agent脚本](https://github.com/mack-a/v2ray-agent)
``` baah
wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh
```

### 管理面板：**vasma**


### 三：233boy脚本(现已不建议使用)
#### 1.安装 V2Ray
``` bash
bash <(curl -s -L https://git.io/v2ray.sh)
```
如果提示 curl: command not found ，那是因为你的 VPS 没装 Curl
ubuntu/debian : 
``` bash
apt-get update -y && apt-get install curl -y
```
centos 系统安装 Curl 方法: 
``` bash
yum update -y && yum install curl -y
```
安装好 curl 之后就能安装脚本了

#### 2.开启谷歌BBR加速
本文的系统要求为 Debian 9或更高版本的 Debian Linux

命令1：
``` bash
wget https://raw.githubusercontent.com/bannedbook/fanqiang/master/v2ss/server-cfg/sysctl.conf -O -> /etc/sysctl.con
```
注：如果提示 wget: command not found 的错误，这是因为你的系统wget没有安装，所以需要安先装 wget:
``` bash
apt-get install -y wget
```
命令2：
``` bash
sysctl -p
```

#### 3.快速管理 V2Ray
```
v2ray info 查看 V2Ray 配置信息
v2ray config 修改 V2Ray 配置
v2ray link 生成 V2Ray 配置文件链接
v2ray infolink 生成 V2Ray 配置信息链接
v2ray qr 生成 V2Ray 配置二维码链接
v2ray ss 修改 Shadowsocks 配置
v2ray ssinfo 查看 Shadowsocks 配置信息
v2ray ssqr 生成 Shadowsocks 配置二维码链接
v2ray status 查看 V2Ray 运行状态
v2ray start 启动 V2Ray
v2ray stop 停止 V2Ray
v2ray restart 重启 V2Ray
v2ray log 查看 V2Ray 运行日志
v2ray update 更新 V2Ray
v2ray update.sh 更新 V2Ray 管理脚本
v2ray uninstall 卸载 V2Ray
```