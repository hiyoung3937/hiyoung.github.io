---
title: Godot基本操作
tags: [godot,game engine]
categories: [游戏制作]
date: 2023-12-26 14:25:02
mathjax:
cover:
---


### 配置外部编辑器

使用idea发现不能idea中的tab在godot脚本中会变成空格导致错误，还有不能同步的奇怪问题，所以还是决定使用vscode做外部编辑器。

1. 在下载vscode中下载godot的插件(适用于GDScript的那一个)
2. 配置好lunch.json文件
   1. 参考网站[外部编辑器设置](https://docs.godotengine.org/en/stable/tutorials/editor/external_editor.html)
   2. 修改json代码
    ``` json
        "configurations": [
        {
            "name": "Godot Debug",
            "type": "godot",
            "request": "launch",
            "project": "${workspaceFolder}",
            "port": 6007,
            "debugServer": 6005, //godot4.x修改了默认的端口，这里也要修改插件中对应的端口号(Gdscript_lsp_server_port也改为6005)
            "address": "127.0.0.1",
            "launch_game_instance": true,
            "launch_scene": false
        }
    ]
    ```

### 基础操作

#### 节点的基础操作

- Q，选择工具，最强大的工具

```
Alt + 拖曳边框缩放点，保持选中目标中心位置不变进行缩放
Shift + 等比列缩放
Ctrl + 鼠标拖曳，以pivot为中心旋转当前对象
Alt + Shift + 拖曳边框缩放点，保持选中目标中心位置不变进行等比例缩放
```

- E，旋转工具，改变 Rotation

```
轴心点，又称中心点，是节点的旋转中心

V，移动轴心点，Shift + V 拖拽轴心点

中心点是一个物体的中心，当我们对物体进行操作的时候，都是以中心点为中心进行对物体的操作
轴心点可以理解为把物体抽象成一个点，物体的位置就是指其轴心点的位置，就是该物体坐标系的原点

Rotate Mode 对象的旋转
沿轴心点旋转
```

- F，定位到选中对象

