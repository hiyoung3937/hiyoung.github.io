---
title: C++ STL&语法辨析
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