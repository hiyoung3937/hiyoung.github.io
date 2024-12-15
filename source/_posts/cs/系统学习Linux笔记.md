---
title: 系统学习Linux笔记
date: 2022-08-01 15:11:02
category: [学习笔记,Linux]
tag: Linux
---

**笔记中命令在无特殊说明情况下以CentOS 7为准**

<p>（参考视频：<a rel="noreferrer noopener" href="https://www.bilibili.com/video/BV1WY4y1H7d3?p=1" target="\_blank">https://www.bilibili.com/video/BV1WY4y1H7d3?p=1</a>）</p>

<!--more -->
<h2 id="一-基础篇">一、基础篇</h2>

<h3 id="1-1-linux文件系统目录结构">1.1 Linux文件系统目录结构</h3>

![系统学习Linux笔记_1](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/系统学习Linux笔记_1.12hb12rw6m28.jpg)
<a href="https://www.runoob.com/linux/linux-system-contents.html" data-type="URL" data-id="https://www.runoob.com/linux/linux-system-contents.html">来源：菜鸟教程</a></figcaption></figure>

![系统学习Linux笔记_2](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/系统学习Linux笔记_2.6iyv14qs1kc0.jpg)
<figcaption>图中小箭头表示该文件实际位置在别处</figcaption>

<ul><li><strong>/bin</strong>：<br>bin 是 Binaries (二进制文件) 的缩写, 这个目录存放着最经常使用的命令。</li><li><strong>/boot：</strong><br>这里存放的是启动 Linux 时使用的一些核心文件，包括一些连接文件以及镜像文件。</li><li><strong>/dev ：</strong><br>dev 是 Device(设备) 的缩写, 该目录下存放的是 Linux 的外部设备，在 Linux 中访问设备的方式和访问文件的方式是相同的。</li><li><strong>/etc：</strong><br>etc 是 Etcetera(等等) 的缩写,这个目录用来存放所有的系统管理所需要的配置文件和子目录。</li><li><strong>/home</strong>：<br>用户的主目录，在 Linux 中，每个用户都有一个自己的目录，一般该目录名是以用户的账号命名的，如上图中的 alice、bob 和 eve。</li><li><strong>/lib</strong>：<br>lib 是 Library(库) 的缩写这个目录里存放着系统最基本的动态连接共享库，其作用类似于 Windows 里的 DLL 文件。几乎所有的应用程序都需要用到这些共享库。</li><li><strong>/lost+found</strong>：<br>这个目录一般情况下是空的，当系统非法关机后，这里就存放了一些文件。</li><li><strong>/media</strong>：<br>linux 系统会自动识别一些设备，例如U盘、光驱等等，当识别后，Linux 会把识别的设备挂载到这个目录下。</li><li><strong>/mnt</strong>：<br>系统提供该目录是为了让用户临时挂载别的文件系统的，我们可以将光驱挂载在 /mnt/ 上，然后进入该目录就可以查看光驱里的内容了。</li><li><strong>/opt</strong>：<br>opt 是 optional(可选) 的缩写，这是给主机额外安装软件所摆放的目录。比如你安装一个ORACLE数据库则就可以放到这个目录下。默认是空的。</li><li><strong>/proc</strong>：<br>proc 是 Processes(进程) 的缩写，/proc 是一种伪文件系统（也即虚拟文件系统），存储的是当前内核运行状态的一系列特殊文件，这个目录是一个虚拟的目录，它是系统内存的映射，我们可以通过直接访问这个目录来获取系统信息。<br>这个目录的内容不在硬盘上而是在内存里，我们也可以直接修改里面的某些文件，比如可以通过下面的命令来屏蔽主机的ping命令，使别人无法ping你的机器：echo 1 &gt; /proc/sys/net/ipv4/icmp\_echo\_ignore\_all</li><li><strong>/root</strong>：<br>该目录为系统管理员，也称作超级权限者的用户主目录。</li><li><strong>/sbin</strong>：<br>s 就是 Super User 的意思，是 Superuser Binaries (超级用户的二进制文件) 的缩写，这里存放的是系统管理员使用的系统管理程序。</li><li><strong>/selinux</strong>：<br>&nbsp;这个目录是 Redhat/CentOS 所特有的目录，Selinux 是一个安全机制，类似于 windows 的防火墙，但是这套机制比较复杂，这个目录就是存放selinux相关的文件的。</li><li><strong>/srv</strong>：<br>&nbsp;该目录存放一些服务启动之后需要提取的数据。</li><li><strong>/sys</strong>：这是 Linux2.6 内核的一个很大的变化。该目录下安装了 2.6 内核中新出现的一个文件系统&nbsp;sysfs&nbsp;。sysfs 文件系统集成了下面3种文件系统的信息：针对进程信息的 proc 文件系统、针对设备的 devfs 文件系统以及针对伪终端的 devpts 文件系统。该文件系统是内核设备树的一个直观反映。当一个内核对象被创建的时候，对应的文件和目录也在内核对象子系统中被创建。</li><li><strong>/tmp</strong>：<br>tmp 是 temporary(临时) 的缩写这个目录是用来存放一些临时文件的。</li><li><strong>/usr</strong>：<br>&nbsp;usr 是 unix shared resources(共享资源) 的缩写，这是一个非常重要的目录，用户的很多应用程序和文件都放在这个目录下，类似于 windows 下的 program files 目录。</li><li><strong>/usr/bin：</strong><br>系统用户使用的应用程序。</li><li><strong>/usr/sbin：</strong><br>超级用户使用的比较高级的管理程序和系统守护程序。</li><li><strong>/usr/src：</strong><br>内核源代码默认的放置目录。</li><li><strong>/var</strong>：<br>var 是 variable(变量) 的缩写，这个目录中存放着在不断扩充着的东西，我们习惯将那些经常被修改的目录放在这个目录下。包括各种日志文件。</li><li><strong>/run</strong>：<br>是一个临时文件系统，存储系统启动以来的信息。当系统重启时，这个目录下的文件应该被删掉或清除。如果你的系统上有 /var/run 目录，应该让它指向 run。</li></ul>


<h3 id="1-2-文件基本属性">1.2 文件基本属性</h3>


<h4 id="1-2-1-基本属性">1.2.1 基本属性</h4>


<p>在 Linux 中第一个字符代表这个文件是目录、文件或链接文件等等。</p>


<ul><li>当为&nbsp;<strong>d</strong>&nbsp;则是目录</li><li>当为&nbsp;<strong>-</strong>&nbsp;则是文件；</li><li>若是&nbsp;<strong>l</strong>&nbsp;则表示为链接文档(link file)；</li><li>若是&nbsp;<strong>b</strong>&nbsp;则表示为装置文件里面的可供储存的接口设备(可随机存取装置)；</li><li>若是&nbsp;<strong>c</strong>&nbsp;则表示为装置文件里面的串行端口设备，例如键盘、鼠标(一次性读取装置)。</li></ul>


<p>接下来的字符中，以三个为一组，且均为&nbsp;<strong>rwx</strong>&nbsp;的三个参数的组合。其中，&nbsp;<strong>r</strong>&nbsp;代表可读(read)、&nbsp;<strong>w</strong>&nbsp;代表可写(write)、&nbsp;<strong>x</strong>&nbsp;代表可执行(execute)。 要注意的是，这三个权限的位置不会改变，如果没有权限，就会出现减号&nbsp;<strong>-</strong>&nbsp;。</p>

<figure class="wp-block-image size-large"><img src="https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/系统学习Linux笔记_3.1sdygu2698gw.jpg" alt=""/></figure>


<p>每个文件的属性由左边第一部分的 10 个字符来确定（如下图）。</p>

<figure class="wp-block-image size-large"><img src="https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/系统学习Linux笔记_4.510d3vw6p640.jpg" alt="363003\_1227493859FdXT"/></figure>


<p>从左至右用&nbsp;<strong>0-9</strong>&nbsp;这些数字来表示。</p>

<p>第&nbsp;<strong>0</strong>&nbsp;位确定文件类型，第&nbsp;<strong>1-3</strong>&nbsp;位确定属主（该文件的所有者）拥有该文件的权限。第4-6位确定属组（所有者的同组用户）拥有该文件的权限，第7-9位确定其他用户拥有该文件的权限。</p>


<p>其中，第&nbsp;<strong>1、4、7</strong>&nbsp;位表示读权限，如果用&nbsp;<strong>r</strong>&nbsp;字符表示，则有读权限，如果用&nbsp;<strong>-</strong>&nbsp;字符表示，则没有读权限；</p>


<p>第&nbsp;<strong>2、5、8</strong>&nbsp;位表示写权限，如果用&nbsp;<strong>w</strong>&nbsp;字符表示，则有写权限，如果用&nbsp;<strong>-</strong>&nbsp;字符表示没有写权限；第&nbsp;<strong>3、6、9</strong>&nbsp;位表示可执行权限，如果用&nbsp;<strong>x</strong>&nbsp;字符表示，则有执行权限，如果用&nbsp;<strong>-</strong>&nbsp;字符表示，则没有执行权限。</p>


<h4 id="1-2-2-linux文件属主和属组">1.2.2 Linux文件属主和属组</h4>


<h4 id="1-chgrp-更改文件属组">1、chgrp：更改文件属组</h4>


<p>语法：</p>


<pre class="wp-block-preformatted" >chgrp [-R] 属组名 文件名</pre>

<p>参数选项</p>

<ul><li>-R：递归更改文件属组，就是在更改某个目录文件的属组时，如果加上-R的参数，那么该目录下的所有文件的属组都会更改。</li></ul>



<h4 id="2-chown-更改文件属主-也可以同时更改文件属组">2、chown：更改文件属主，也可以同时更改文件属组</h4>



<p>语法：</p>

<pre class="wp-block-preformatted">chown [–R] 属主名 文件名

chown [-R] 属主名：属组名 文件名</pre>


<p>进入 /root 目录（~）将install.log的拥有者改为bin这个账号：</p>


<pre class="wp-block-code"><code>&#91;root@www ~] cd ~

&#91;root@www ~]# chown bin install.log

&#91;root@www ~]# ls -l

- rw-r--r--  1 bin  users 68495 Jun 25 08:53 install.log</code></pre>


<p>将install.log的拥有者与群组改回为root：</p>

<pre class="wp-block-code"><code>&#91;root@www ~]# chown root:root install.log

&#91;root@www ~]# ls -l

- rw-r--r--  1 root root 68495 Jun 25 08:53 install.log</code></pre>


<h4 id="3-chmod-更改文件9个属性">3、chmod：更改文件9个属性</h4>


<p>Linux文件属性有两种设置方法，一种是数字，一种是符号。</p>

<p>Linux 文件的基本权限就有九个，分别是&nbsp;<strong>owner/group/others(拥有者/组/其他)</strong>&nbsp;三种身份各有自己的&nbsp;<strong>read/write/execute</strong>&nbsp;权限。</p>

<p>先复习一下刚刚上面提到的数据：文件的权限字符为：&nbsp;<strong>-rwxrwxrwx</strong>&nbsp;， 这九个权限是三个三个一组的！其中，我们可以使用数字来代表各个权限，各权限的分数对照表如下：</p>

<ul><li>r:4</li><li>w:2</li><li>x:1</li></ul>

<p>每种身份(owner/group/others)各自的三个权限(r/w/x)分数是需要累加的，例如当权限为：&nbsp;<strong>-rwxrwx---</strong>&nbsp;分数则是：</p>

<ul><li>owner = rwx = 4+2+1 = 7</li><li>group = rwx = 4+2+1 = 7</li><li>others= --- = 0+0+0 = 0</li></ul>

<p>所以等一下我们设定权限的变更时，该文件的权限数字就是&nbsp;<strong>770</strong>。变更权限的指令 chmod 的语法是这样的：</p>

<pre class="wp-block-preformatted"> chmod [-R] xyz 文件或目录</pre>


<p>选项与参数：</p>


<ul><li><strong>xyz</strong>&nbsp;: 就是刚刚提到的数字类型的权限属性，为&nbsp;<strong>rwx</strong>&nbsp;属性数值的相加。</li><li><strong>-R</strong>&nbsp;: 进行递归(recursive)的持续变更，以及连同次目录下的所有文件都会变更</li></ul>

<p>举例来说，如果要将&nbsp;<strong>.bashrc</strong>&nbsp;这个文件所有的权限都设定启用，那么命令如下：</p>

<pre class="wp-block-code"><code>&#91;root@www ~]# ls -al .bashrc

- rw-r--r--  1 root root 395 Jul  4 11:45 .bashrc

&#91;root@www ~]# chmod 777 .bashrc

&#91;root@www ~]# ls -al .bashrc

- rwxrwxrwx  1 root root 395 Jul  4 11:45 .bashrc</code></pre>

<p>那如果要将权限变成&nbsp;<em>-rwxr-xr--</em>&nbsp;呢？那么权限的分数就成为 [4+2+1][4+0+1][4+0+0]=754。</p>

<h4 id="4-符号类型改变文件权限">4、符号类型改变文件权限</h4>

<p>还有一个改变权限的方法，从之前的介绍中我们可以发现，基本上就九个权限分别是：</p>


<ul><li>user：用户</li><li>group：组</li><li>others：其他</li></ul>

<p>那么我们就可以使用&nbsp;<strong>u, g, o</strong>&nbsp;来代表三种身份的权限。</p>

<p>此外，&nbsp;<strong>a</strong>&nbsp;则代表&nbsp;<strong>all</strong>，即全部的身份。读写的权限可以写成&nbsp;<strong>r, w, x</strong>，也就是可以使用下表的方式来看：</p>
 

<figure class="wp-block-table"><table><tbody><tr><td>chmod</td><td>u<br>g<br>o<br>a</td><td>+(加入)<br>-(除去)<br>=(设定)</td><td>r<br>w<br>x</td><td>文件或目录</td></tr></tbody></table></figure>



<p>如果我们需要将文件权限设置为&nbsp;<strong>-rwxr-xr--</strong>&nbsp;，可以使用&nbsp;<strong>chmod u=rwx,g=rx,o=r 文件名</strong>&nbsp;来设定:</p>

<pre class="wp-block-code"><code>#  touch test1    // 创建 test1 文件

\# ls -al test1    // 查看 test1 默认权限

- rw-r--r-- 1 root root 0 Nov 15 10:32 test1

\# chmod u=rwx,g=rx,o=r  test1    // 修改 test1 权限

\# ls -al test1

- rwxr-xr-- 1 root root 0 Nov 15 10:32 test1</code></pre>

<p>而如果是要将权限去掉而不改变其他已存在的权限呢？例如要拿掉全部人的可执行权限，则：</p>

<pre class="wp-block-code"><code>#  chmod  a-x test1

\# ls -al test1

- rw-r--r-- 1 root root 0 Nov 15 10:32 test1</code></pre>

<h3 id="1-3-vim文本编辑">1.3 vim文本编辑</h3>

<h4 id="1-3-1-vim的三种模式">1.3.1 vim的三种模式</h4>

<p>基本上 vi/vim 共分为三种模式，分别是<strong>命令模式</strong>、<strong>编辑模式</strong>和<strong>一般模式</strong></p>

![系统学习Linux笔记_5](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/系统学习Linux笔记_5.fwdyadc7qdc.jpg)

<h4 id="1-3-2-vim快捷命令">1.3.2 vim快捷命令</h4>


<p>参考外部网站：<a href="https://www.runoob.com/linux/linux-vim.html">https://www.runoob.com/linux/linux-vim.html</a></p>


<h3 id="1-4-网络配置">1.4 网络配置</h3>


<h4 id="1-4-1-vmware的三种网络连接模式">1.4.1  VMware的三种网络连接模式</h4>

<p>桥接模式：虚拟机直接连接外部网络（对外部网络可见），主机起到网桥的作用，虚拟机的地位和主机相同，从路由器分配独立的IP地址。</p>


<p>NAT模式：主机和虚拟机构建一个专用网络，使用NAT对虚拟机进行IP转换（虚拟机对外部网络不可见）。此时虚拟机单独组成一个局域网，此时主机和虚拟机并不在一个网段，无法进行通信，所以又虚拟一个网卡（VMnet8）来连接至虚拟机所在的局域网。</p>


<p>仅主机模式：这种模式仅仅只让虚拟机与主机通信，不连接至Internet</p>

![系统学习Linux笔记_6](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/系统学习Linux笔记_6.51mtatfmudg0.jpg)


![系统学习Linux笔记_7](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/系统学习Linux笔记_7.1rszg1kh8600.jpg)


<h4 id="1-4-2-配置静态ip">1.4.2 配置静态IP</h4>


<p>参考博客文章：<a href="https://yexca.xyz/index.php/2022/04/22/%e5%9c%a8%e8%99%9a%e6%8b%9f%e6%9c%ba%e4%b8%ad%e8%ae%be%e7%bd%ae%e9%9d%99%e6%80%81ip%ef%bc%88centos%e4%b8%ba%e4%be%8b%ef%bc%89/">在虚拟机中设置静态IP（centos为例）</a></p>


<h4 id="1-4-3-配置主机名">1.4.3 配置主机名</h4>


<pre class="wp-block-code"><code>hostname #查看当前主机名

vim /etc/hostname  #修改主机名

#修改后重启即可显示新主机名

#方法二

hostnamectl set-hostname ...

#实时生效</code></pre>


<pre class="wp-block-code"><code>#修改hosts文件

vim /etc/hosts</code></pre>


<h3 id="1-5-系统管理">1.5 系统管理</h3>


<h4 id="1-5-1-service-服务管理">1.5.1 service 服务管理</h4>

<p>一个正在执行的程序或命令，称为“进程”</p>

<p>启动后一直存在、常驻内存的进程，一般称为“服务”</p>

<pre class="wp-block-code"><code>systemctl start|stop|restart|status servicename #基本语法

/usr/lib/systemd/system/    #服务所在目录</code></pre>

<!--以上为word press导出-->
#### 1.5.2 系统的运行级别

![系统学习Linux_8](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/系统学习Linux_8.4koxejpo5300.jpg)

##### 1. CentOS 7的运行级别简化为：

multi-user.target == 原运行级别3(多用户有网,无GUI)
garphical.target  == 原运行级别5(多用户有网,有GUI) 

##### 2. 查看当前默认运行级别

``` bash
systemctl get-default
```

##### 3. 切换运行级别
``` bash
init 3 //switch runlevel 3
init 5 //switch runlevel 5
```

#### 1.5.3 配置服务开机自启

##### 1. CentOS 7之前
``` bash
chkconfig --list //Centos 7之前查看自启服务(SysV)

chkconfig network off/on //关闭network开机自启

chkconfig --level 3 network off/on //针对某一运行级别设置开机自启
```

![系统学习Linux_9](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/系统学习Linux_9.7bral6n1ulg0.jpg)

##### 2. CentOS 7之后
``` bash
systemctl list-unit-files //查看开机自启服务

systemctl disable/enable NetworkManager(SerciseName) 
//对于CentO S 7及以上使用systemctl控制开机自启(这里以NetworkManager为例)
```

##### 3.练习_设置防火墙

``` bash
systemctl status firewalld.service //CentOS 7之前防火墙为iptables

systemctl disable firewalld.service //turn off firewalld Auto-start
```

#### 1.5.4 关机重启

![系统学习Linux_10](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/系统学习Linux_10.3yaooufylio.jpg)

<table>
<tr>
<td>选项</td>   <td>功能</td>
</tr>
<tr>
<td>-H</td>     <td>相当于--halt,停机</td>
</tr>
<tr>
<td>-r</te>     <td>shurdown -r == reboot 重启</td>
</tr>
</table>

<table>
<tr>
<td>参数</td>   <td>功能</td>
</tr>
<tr>
<td>now</td>     <td>立刻执行</td>
</tr>
<tr>
<td>时间</te>     <td>多少时间后执行(单位是分钟)</td>
</tr>
</table>

## 二、实操篇

#### 2.1 帮助命令
##### 1. 基本语法
``` bash
man [命令或配置文件]  //获取帮助信息（全）
```
 ![系统学习Linux笔记_11](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/系统学习Linux笔记_11.6lkzrpquars0.jpg)
 <center style="color:#FF69B4;font-size:16px;text-decoration">使用例：man ls</center>

##### 2. 内置命令和外部命令

- Linux中命令分为内置命令（cd、exit等)，外部命令（ls）。直接使用man查询内置命令会显示Bash（内置命令内嵌在Bash中），查询内置命令时可以使用 ```  man -f [命令] ``` 

- 便捷查询：
    - 内置命令: ``` help [命令] ```(help只能查询内置命令)
    - 外置命令: ``` [命令] --help```

##### 3. 常用快捷键

<table>
<tr>
<th>快捷键</th>     <th>功能</th>
</tr>

<tr>
<td>ctrl+c</td>     <td>停止进程</td>
</tr>

<tr>
<td>ctrl+l</td>     <td>清屏，等同于clear</td>
</tr>

<tr>
<td>↑，↓</td>     <td>查询执行过的命令</td>
</tr>

<tr>
<td>tab</td>     <td>补全命令或文件名</td>
</tr>
</table>

#### 2.2 常用基本命令——文件目录类

**1. pwd: 显示当前工作目录的绝对路径**
``` bash
[hiyoung@VM-4-10-centos ~]$ pwd
/home/hiyoung
```

**2. cd: 切换路径**
``` bash
#使用绝对路径切换
[hiyoung@VM-4-10-centos network-scripts]$ cd /home/hiyoung/
[hiyoung@VM-4-10-centos ~]$ pwd
/home/hiyoung
#使用相对路径切换
[root@VM-4-10-centos home] cd hiyoung/
[root@VM-4-10-centos hiyoung] cd ../www/
[root@VM-4-10-centos www] pwd
/home/www
#cd -: 切换到上一次浏览的目录
[root@VM-4-10-centos www] cd -
/home/hiyoung
```

