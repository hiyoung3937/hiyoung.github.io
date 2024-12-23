---
title: VsCode配置C语言环境
tags: [C/C++,配置环境]
categories: [编程环境配置,C/C++]
cover: false
date: 2022-12-15 16:25:39
mathjax:
---

VsCode只是一个纯文本**编辑器**，不是IDE(集成开发环境)，不含**编译器**和许多其它功能，所以编译器要自己装好

第一步：在vscode官网下载软件，链接：[](https://code.visualstudio.com/)[Visual Studio Code – Code Editing. Redefined](https://code.visualstudio.com/)

第二步：我们需要下载一个编译器，C语言使用gcc，链接：[MinGW-w64 – for 32 and 64 bit Windows download | SourceForge.net](https://sourceforge.net/projects/mingw-w64/)，选最新版本中的 x86\_64-posix-seh 即可，网站下载可能较慢，下面给出百度网盘链接

（百度网盘链接：链接: [https://pan.baidu.com/s/17FYT\_Y-s-I2yajFc2MICqw](https://pan.baidu.com/s/17FYT_Y-s-I2yajFc2MICqw) 提取码: ewis ）

第三步：将E:\\mingw64\\bin 添加到系统变量中（盘符根据自己编译器安装的位置）

以Win11为例：打开设置-&gt;系统-&gt;关于-&gt;高级系统设置-&gt;环境变量-&gt;系统变量-&gt;点击Path-&gt;编辑 -&gt; 浏览 -&gt; 把对应文件加入即可

![](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/配置C语言_2.1kpkhe2uoc2o.jpg)

![](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/配置C语言_3.1zghj049j51c.jpg)

第四步：

按Win+R，运行cmd（不要跳这一步），输入gcc，应该会提示 *no input files* 而不是“不是内部命令或外部命令”或者“无法将 “gcc” 项识别为 cmdlet、函数、脚本文件或可运行程序的名称”。如果是“不是内部命令或外部命令”，说明gcc在的文件夹没有在环境变量的Path中，要加进去才行。如果加了还是这样，重启（不要忘记重启）。如果重启了还不行，那就是你自己进行的操作有问题。

输gcc -v可以显示出gcc的版本。如果显示出来的版本与你刚下的**不同/更老**，说明Path里原本有老版本的编译器，可能是安装其它IDE时装上的。则需要去掉Path里原来的那一个gcc的路径。

这两项验证**一定要符合**，否则必须修改环境变量。小心**别错删**了。

![](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/配置C语言_4.2cndmw8ru0kk.jpg)

第五步：现在打开vscode，下载相关插件

![](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/配置C语言_5.14p5s9c8oocg.jpg)

第六步：我们需要写两个json文件，下面依次是launch.json和tasks.json（两个文件名也必须是 launch.json 和 tasks.json ） **<span class="has-inline-color" style="color:#ff0000">注意看代码注释，两个文件都有几处地方需要将路径改为自己编译器的路径</span>**

```json

{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "gcc.exe - 生成和调试活动文件",
            "type": "cppdbg",
            "request": "launch",
            "program": "${fileDirname}\\bin\\${fileBasenameNoExtension}.exe",//这里意思生成的二进制代码会放入当前文件的bin文件夹中，我们需要自己新建一个bin文件夹
            "args": [],
            "stopAtEntry": false,
            "cwd": "${fileDirname}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "miDebuggerPath": "E:\\mingw64\\bin\\gdb.exe",
            "setupCommands": [
                {
                    "description": "为 gdb 启用整齐打印",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ],
            "preLaunchTask": "C/C++: gcc.exe 生成活动文件"
        }
    ]
}

```

```json

{
    "tasks": [
        {
            "type": "cppbuild",
            "label": "C/C++: gcc.exe 生成活动文件",
            "command": "E:\\mingw64\\bin\\gcc.exe",//改成自己的文件路径
            "args": [
                /*"${fileDirname}\\*.c",
                "-o",
                "${fileDirname}\\bin\\${fileBasenameNoExtension}.exe",
                "-g"//多文件编译*/
                "-g",
                "${file}",
                "-o",
                "${fileDirname}\\bin\\${fileBasenameNoExtension}.exe"//这里意思生成的二进制代码会放入当前文件的bin文件夹中，我们需要自己新建一个bin文件夹
            ],
            "options": {
                "cwd": "${fileDirname}"
            },
            "problemMatcher": [
                "$gcc"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": true,
                "reveal": "always", // 执行任务时是否跳转到终端面板，可以为always，silent，never。具体参见VSC的文档
                "focus": true,     // 设为true后可以使执行task时焦点聚集在终端，但对编译C/C++来说，设为true没有意义
                "panel": "shared"   // 不同的文件的编译信息共享一个终端面板
            },
            "detail": "调试器生成的任务。"
        },
        {
            "type": "cppbuild",
            "label": "(多文件)gcc.exe - 生成和调试活动文件",
            "command": "E:\\mingw64\\bin\\gcc.exe",//改成自己的文件路径
            "args": [
                "${fileDirname}\\*.c",
                "-o",
                "${fileDirname}\\bin\\${fileBasenameNoExtension}.exe",//这里意思生成的二进制代码会放入当前文件的bin文件夹中，我们需要自己新建一个bin文件夹
                "-g"
            ],
            "options": {
                "cwd": "${fileDirname}"
            },
            "problemMatcher": [
                "$gcc"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": true,
                "reveal": "always", // 执行任务时是否跳转到终端面板，可以为always，silent，never。具体参见VSC的文档
                "focus": true,     // 设为true后可以使执行task时焦点聚集在终端，但对编译C/C++来说，设为true没有意义
                "panel": "shared"   // 不同的文件的编译信息共享一个终端面板
            },
            "detail": "调试器生成的任务。"
        }
    ],
    "version": "2.0.0"
}

```

至此设置工作基本结束