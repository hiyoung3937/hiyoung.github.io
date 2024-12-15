---
title: unity脚本
tags: [unity,笔记,游戏脚本]
categories: [游戏制作]
date: 2024-03-01 20:11:44
mathjax:
cover:
---
### 脚本文件
<!--more-->
### Vector3
```C#
    void Start()
    {
        //向量，坐标，旋转，缩放
        Vector3 v = new Vector3(0, 1,0 );
        Vector3 v1 = Vector3.right;
        
        //计算两个向量夹角
        Debug.Log(Vector3.Angle(v,v1));
        //计算两点间距离
        Debug.Log(Vector3.Distance(v,v1));
        //点乘
        Debug.Log(Vector3.Dot(v,v1));
        //叉乘
        Debug.Log(Vector3.Cross(v,v1));
        //插值
        Debug.Log(Vector3.Lerp(Vector3.left,Vector3.right,0.5f));
        //向量的模
        Debug.Log(v.magnitude);
        //规范化向量
        Debug.Log(v.normalized);
    }

```

### Time类
```C#
public class Timetest : MonoBehaviour
{
    private float _timer = 0;
    //Time时间类
    // Start is called before the first frame update
    void Start()
    {
        //游戏开始到现在所花的时间
        Debug.Log(Time.time);
        //时间缩放值，加速减速
        Debug.Log(Time.timeScale);
        //固定时间间隔
        Debug.Log(Time.fixedDeltaTime);
    }

    // Update is called once per frame
    void Update()
    {
        //Time.deltaTime : 上一帧到这这一帧所用的游戏时间
        //这里类似于计时器的作用 
        _timer += Time.deltaTime;
        
        // Debug.Log(Time.deltaTime);
        if (_timer > 3)     
        {
            Debug.Log("时间大于3");
            _timer = 0;
        }
    }
}

```

### Application类
```C#
void Start()
    {
        //游戏数据文件夹路径（只读，打包后会加密压缩）
        Debug.Log(UnityEngine.Application.dataPath);
        //持久化文件夹路径（可以放存档）
        Debug.Log(UnityEngine.Application.persistentDataPath);
        //StreamingAssets文件夹路径（只读，但打包后不会加密压缩，可以放一些配置文件等）
        Debug.Log(UnityEngine.Application.streamingAssetsPath);
        //临时文件夹
        Debug.Log((UnityEngine.Application.temporaryCachePath));
        //控制是否在后台运行
        Debug.Log(UnityEngine.Application.runInBackground);
        //打开URL
        // UnityEngine.Application.OpenURL("https://www.bilibili.com/");
        //退出游戏
        UnityEngine.Application.Quit();
    }
```

### 场景类

```C#
    void Start()
    {
        //场景类、场景管理类
        //场景跳转
        // SceneManager.LoadScene("MyScene");
        
        //获取当前场景
        Scene scene = SceneManager.GetActiveScene();
        Debug.Log(scene.name);
        // Debug.Log(SceneManager.GetActiveScene().name);
        //场景是否已经加载
        Debug.Log(scene.isLoaded);
        //场景路径
        Debug.Log(scene.path);
        //场景索引
        Debug.Log(scene.buildIndex);
        //获取场景中所有物体
        Debug.Log(scene.GetRootGameObjects().Length);
        
        //场景管理类
        //创建新场景
        Scene newScene =  SceneManager.CreateScene("NewScene");
        //已加载的场景个数
        Debug.Log(SceneManager.sceneCount);
        //卸载一个场景
        SceneManager.UnloadSceneAsync(newScene);
        //加载场景（Signal和Additive方式）
        SceneManager.LoadScene("MyScene",LoadSceneMode.Additive);
    }

```

### 异步加载场景

```C#
public class Async : MonoBehaviour
{
    private AsyncOperation _operation;

    private float timer = 0;
    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(LoadScene());
    }
    
    //用协程方法来异步加载场景
    IEnumerator LoadScene()
    {
        _operation = SceneManager.LoadSceneAsync("MyScene");
        //加载完场景不要自动跳转
        _operation.allowSceneActivation = false;
        yield return _operation;
    }
    
    // Update is called once per frame
    void Update()
    {
        //输出加载进度0-0.9
        Debug.Log(_operation.progress);
        timer += Time.deltaTime;
        if (timer > 5)
        {
            _operation.allowSceneActivation = true;
        }
    }
}
```

### transform类

```C#
public class transform : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        //获取位置
        //position为物体所在的世界位置
        Debug.Log(transform.position);
        //localPosition为物体所在的相对父物体的位置（如何有的话）
        Debug.Log(transform.localPosition);
        
        //获取旋转
        Debug.Log("旋转："+transform.rotation);
        Debug.Log(transform.localPosition);
        Debug.Log("欧拉角：" + transform.eulerAngles);
        Debug.Log("相对父物体的欧拉角："+transform.localPosition);
        
        //获取缩放
        Debug.Log("获取缩放:"+transform.localScale);
        //向量
        Debug.Log(transform.forward);
        Debug.Log(transform.right);
        Debug.Log(transform.up);
        
        //父子关系
        //获取父物体
        GameObject go =  transform.parent.gameObject;
        //子物体个数
        Debug.Log(transform.childCount);
        //解除与子物体的父子关系
        transform.DetachChildren();
        //获取子物体的两种方法
        Transform trans = transform.Find("Child");
        Transform trans1 = transform.GetChild(0);
        //判断一个物体是否是另一个物体的子物体
        bool res = trans.IsChildOf(transform);
        Debug.Log(res);
        //设置为父物体
        trans.SetParent(transform);
    }
    

    // Update is called once per frame
    void Update()
    {
        //固定看向某一点
        transform.LookAt(Vector3.zero);
        //旋转
        transform.Rotate(Vector3.right, 1);
        //绕某个物体旋转
        transform.RotateAround(Vector3.zero, Vector3.up, 1);
        //移动
        transform.Translate(Vector3.forward * 0.1f);
    }
}

```

### 鼠标、键盘操作

```C#
    void Update()
    {
        //鼠标的点击
        //按下鼠标 0左键 1右键 2按下滚轮
        if (Input.GetMouseButtonDown(0))
        {
            Debug.Log("鼠标左键点击");
        }

        if (Input.GetMouseButton(0))
        {
            Debug.Log("持续按下鼠标左键");
        }

        if (Input.GetMouseButtonUp(0))
        {
            Debug.Log("抬起鼠标左键");
        }
        
        //按下键盘按键
        if (Input.GetKeyDown("w"))
        {
            Debug.Log("按下w");
        }
        
        if (Input.GetKey(KeyCode.W))
        {
            Debug.Log("持续按w");
        }
        
        if (Input.GetKeyUp(KeyCode.W))
        {
            Debug.Log("松开w");
        }
    }
```

### 触摸操作
```C#
    void Start()
    {
        //开启多点触摸
        Input.multiTouchEnabled = true;
    }

    // Update is called once per frame
    void Update()
    {
        //判断单点触摸
        if (Input.touchCount == 1)
        {
            //触摸对象
            UnityEngine.Touch touch = Input.touches[0];
            //触摸位置
            Debug.Log(touch.position);
            //触摸阶段
            switch (touch.phase)
            {
                case TouchPhase.Began:
                    break;
                case TouchPhase.Moved:
                    break;
                case TouchPhase.Stationary:
                    break;
                case TouchPhase.Ended:
                    break;
                case TouchPhase.Canceled:
                    break;
            }
        }
        
        //判断多点触摸
        if (Input.touchCount == 2)
        {
            UnityEngine.Touch touch1 = Input.touches[0];
            UnityEngine.Touch touch2 = Input.touches[0];
        }
    }
```

### 虚拟轴
```C#
void Update()
    {
        /*
        //获取水平轴
        float horizontal = Input.GetAxis("Horizontal");
        float vertical = Input.GetAxis("Vertical");
        Debug.Log(horizontal + "------"+ vertical);
        */
        
        //虚拟按键
        if (Input.GetButtonDown("Jump"))
        {
            Debug.Log("space down");
        }
        
        if (Input.GetButtonUp("Jump"))
        {
            Debug.Log("space up");
        }
    }
```

### 声音
```C#
public class Audio : MonoBehaviour
{
    //AudioClip
    public AudioClip music;

    public AudioClip se;
    
    //播放器组件
    private AudioSource _player;
    
    // Start is called before the first frame update
    void Start()
    {
        _player = GetComponent<AudioSource>();
        
        //设定播放的音频
        _player.clip = music;
        //循环
        _player.loop = true;
        //音量
        _player.volume = 0.5f;
        //播放
        _player.Play();
        
        
    }

    // Update is called once per frame
    void Update()
    {
        //按空格控制播放
        if (Input.GetKeyDown(KeyCode.Space))
        {
            if (_player.isPlaying)
            {
                //暂停播放
                _player.Pause();
                //停止播放（下次从头开始播放）
                // _player.Stop();
            }
            else
            {
                //重新播放
                _player.UnPause();
                //与Stop一起使用
                // _player.Play();
            }
        }

        if (Input.GetMouseButtonDown(0))
        {
            //播放一次音效
            _player.PlayOneShot(se);
        }
    }
}
```

### 视频
```C#
public class Video : MonoBehaviour
{
    private VideoPlayer _player;
    // Start is called before the first frame update
    void Start()
    {
        _player = GetComponent<VideoPlayer>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            if (_player.isPlaying)
            {
                _player.Stop();
            }
            else
            {
                _player.Play();
            }
        }
    }
}

```

### 控制角色移动
```C#
public class PlayerControl : MonoBehaviour
{
    private CharacterController _character;
    // Start is called before the first frame update
    void Start()
    {
        _character = GetComponent<CharacterController>();
    }

    // Update is called once per frame
    void Update()
    {
        //水平轴
        float horizontal = Input.GetAxis("Horizontal");
        //垂直轴
        float vertical = Input.GetAxis("Vertical");
        //创建成一个方向向量
        Vector3 dir = new Vector3(-horizontal, 0, -vertical);
        Debug.DrawRay(transform.position,dir,Color.red);
        //朝向该方向移动
        
        if (Input.GetKey(KeyCode.LeftShift))
        {
            _character.SimpleMove(dir * 30);
        }
        else
        {
            _character.SimpleMove(dir);
        }
    }
}

```

### 触发器
``` C#
    //可以使用三个函数来实现触发进入、持续、退出
    private void OnTriggerEnter(Collider other)
    {
        GameObject door = GameObject.Find("trigger1");
        if (door != null)
        {
            door.SetActive(false);
        }
    }
    
    private void OnTriggerStay(Collider other)
    {
        
    }
    private void OnTriggerExit(Collider other)
    {
        
    }
```

### 控制角色移动并播放动画P48
```C#
public class PlayerControl : MonoBehaviour
{
    private Animator _animator;
    // Start is called before the first frame update
    void Start()
    {
        _animator = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        //水平轴
        float horizontal = Input.GetAxis("Horizontal");
        //垂直轴
        float vertical = Input.GetAxis("Vertical");
        //创建成一个方向向量
        Vector3 dir = new Vector3(horizontal, 0, vertical);
        Debug.DrawRay(transform.position,dir,Color.red);
        

        if (dir != Vector3.zero)
        {
            //朝向该方向移动
            transform.rotation = Quaternion.LookRotation(dir);
            _animator.SetBool("iswalk_bool",true);
            //朝向前方移动
            transform.Translate(Vector3.forward * 1 *Time.deltaTime);
        }
        else
        {
            _animator.SetBool("iswalk_bool",false);
        }
        
        if (Input.GetKey(KeyCode.LeftShift) && dir != Vector3.zero)
        {
            //切换跑步
            _animator.SetBool("isrun",true);
            transform.Translate(Vector3.forward * 3 *Time.deltaTime);
            
        }
        else
        {
            _animator.SetBool("isrun",false);
            
        }
    }
}
```