---
title: VsCode配置Java环境
date: 2022-09-07 15:14:32
tags: [Java,配置环境]
categories: [编程环境配置,Java]
---

## 安装Java
安装最新版(最新版VsCode安装jdk1.8会弹窗警告，所以不如使用最新版)
下载地址：[Java](https://www.oracle.com/java/technologies/downloads/#jdk18-windows)
<!-- more -->
>Tips: 如果你需要运行java程序，只需安装JRE就可以了。如果你需要编写java程序，需要安装JDK。
>有关两者关系也可以查看[官方文档](https://docs.oracle.com/javase/8/docs/)

选择对应系统的版本即可：
- Compressed Archive版本是单独的JDK包

- Installer版本是Java安装包，包含了Java运行程序，**第一次配置Java环境**最好下载这个

![VsCode配置Java环境_1](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/VsCode配置Java环境_1.5qa2mqoltac0.jpg)

## 配置Java环境变量
### 1. 打开系统环境变量

- 方法1：选中我的电脑 --> 键盘按下 Alt + Enter --> 高级系统设置 --> 环境变量
- 方法2：键盘按下 win + r --> 输入 sysdm.cpl --> 高级 --> 环境变量
- 方法3：win10系统下，工具栏有搜索图标，点击后直接搜索"环境变量"

### 2. 设置环境变量

在 "系统变量" 中设置 3 项属性，JAVA_HOME、PATH、CLASSPATH(大小写无所谓),若已存在则点击"编辑"，不存在则点击"新建"。

变量设置参数如下：
``` 
变量名：JAVA_HOME
变量值：C:\Program Files (x86)\Java\jdk1.8.0_91        // 要根据自己的实际路径配置
变量名：CLASSPATH
变量值：.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;         //记得前面有个"."
变量名：Path
变量值：%JAVA_HOME%\bin;        //如果安装了jre需要添加个%JAVA_HOME%\jre\bin; 
```

### 3. 测试是否配置成功

    1. "Win+R"，键入"cmd"；

    2. 键入命令: java -version、java、javac 几个命令，出现以下信息，说明环境变量配置成功

![VsCode配置Java环境_2](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/VsCode配置Java环境_2.293km1aifvms.jpg)

## Vscode配置

1. 下载对应Java插件
这里使用Extension Pack for Java 里面包含6个可能会用的到插件(Java11以下版本的jdk会弹出警告)

![VsCode配置Java环境_3](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/VsCode配置Java环境_3.77spuvqtj1w0.jpg)

2. 设置java路径
打开vscode设置（Ctrl + ，） -->  搜索设置输入 javahome -->  点击 Java: Home下的在settings.json中编辑，如下：
其中，第一行是JAVA_HOME的路径，记得把 " \ " 改成 " \ \ "

![VsCode配置Java环境_4](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/VsCode配置Java环境_4.3dmm1dj8fnq0.jpg)

## 调试运行

新建```hello.java```，输入代码，测试运行即可

``` java
// Hello.java
public class Hello {
    public static void main(String[] args) {
        System.out.print("I am Hello Class, which is a main class");
    }
}
```


----------------

参考文章：
[Visual Studio Code (vscode) 配置 Java 环境 ](https://www.cnblogs.com/bpf-1024/p/13375253.html)

[Java 开发环境配置](https://www.runoob.com/java/java-environment-setup.html)
