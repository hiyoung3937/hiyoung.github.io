---
title: c++ string
tags: [string,字符串]
categories: [学习笔记,cpp]
cover: false
date: 2025-01-16 14:56:45
mathjax: 
---

## 字符串和字符数组
### [cin.getline()与getline()的区别](https://www.geeksforgeeks.org/getline-string-c/)


![Cpp的STL-string-1](https://cdn.jsdelivr.net/gh/hiyoung3937/img_hiyoung@master/bolg/Cpp的STL-string-1.2hq4mvbfb6q0.webp)

cin.getline要使用字符数组做参数，getline要使用字符串做参数

- cin.getline(字符数组,读取的长度);
- getline(cin,字符串名)


``` cpp
    char name[20];
    string s;
	cin.getline(name,20); //OK 
    getline(cin,name);    //ERROR

    cin.getline(s,20);    //ERROR
    getline(cin,s);       //OK

```

## string 与 stringstream
参考资料：
- [string和stringstream用法](https://www.cnblogs.com/lijingblog/p/11113616.html)
- [C++ string类的用法整理](https://www.cnblogs.com/BobPong/p/15868025.html)
### string基本用法
#### 赋值
可以用 char* 类型的变量、常量，以及 char 类型的变量、常量对 string 对象进行赋值

```cpp
string s1;
s1 = "hello";
s2 = 'K';
```

#### 拼接
我们一般常用+和+=运算符对 string 对象执行字符串的连接操作。除此之外，也可以使用 append 成员函数进行拼接

```cpp
string s1("123"), s2("abc");
s1 = s1 + "ABC"     //s1 = "123ABC"
s1 += s2;           //s1 = "123abc"
s1.append(s2);      // s1 = "123abc"
s1.append(s2, 1, 2); // s1 = "123bc"，从s2下标1开始，长度为2拼接到s1
s1.append(3, 'K');  // s1 = "123bcKKK"
s1.append("ABCDE", 2, 3); // s1 = "123CDE"，添加 "ABCDE" 的子串[2,5)
s1.push_back('A');      //s1 = "123A" 添加一个字符 'A' ，参数必须是字符形式
```

#### 比较
字符串的比较默认是按照字典序来比较的，并且遵从两个规则：1. 逐个比较 2. 不同即停
string 类还有 compare 成员函数，也可用于比较字符串
常用的比较符：<、<=、==、!=、>=、> 

ompare 成员函数有以下返回值：
- 小于 0 表示**当前的**字符串小；
- 等于 0 表示两个字符串相等；
- 大于 0 表示**当前的**字符串大。

```cpp
string s1("hello"), s2("hello, world");
int n = s1.compare(s2);
n = s1.compare(1, 2, s2, 0, 3); //比较s1的子串 (1,2) 和s2的子串 (0,3)
n = s1.compare(0, 2, s2); // 比较s1的子串 (0,2) 和 s2
n = s1.compare("Hello");
n = s1.compare(1, 2, "Hello"); //比较 s1 的子串(1,2)和"Hello”
n = s1.compare(1, 2, "Hello", 1, 2); //比较 s1 的子串(1,2)和 "Hello" 的子串(1,2)
```


### string常用的成员函数

#### find()函数

**使用方法：** ```s.find(sub)```，有返回值：无符号整数

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
  如果找到了子串，则find函数的返回值是这个字串在字符串中第一次出现的位置。如果没有找到，那么会返回一个特别的标记string::npos

#### size() 函数
length 成员函数返回字符串的长度。size 成员函数可以实现同样的功能。
一般用size()多一些
```cpp
string s1 = "12345";
int len = s1.size(); // 5
int len = s1.length(); // 5
```

#### substr() 函数
substr 成员函数可以用于求子串 (n, m)，调用时，如果省略 m 或 m 超过了字符串的长度，则求出来的子串就是从下标 n 开始一直到字符串结束的部分。例如：

```cpp
string s1 = "hiyoung blog";
string s2 = s1.substr(2, 4); // s2 = "youn"
s2 = s1.substr(2); // s2 = "young blog"
```

#### replace() 函数
replace 成员函数可以对 string 对象中的子串进行替换，返回值为对象自身的引用。例如：

```cpp
string s1("Real Steel");
// 基础用法
s1.replace(1, 3, "123456"); //用 "123456" 替换 s1 的子串(1,3)
cout << s1 << endl; //输出 R123456 Steel

// 用法二
string s1("Real Steel");
s1.replace(1, 3, "123456", 2, 4); //用 "123456" 的子串(2,4) 替换 s1 的子串(1,3)

// 用法三
string s2("Harry Potter");
s2.replace(2, 3, 5, '0'); //用 5 个 '0' 替换子串(2,3)
cout << s2 << endl; //输出 HaOOOOO Potter

// 用法四
int n = s2.find("OOOOO"); //查找子串 "00000" 的位置，n=2
s2.replace(n, 5, "XXX"); //将子串(n,5)替换为"XXX"
cout << s2 < < endl; //输出 HaXXX Potter
```

#### erase() 函数
erase 成员函数可以删除 string 对象中的子串，返回值为对象自身的引用

s.erase(起始位置,长度);
```cpp
string s1("Real Steel");
s1.erase(1, 3); //删除子串(1, 3)，此后 s1 = "R Steel"
s1.erase(5); //删除下标5及其后面的所有字符，此后 s1 = "R Ste"
```

#### insert() 函数
insert 成员函数可以在 string 对象中插入另一个字符串，返回值为对象自身的引用

```cpp
string s1("Limitless"), s2("00");
s1.insert(2, "123"); //在下标 2 处插入字符串"123"，s1 = "Li123mitless"
s1.insert(3, s2); //在下标 2 处插入 s2 , s1 = "Lim00itless"
```