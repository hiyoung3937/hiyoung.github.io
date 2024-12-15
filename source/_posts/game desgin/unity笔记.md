---
title: unity笔记
tags: [unity,笔记,游戏引擎]
categories: [游戏制作]
date: 2024-03-02 19:14:02
mathjax:
cover:
---

### 基础操作记录
[跟学视频](https://www.bilibili.com/video/BV1gQ4y1e7SS)
[脚本文件](https://blog.hiyoung.xyz/2024/03/13/d11c2f40712b/)
<!--more-->

### 第一天学习P6-P10 创建物体、坐标系
1. 创建3D物体
   在层级下鼠标右击选择 3D object中选择各种形状

2. 坐标系
分为世界坐标系和物体坐标系
选中物体后在属性中transform.position的数值是相对于世界坐标系计算的
将一个物体变为另一个物体的子类后单独移动，position还是相对世界坐标系的，但在移动父类时它和父类的相对位置不会改变(上手实践一下)


3. 对物体的基本操作

![unity笔记-1](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/unity笔记-1.36nq5cnboce0.webp)

依次为:
- 移动视角(可以按住鼠标中键),快捷键-Q
- 移动物体,快捷键-W
- 旋转物体,快捷键-E
- 放缩物体,快捷键-R
- 矩形工具,快捷键-T
- 综合变换,快捷键-Y

4. 导入模型和修改材质
模型资源导入在assets中，还可以修改材质(materials)，选择外部材质即可。project中选中物体->Inspector->Materials

也可以自己设置新材质，project右击->Create->Material

5. 资源商定
导航栏中Windows选中asset store，在商店中购买需要的素材。在package manager中下载和导入素材

### 第二天学习P11-P16 地编、脚本

1. 地形编辑

在3D object中新建一个Terrain。在属性中可以修改地形地貌，创建山川等。还可以添加贴图和森林

2. 添加C#脚本

[Unity中事件函数的执行顺序](https://docs.unity3d.com/cn/2022.3/Manual/ExecutionOrder.html)

脚本要发挥作用需要添加到相应物体上才能实现

关于脚本的执行顺序：
   可以使用 Script Execution Order 设置（菜单：Edit > Project Settings，然后选择 Script Execution Order 类别）
   或者在脚本的inspector中点击 Execution Order添加脚本如何修改优先级


### 第三天学习P17-P23 标记、图层、预制体、向量、四元数
1. 标记（Tag）和图层（Layer）

给物体添加一个标记（tag），用来标记物体便于查找
可以使用图层可以标记一类物体，一般用于碰撞检测、摄像机捕捉和显示

2. 预制体（prefab）和预制体变体（prefab variant）

将物体从图层Hierarchy移至项目project即可生成一个预制体

一个预制体就是一个模板，可以批量生成和修改类似的物体。而预制体变体类似于继承某一预制体并加上自己的需求（例如：某一预制体是不带帽子的个体而不同的预制体变体可以带帽子、带项链等），并且通过原始预制体可以统一修改预制体变体

3. 向量、欧拉角、四元数和Vector3的一些使用
```C#
    void Start()
    {
        //旋转，欧拉角、四元数
        Vector3 rotate = new Vector3(0, 30, 0);
        //定义一个四元数
        Quaternion quaternion = Quaternion.identity;
        //四元数转换为欧拉角
        rotate = quaternion.eulerAngles;
        //欧拉角转换为四元数
        quaternion = Quaternion.Euler(rotate);
        
        //物体指向某个角度
        quaternion = Quaternion.LookRotation(new Vector3(90, 0, 0));

    }
```

### 第四天P24 GameObject类
使用脚本动态控制物体的属性，GameObject类的使用，和一些API的使用

```C#
public class EmptyTest : MonoBehaviour
{

    public GameObject emptyCube;
    //获取预设体，程序化生成物体
    public GameObject prefab;
    
    
    // Start is called before the first frame update
    void Start()
    {
        //拿到当前脚本所挂载的物体
        GameObject go = this.gameObject;
        //名称
        Debug.Log(go.name);
        // = Debug.Log(gameObject.name);
        //tag
        Debug.Log(gameObject.tag);
        //layer
        Debug.Log(gameObject.layer);
        //Empty_Cube的名称
        Debug.Log(emptyCube.name);
        //物体本身是否处于激活状态
        Debug.Log(emptyCube.activeSelf);
        //物体在图层中是否实际处于激活状态
        Debug.Log(emptyCube.activeInHierarchy);
        
        //获取transform组件
        // transform tans = this.transform; ==
        Debug.Log(transform.position);
        //获取其他组件
        BoxCollider bc = GetComponent<BoxCollider>();
        //获取当前物体的子物体身上的某个组件
        GetComponentInChildren<CapsuleCollider>(true);
        GetComponentsInChildren<CapsuleCollider>(bc);
        //获取当前物体父物体身上的某个组件
        GetComponentInParent<BoxCollider>();
        //添加组件
        emptyCube.AddComponent<AudioSource>();
        
        //通过游戏物体的名称来获取游戏物体，若物体同名则返回所有同名物体
        GameObject enemy = GameObject.Find("enemy");
        //通过标签来获取游戏物体，多个相同标签则返回最后一个创建的物体
        GameObject enemy1 = GameObject.FindWithTag("enemy");
        Debug.Log(enemy.transform.position);
        
        //通过预设体来实例化一个游戏物体
        for (int i = 0; i < 10; i++)
        {
            Instantiate(prefab,Vector3.zero, Quaternion.identity);
        }
        
    }
}
```

### 第五天P25-P29 一些类的使用
主要是Time类、Application类、场景类、异步加载场景、transform类相关的一些方法使用
笔记内容见脚本文件

### 第六天P30-P31 鼠标键盘操作
键盘、鼠标操作和虚拟轴的使用
笔记内容见脚本文件

### 第七天P32-P33 灯光、摄像机
灯光、摄像机的使用

#### 灯光
按照类型主要分为：定向光、聚光、点光源和区域光（仅烘培）

其中定向光类似于太阳光仅代表光线方向与光影物体位置无关

区域光（仅烘培）：由于实时光照性能消耗较大，在一个光源固定的场景中可以预先烘培光照来减轻负担。

要使用烘培我们首先需要设定对象为Contribute GI，选中对象，勾选Static下的Contribute GI（组成GI）。然后在Windows->Rendering->Lighting(快捷键Crtl+9)中点击Generate Lighting渲染

Lightmap适用于静态光照贴图对象，所有标记为Contribute GI的物体都会被被渲染到Lightmap（光照贴图）中

除了类型外，还可以选择光照的渲染方式（Mode）、强度（Intensity）、阴影类型（Shadow Type）、剪影（Cookie）

在光照下选择剔除遮罩（Culling Mask）可以选择是否渲染不同图层

#### 摄像机
摄像机可以选择透视摄像机或者正交摄像机。其中透视摄像机在3D游戏中使用，有近大远小的特点。正交摄像机在2D游戏中使用，所有物体都被放在一个平面上。

在摄像机Clear Flags中可以选择在空区域中显示什么，例如天空盒（SkyBox）、纯色（Soiled color）、仅深度（Depth Only）或者不显示（Don`t clear）
若选择了天空盒则可以在摄像机中添加Skybox组件来更换不同天空。

深度（Depth）属性：若有多个摄像机会根据深度属性数值大小来决定哪个摄像机会优先显示在游戏界面。深度数值越大的会优先显示。

若有多个摄像机时选择仅深度可以实现在游戏（Game）视窗同时显示多个摄像机捕捉的物体

视野（Filed of View）可以调节摄像机视野

裁切平面（Clipping Planes）可以调节摄像机的远面和近面

Viewpoint Rect可以调整摄像机在游戏（Game）视窗的位置和高度宽度

目标显示（Target Display）可以修改摄像机的显示目标，在游戏（Game）视窗可以切换Display

在Project中可以新建一个目标纹理（Render Texture）（需挂载在一个物体上），然后将目标纹理拖到摄像机的Target Texture上即可实现将摄像机捕捉的画面映射在物体上

### 第八天P35-P38 声音、视频和角色移动控制
声音、视频和角色移动控制

#### 声音
在物体上添加Audio Source组件后即可播放声音，只需将音频拖到AudioClip上即可，同时可以在Audio Source中调节声音效果
还可以使用脚本来控制声音的播放暂停等操作，具体细节可以看脚本
要听见声音需要一个Audio Listener组件，一般在摄像机上。若有多个摄像机则只能有一个有Audio Listener组件

### 视频
视频和声音的一些操作类似
需要一个Video Player组件，在组件的Video Clip上添加上需要播放的视频。此外，可以将Video Player的渲染模式（Render Mode）改为渲染器纹理（Render Texture），新建一个渲染器纹理将其拖到目标纹理上。再将该目标纹理拖到物体上即可。使用这种渲染器纹理方式可以统一改变所有使用该渲染器纹理的视频，在需要重复使用在多个物体上的视频来说很便捷。

还可以通过脚本来控制视频的播放暂停。（见脚本文件）

### 角色控制器
见脚本文件

### 第九天P39-P40
#### 碰撞
Tips：选中摄像机，Ctrl+Shift+F可以对齐视图，快速调节视角

产生碰撞的条件：
- 2个游戏对象都有Collider
- 至少有一个游戏对象有Rigidbody
- 2个游戏对象保持相对运动（一个Cube放在Plane上，不会产生碰撞，因为没有相对运动）

#### 触发
要将物体改为触发器，只需在Box Collider中将is trigger勾选上，然后使用脚本完成触发逻辑（见脚本文件）


### 第十天P41-47
#### 铰链、弹簧和物理关节
为物体添加铰链组件：**Hinge Joint**

弹簧组件：需要选中两个物体，添加**Spring Joint**，在Connected Body选中要连接的物体（连接的物体需要有刚体才可添加）

物理关节：添加**Fixed Joint**

#### 物理材质（摩擦力）
在Assets中新建->物理材质（Physic Material），然后在Collider的材质中将物理材质拖入即可
在Physic Material中可以调节材质的动摩擦，静摩擦和弹力数值


#### 射线检测
类似于从摄像机发出一条射线，点击某个位置可以检测出位置等信息

#### 粒子系统
添加Particle System组件，来设置粒子效果

#### 绘制线条和拖尾
添加Line Renderer组件

#### 动画
有老版的Animation组件和新版的Animator组件
使用Animator组件需要给模型挂载一个Animator组件，然后再打开Animator窗口即可使用类似于蓝图的方式来完成动画

### 第十一天P48-P50
按键控制角色移动+角色动画的使用，见脚本文件

动画剪辑

### 第十二天P51-P54

#### 动画曲线
在动画文件中可以找到Curves（曲线），并在animator中添加一个float与**曲线名同名参数**，相当于一个随动画播放而变化的**数值函数**，可以获得一个随动画播放而不断变化的数值。例如，如果做一个挥拳的动画，可以通过这个数值来控制挥拳可能用到的特效、声音等。

#### 动画事件
动画事件（Evevts），**事件是一个函数**，事件名即函数名，可以在挂载在物体的脚本上调用同名函数。通过设置事件在动画中发生的时间点则可以调用事件函数中的代码，实现需要的效果。

#### 混合动画
在animator界面中可以右键->Create State->From Blend Tree，添加一个混合动画，在Blend Tree中可以添加多个动作，修改动画的比例来混合动画。

#### 动画遮罩
在Assets->Create->Avatar Mask，新建一个动画遮罩，在遮罩里选择Humanoid，可以选择只使用那一身体部分的动画，然后在Animator的动画层级中选择添加Mask即可

### 第十三天P55-

#### IK(反向动力学)

#### 导航的使用
