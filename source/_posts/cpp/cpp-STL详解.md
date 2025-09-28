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


## 优先队列 priority_queue
优先队列默认为大梗堆实现，内部维护大根堆时间复杂度为$log_2 n$
包含头文件 ```#include<queue>```
优先队列具有队列的所有特性，包括队列的基本操作，只是在这基础上添加了内部的一个排序，它本质是一个堆实现的
### 基本语法
```cpp
// priority_queue<int,vector<int>,less<int> >;  // 小于号表示降序
priority_queue<int> pq;

pq.top() 访问队头元素
pq.empty() 队列是否为空
pq.size() 返回队列内元素个数
pq.push(x) 插入元素x到队尾 (并排序)
pq.pop() 弹出队头元素

```

#### 小根堆
``` cpp
//注意最后两个 > 之间有一个空格（输入运算符：>>）
priority_queue<Type,vector<Type>,greater<Type> >; //大于号表示升序

```

- 其中 vector<int>（也就是第二个参数）填写的是来承载底层数据结构堆（heap）的容器，如果第一个参数是 double 型或 char 型，则此处只需要填写 vector<double> 或 vector<char>；

- 而第三个参数 less<int> 则是对第一个参数的比较类，less<int> 表示数字大的优先级越大，而 greater<int> 表示数字小的优先级越大。
- 传入的第三个参数是仿函数，是将新插入数据与父结点进行比较，当父结点小于子结点的时候，才会在堆中进行交换，所以less<int>表示大根堆，greater<int>表示大根堆

### 重载运算符
#### 格式
1. 运算符重载的必要语法
运算符重载有明确的语法规则，以下是关键点：

2. 使用 operator 关键词
在 C++ 中运算符重载始终使用关键词 operator 开头。以下是加法运算符重载的声明：

```cpp
ReturnType operator+(ParameterList);
```
3. 限定只能为已有运算符重载
C++ 允许重载大多数运算符，但有少数运算符不能重载：

- 不能重载 .（成员访问运算符）
- 不能重载 ::（域运算符）
- 不能重载 sizeof（类型大小运算符）
- 不能重载 ?:（三元运算符）
原因：这些是语言层级的运算符，过于底层。

4. **参数传递规则**
当操作符为二元操作符（如 +, -, *, /）时，通常需要两个参数：
- 左操作数（**隐式传递，即调用者本身** this）
- 右操作数（**显式传递的参数**）
当操作符为一元操作符（如 ++, --）时，只需要一个参数（调用者本身）。

作为类成员函数重载的格式：
```cpp
ReturnType operatorOp(const Type& operand);  // 二元操作符
ReturnType operatorOp();                     // 一元操作符
```

5. 返回类型
运算符重载函数的返回类型取决于实际需求：

- 对于二元算术运算符（如 + ），返回一个新的对象。
- 对于赋值运算符（如 =），返回 *this（即对调用对象的引用）。

#### 重载运算符的写法
1. 比较运算符 (<)

比较运算符需要返回布尔值，常用于排序和 STL 容器（如 std::sort 或 std::priority_queue）。

``` cpp
#include <iostream>
#include <queue>
#include <vector>
using namespace std;

struct node {
    string name;
    int age;

    // 重载小于运算符
    // this可省略
    bool operator<(const node& other) const {
        return this->age < other.age;  // 按年龄降序排序
    }
};

int main() {
    priority_queue<node> pq;

    pq.push({"Alice", 30});
    pq.push({"Bob", 20});
    pq.push({"Charlie", 25});

    while (!pq.empty()) {
        cout << pq.top().name << " (" << pq.top().age << ")" << endl;
        pq.pop();
    }

    return 0;
}
```

- 为什么需要这样写？

返回值是 bool，符合比较运算的预期。
标记函数为 const，因为它不改变操作数的值，符合比较逻辑的无副作用原则。
优先队列使用 operator< 作为比较基础，自定义行为可以实现不同的比较策略。

- 升序和降序
```return this->age < other.age;  // 按年龄降序排序```
返回规则在于，左操作数为调用者本身，this对象，右操作数为比较的对象。**this可省略**
**$ < $** 表示按照降序排列，**$ > $**表示按照升序排列

