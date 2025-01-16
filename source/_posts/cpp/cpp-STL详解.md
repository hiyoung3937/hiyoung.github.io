---
title: C++のSTL
tags: [cpp,STL]
categories: [学习笔记,cpp]
cover: false
date: 2024-10-28 15:45:19
mathjax:
---
## set容器
https://www.cnblogs.com/linuxAndMcu/p/10261014.html#_label2


## 字符串和字符数组
### [cin.getline()与getline()的区别](https://www.geeksforgeeks.org/getline-string-c/)
cin.getline要使用字符数组做参数，getline要使用字符串做参数

```cin.getline(字符数组,读取的长度);```

```getline(cin,字符串名)```

``` cpp
    char name[20];
    string s;
	cin.getline(name,20); //OK 
    getline(cin,name);    //ERROR

    cin.getline(s,20);    //ERROR
    getline(cin,s);       //OK

```

## sort排序
sort主要是使用了快排并融合了堆排序等方法
### 基本用法（一维数组）
1. 默认对传入的数据进行从小到大排序

``` cpp
vector<int> a;
sort(a.begin(),a.end());
```
2. 可以使用cmp函数改变排序规则
   使用cmp函数改为从大到小排序
``` cpp
bool cmp(const int &x,const int &y){
    return x > y;
}
```
### 二维数组排序
sort()函数，默认的是对二维数组按照第一列的大小对每行的数组进行排序。
所以可以加上cmp函数用按照任意列对数组进行排序。

下列代码是对数组的第二列按照从大到小排序(第一列应该是a[0] > b[0])
``` cpp
bool cmp(vector<int> &a,vector<int> &b){
    return a[1] > b[1];
}
```

## string 与 stringstream
参考资料：[string和stringstream用法](https://www.cnblogs.com/lijingblog/p/11113616.html)

### string常用的成员函数
![Cpp的STL-string-1](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/Cpp的STL-string-1.2hq4mvbfb6q0.webp)


#### find()函数

**使用方法：**s.find(sub)，有返回值

**示例代码：**
``` cpp
//find函数返回类型size_type
string s = "1a2b3c4d5e6f7g8h9i1a2b3c4d5e6f7g8ha9i";
string sub;
string::size_type pos;

pos = s.find(sub);

if(s.find(sub) != string::npos){
    ...
}
```

- Q1: find函数的返回类型
  string::size_type 是一个与**实现相关**的无符号整数类型，通常与 size_t 相同，用来表示字符串的长度和下标等
  它定义为与unsigned型（unsigned int获unsigned long）具有相同含义
  与实现相关的意思是它在不同的机器上，长度是可以不同的，并非固定的长度，只要你使用了这个类型，就使得你的程序适合这个机器

- Q2: != string::npos
  npos表示size_type的最大值，用来表示不存在的位置

- Q3: find函数的返回值
  如果找到了子串，则find函数的返回值是这个字串在字符串中第一次出现的位置

