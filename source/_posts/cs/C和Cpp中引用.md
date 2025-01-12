---
title: C和C++中引用
date: 2023-02-04 01:44:20
tags: [C,C++]
categories: [学习笔记,cpp]
---
## C的指针和C++中引用和函数参数类型
<!-- more -->

如果你说的是函数的形参，那么

```c
void foo(int ptr);

是传值调用，比如你这么调用
int a;
int pValue = &a;
foo(pValue);
//
这样的情况下，pValue的值是不能被函数foo改变的，也就是pValue肯定是指向a的
但是如果你这么声明：
void foo(int& ptr);
则是传递引用，那么如果你函数里面：
void foo(int& ptr)
{
    ptr = NULL;
}
//
这样调用过之后，pValue就变成了NULL。而第一种情况pValue是不能被改变的。
引用是C++带来的很重要一个特性，他在很多情况下避免了使用指针。
而且，在C++里面，引用是不可以捏造的，比如C你可以很容易弄一个NULL的指针，而引用这不存在NULL引用。
上面的foo函数如果要用C来实现，则必须用指针的指针：
//
void foo(int pptr)
{
    ptr = NULL;
}

调用的时候要
foo(&pValue)
//
这种技术很多用在比如定义一个安全删除指针的函数，所谓安全就是，
只有当指针为零的时候才执行删除，删除之后，立刻把指针赋值为NULL。
//

template<typename T>
inline safe_delete(T& ptr)
{
    if (ptr)
    {
        delete ptr;
        ptr = NULL;
    }
}
```

通过下面代码可以更清楚理解两者区别
```cpp
#include <iostream>

int main() {
    int x = 42;
    int* px = &x;  // px是指向x的指针
    int** ppx = &px;  // ppx是指向指针px的指针

    std::cout << "&x: " << &x << std::endl;
    std::cout << "x: " << x << std::endl;
    std::cout << "px: " << px << std::endl;
    std::cout << "*px: " << *px << std::endl;  // 解引用指针px，获取x的值
    std::cout << "**ppx: " << **ppx << std::endl;  // 解引用指向指针px的指针，获取x的值

    int& rx = x;  // rx是x的引用
    int* prx = &rx;  // prx是指向引用rx的指针

    std::cout << "rx: " << rx << std::endl;
    std::cout << "*prx: " << *prx << std::endl;  // 解引用指针prx，获取rx的值
    std::cout << "&*prx: " << &*prx << std::endl;  // 获取指针prx的地址

    return 0;
}

```
在C++里面，能不用指针都应该尽量避免，STL里面就大量使用引用。