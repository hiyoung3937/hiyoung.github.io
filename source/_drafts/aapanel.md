#### 1.在线安装
``` bash
Centos/Debian/Fedora:
yum install -y wget && wget -O install.sh http://www.aapanel.com/script/install_6.0_en.sh && bash install.sh forum

Ubuntu：
wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && sudo bash install.sh forum
```
#### 2.安装中文补丁
链接地址：https://gitee.com/gacjie/aapanel_chinese
``` bash
curl https://gitee.com/gacjie/aapanel_chinese/raw/master/update6_en.sh|bash
```
>1.下载文件包解压文件
>2.将panel文件夹打包
>3.上传到/www/server目录下
>4.解压文件包覆盖文件
>5.重启宝塔面板


