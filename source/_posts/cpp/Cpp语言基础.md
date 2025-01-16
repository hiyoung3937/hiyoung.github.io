---
title: Cpp语言基础
tags: [Cpp,C++]
date: 2024-01-15 15:12:57
categories: [学习笔记,C++]
mathjax: true
cover:
---

## 部分内容复习
<!--more-->

### [二级指针的作用](https://www.cnblogs.com/yongdaimi/p/13936028.html)
1. 指向指针的指针的作用:当要**修改实参指针的指向**的时候，**形参**必须使用指向指针的指针。
2. 当修改的是**实参指针指向的内容**时，则**形参**只需是指针即可

```C
void GetMemory(char *p,int num)
{
    p=(char*)malloc(sizeof(char)*num);//p是形参指向的地址
}
void main()
{
    char *str=NULL;
    GetMemory(str,100);//str是实参指向的地址，不能通过调用函数来申请内存
    strcpy(str,"hello");
}

```
结构是编译能通过，却不能运行，为什么呢？

先说一下指针作为函数参数的意义：当将指针作为参数时，实参向形参传递的是地址，在函数执行过程中，既可以对该参数指针进行处理，也可以对该参数指针所指向的数据进行处理，（以上程序段来说就是可以对p或*p进行处理）。**由于此时形参和实参都是指向同一个存储单元，因此当形参指针所指向的数据改变时，实参指针所指向的数据也作相应的改变，因此这时的形参可以作为输出参数使用。**（str和p应同时更改！）

按照上面的说法，这个程序应该没有问题的啊，实参str和形参p指向同一个存储单元，给形参分配的内存单元应该也给实参分配了才对啊，问题就是在这里

<p style="color:red"><b>实参和形参是指向同一个地址，它们只是指向相同，但它们自身的地址不是同时申请的，就是说p在申请内存时，相当于是把p的指向给改了，但是str的指向仍然没有改！所以尽管str调用了GetMemory，但它仍然是个空指针，所以进行strcpy是就不能运行</b></p>


要使程序可以运行，只要小小的改动就行了（用指向指针的指针）：
```C
void GetMemory(char **p,int num)
{
　　*p=(char*)malloc(sizeof(char)*num); //此时*p就变成了是形参本身的地址
}
void main()
{
　　char *str=NULL;
　　GetMemory(&str,100);//&str是实参的地址，所以实参和形参之间就可以直接调用
　　strcpy(str,"hello");
　　free(str);
}
```

## C++对C语言的加强

### namespace命名空间

#### C++命名空间基本常识
所谓namespace，是指**标识符的各种可见范围**。C++标准程序库中的所有标识符都被定义于一个名为std的namespace中。

c++标准为了和C区别开，也为了正确使用命名空间，规定头文件不使用后缀.h

1. 当使用<iostream.h>时，相当于在c中调用库函数，使用的是全局命名空间，也就是早期的c++实现;
2. 当使用<iostream>的时候，该头文件没有定义全局命名空间，必须使用namespace std;这样才能正确使用cout。 
3. 在程序开头使用```using namespace std;```，即可使命名空间std内定义的所有标识符都有效

#### 与C的区别
1. C中的命名空间
    - 在C语言中只有一个全局作用域
    - C语言中所有的全局标识符共享同一个作用域
    - 标识符之间可能发生冲突
2. C++中的命名空间
    - 命名空间将全局作用域分成不同的部分
    - 不同命名空间中的标识符可以同名而不会发生冲突
    - 命名空间可以相互嵌套
    - 全局作用域也叫默认命名空间

#### 在程序中使用命名空间
1. 定义命名空间
   ```Cpp
    namespace ns1//ns1为自定的命名空间名
    {
        const int RATE=0.08; //常量

    　　doublepay;       //变量(可带有初始化)

    　　doubletax()       //函数(可以是定义或声明)
        {
    　　　　return a*RATE;
    　　}

    　　namespacens2   //嵌套的命名空间
    　　{
    　　　　int age;
    　　}
    }
   ```
2. 使用命名空间别名
    ```cpp
    namespace Television //声明命名空间，名为Television
    { ... }
    ```
    可以用一个较短而易记的别名代替它。如：
    ```namespace TV=Television;//别名TV与原名Television等价```

3. 使用using命名空间成员名
   ```using nsl::Student```
   在用上面的using声明后，在其后程序中出现的Student就是隐含地指nsl::Student

#### 注意事项
在程序中如果直接使用```using namespace std```可以减少在变量前添加```std::```的繁琐编程，但是另一方面在多文件编译时可能会导致不同文件中定义的任何标识符可能与std命名空间中的同名标识符冲突，因此可以考虑使用，**若干个"using命名空间成员”声明来代替“using namespace命名空间”声明**，如：
```cpp
using std::string;

using std::cout;

using std::cin;
```
等。

### 三目运算符
1. C语言返回变量的值 C++语言是返回变量本身C语言中的三目运算符返回的是变量值，不能作为左值使用C++中的三目运算符可直接返回变量本身，因此可以出现在程序的任何地方
```c
int main(void)
{
    int a = 10;
    int b = 20;
    //返回一个最小数 并且给最小数赋值成30
    //三目运算符是一个表达式 ，表达式不可能做左值
    (a < b ? a : b ) = 30;//在Cpp中是可行的，而C中是错误的
    printf("a = %d, b = %d\n", a, b);
    return 0;
}
```

2. 三目运算符可能返回的值中如果有一个是常量值，则不能作为左值使用```(a < b ? 1 : b )= 30;```

### const增强

外链[C++中const关键字的使用方法总结](https://www.cnblogs.com/jiabei521/p/3335676.html)

C++中的const修饰的，是一个真正的常量，而不是C中变量（**只读**）。在const修饰的常量编译期间，就已经确定下来了
```c
    //C中
    const int a = 10;
    int *p = (int*)&a;
    *p = 11;//即可修改a中的值
```

C++中的const常量类似于宏定义
```const int c =5; 约等于 #define 5```

C++中的const常量与宏定义不同
    const常量是由编译器处理的，提供类型检查和作用域检查。
    宏定义由预处理器处理，单纯的文本替换

### 枚举
c 语言中枚举本质就是整型,枚举变量可以用任意整型赋值。而c++中枚举变量,只能用被枚举出来的元素初始化

```cpp

enum season {SPR=1,SUM,AUT,WIN};
int main()
{
    enum season s = SPR;
    //s = 0; // error, 但是C语⾔言可以通过
    s = SUM;
    cout << "s = " << s <<endl; //2

    return 0;
}
```

### 引用
- [C 和 C++ 中引用](/2023/02/04/1cfe99df0026/)
<!-- - {% post_link C和C++中引用 %} -->

变量名，本身是一段内存的引用，即别名(alias)。引用可以看作一个**已定义变量**的别名
```cpp
    int a = 10; //c编译器分配4个字节内存, a内存空间的别名
    int &b = a; //b就是a的别名
    a = 11; //直接赋值
    {
        int *p = &a;
        *p = 12;
        cout << a <<endl;
    }
    b = 14;
    cout << "a = " <<a << ", b = " << b <<endl;
```

1. 引用没有定义,是一种关系型声明。声明它和原有某一变量(实体)的关系。故而类型与原类型保持一致,且不分配内存。与被引用的变量有相同的地址
2. **&符号前有数据类型时,是引用。其它皆为取地址**
3. 声明的时候必须初始化,一经声明,不可变更
4. 可对引用,再次引用。多次引用的结果,是某一变量具有多个别名

```cpp
    int a,b;
    int &r = a;
    int &r = b; //错误,不可更改原有的引⽤关系
    float &rr = b; //错误,引⽤类型不匹配 cout<<&a<<&r<<endl; //变量与引⽤具有相同的地址。
    int &ra = r; //可对引⽤更次引用,表⽰ a 变量有两个别名,分别是 r 和 ra
```

#### 引用的意义
1. 引用作为其它变量的别名而存在，因此在一些场合可以代替指针
2. 引用相对于指针来说具有更好的可读性和实用性

```cpp
void swap(int a, int b); //无法实现两数据的交换
void swap(int *p, int *q); //开辟了两个指针空间实现交换

//使用引用
void swap(int &a, int &b){
    int tmp;
    tmp = a; a = b;
    b = tmp;
}

int main()
{
    int a = 3,b = 5;
    cout<<"a = "<<a<<"b = "<<b<<endl;
    swap(a,b);
    cout<<"a = "<<a<<"b = "<<b<<endl;
    return 0;
}
```

#### 引用的本质
```cpp
int main()
{
    int a = 10;
    int &b = a; // 注意： 单独定义的引用时，必须初始化。
    b = 11;
    printf("a:%d\n", a);
    printf("b:%d\n", b);
    printf("&a:%p\n", &a);
    printf("&b:%p\n", &b);
    return 0;
}

a:11
b:11
&a:000000000061fe14
&b:000000000061fe14
```

1. 可见得Cpp编译器在定义引用时是将两个变量名指向同一个内存地址：引用在C++中的内部实现是一个常指针
   ```Type& name <===> Type* const name```

2. C++编译器在编译过程中使用常指针作为引用的内部实现，**因此引用所占用的空间大小与指针相同**
3. 从使用的角度，引用会让人误会其只是一个别名，没有自己的存储空间。这是C++为了实用性而做出的细节隐藏。

间接赋值的三个必要条件
1. 定义两个变量 （一个实参一个形参）
2. 建立关联 实参取地址传给形参
3. *p形参去间接的修改实参的值

**引用在实现上，只不过是把：间接赋值成立的三个条件的后两步和二为一**
当实参传给形参引用的时候，只不过是c++编译器帮我们程序员手工取了一个实参地址，传给了形参引用（常量指针）。

#### 引用作为函数的返回值（引用当左值）

1. 当函数返回值为引用时,若返回栈变量:不能成为其它引用的初始值（不能作为右值使用）
```cpp
int getA1()
{
    int a;
    a = 10;
    return a;
}
int& getA2()
{
    int a;
    a = 10;
    return a;
}

//将⼀一个引⽤用赋给另⼀一个引⽤用作为初始值，由于是栈的引⽤用，内存⾮非法
int &a3 = getA2();
```
2. 当函数返回值为引用时,若返回静态变量或全局变量可以成为其他引用的初始值（可作为右值使用，也可作为左值使用）
```cpp
int& getA2()
{
    static int a;
    a = 10;
    return a;
}

//将⼀一个引⽤用赋给另⼀一个引⽤用作为初始值，由于是静态区域，内存合法
int &a3 = getA2();
```

3. 引用作为函数返回值，如果返回值为引用可以当左值，如果返回值为普通变量不可以当左值。
```cpp
//函数当左值
//返回变量的值
int func1()
{
    static int a1 = 10;
    return a1;
}
//返回变量本⾝
int& func2()
{
    static int a2 = 10;
    return a2;
}
int main(void)
{
    //函数当右值
    int c1 = func1();
    cout << "c1 = " << c1 <<endl;
    int c2 = func2(); //函数返回值是一个引⽤,并且当右值
    cout << "c2 = " << c2 <<endl;
    //函数当左值
    //func1() = 100; //error
    func2() = 100; //函数返回值是一个引用,并且当左值
    c2 = func2();
    cout << "c2 = " << c2 <<endl;
    return 0;
}

```

#### 指针引用

```cpp
struct Teacher
{
    char name[64];
    int age ;
};

// 在被调用函数 获取资源
int getTeacher(Teacher **p)
{
    Teacher *tmp = NULL;
    tmp = (Teacher*)malloc(sizeof(Teacher));
    tmp->age = 33;
    // p是实参的地址 *实参的地址 去间接的修改实参的值
    *p = tmp;
    return 0;
}

// 指针的引用 做函数参数
int getTeacher2(Teacher* &myp)
{
    // 给myp赋值 相当于给main函数中的pT1赋值
    myp = (Teacher *)malloc(sizeof(Teacher));
    if (myp == NULL)
        return -1;
    myp->age = 36;
    return 0;
}
void FreeTeacher(Teacher *pT1)
{
    if (pT1 == NULL)
        return;

    free(pT1);
}

int main(void)
{
    Teacher *pT1 = NULL;
    // 1 c语⾔言中的二级指针
    getTeacher(&pT1);
    cout << "age:" << pT1 -> age << endl;
    FreeTeacher(pT1);
    // 2 c++中的引用（指针的引用）
    // 引用的本质间接赋值后2个条件，让c++编译器帮我们程序员做了。
    getTeacher2(pT1);
    cout << "age:" << pT1 -> age << endl;
    FreeTeacher(pT1);
    return 0;
}
```

#### const 引用
const引用，它可以防止对象的值被随意修改。具有一些特性。
1. **const对象的引用必须是const的,将普通引用绑定到const对象是不合法的**
```cpp
const int a = 1;
int &b = a;//这是不合法的
```

2. **const引用可使用相关类型的对象(常量,非同类型的变量或表达式)初始化**。这个是const引用与普通引用最大的区别。
```cpp
//以下语句是合法的
const int &a = 2;
double x =3.1;
const int &b =a;
```

```cpp
//普通引用
int a = 10;
int &b = a;

//常引用
int x = 20;
const int &y = x; //常引用是限制变量为只读不能通过y去修改x了
//y = 21; //error
```

#### const 引用的原理

const引用是指向const对象的引用：
通过ref2对ival赋值会导致修改const对象的值，为防止这样的修改，需要规定将普通的引用绑定到const对象是不合法的。
```cpp
{
    const int ival =1024;
    const int &refVal = ival; //两者均为const对象
    int &ref2 = ival; //error！不能使用非const引用指向const变量
}

{
    double val =3.14;
    // double *ref = &val;
    // const double& ref = val;
    const int& ref = val;
    // int& refi = vali; //error
    double & ref2 = val;
    cout << ref << " " << ref2 <<endl;
    val = 5.22;
    cout << ref << " " << ref2 <<endl;
}


```

同样的初始化对于非const引用却是不合法的，而且会导致编译时错误，观察将引用绑定到不同的类型时所发生的事情，最容易理解上述行为。对于以下代码
```cpp
double dval = 3.14;
const int &ri = dval;

//编译器会将这些代码转换为以下形式
int temp = dval;
const int &ri = temp;
```

可以发现对于将引用绑定到不同类型时，编译器会创建一个int型的暂时变量存储dval，然后将ri绑定到temp上

**(Tips:引用在内部存放的是一个对象的地址，它是该对象的别名。对于不可寻址的值，如文字常量，以及不同类型的对象，编译器为了实现引用，必须生成一个临时对象，引用实际上指向该对象，但用户不能访问它。)**

- **结论**
  1. ```const int & e``` 相当于 ```const int * const e```
  2. 普通引用 相当于 ```int *const e```
  3. 当使用常量（字面量）对const引用进行初始化时，C++编译器会为常量值分配空间，并将引用名作为这段空间的别名
  4. 使用字面量对const引用初始化后，将生成一个只读变量

### inline内联函数

类似于C语言中宏函数，但是C中的宏函数处理发生在预处理阶段，没有语法检测。

```cpp
inline void func(int a)
{
    a = 20;
    cout << a <<endl;
}
int main(void)
{
    func(10);
    /*
    //编译器将内联函数的函数体直接展开
    {
    a = 20;
    cout << a <<endl;
    }
    */
    return 0;
}
```

1. 特点：
   1. 内联函数声明时inline关键字必须和函数定义结合在一起，否则编译器会直接忽略内联请求。
   2. C++编译器直接将函数体插入在函数调用的地方。
   3. 内联函数没有普通函数调用时的额外开销(压栈，跳转，返回)。
   4. 内联函数是一种特殊的函数，具有普通函数的特征（参数检查，返回类型等）。
   5. 内联函数由编译器处理，直接将编译后的函数体插入调用的地方，宏代码片段由预处理器处理，进行简单的文本替换，没有任何编译过程。
   6. C++的内联编译应该不包含循环、过多的条件判断、不宜实现太过复杂的的功能。
   7. 内联函数相对于普通函数的优势只是**省去了函数调用时压栈，跳转和返回的开销**。因此，**当函数体的执行开销远大于压栈，跳转和返回所用的开销时，那么内联将无意义。**

2. 总结：
   - 本质:以牺牲代码段空间为代价,提高程序的运行时间的效率。
   - 适用场景:函数体很“小”,且被“频繁”调用

### 函数默认参数

#### 单个默认参数
对于多次调用一函数同一实参时,C++给出了更简单的处理办法。给形参以默认值,这样就不用从实参那里取值了。

```cpp
//1 若你填写参数,使⽤用你填写的,不填写默认
void myPrint(int x = 3)
{
    cout<<"x: "<<x<< endl;
}
```

#### 多个默认参数

```cpp
//2 在默认参数规则 ，如果默认参数出现，那么右边的都必须有默认参数
float volume(float length, float weight = 4,float high = 5)
{
    return length*weight*high;
}
int main()
{
    float v = volume(10);
    float v1 = volume(10,20);
    float v2 = volume(10,20,30);
    cout<<v<<endl;
    cout<<v1<<endl;
    cout<<v2<<endl;
    return 0;
}
```

#### 占位参数

```cpp
/*
函数占位参数
占位参数只有参数类型声明，⽽而没有参数名声明
⼀一般情况下，在函数体内部⽆无法使⽤用占位参数
*/
int func(int a, int b, int)
{
    return a + b;
}

int main()
{
    func(1,2); //error,必须把最后一个占位参数补上

    func(1,2,3); //right
}

/*
可以将占位参数与默认参数结合起来使用
意义:为以后程序的扩展留下线索兼容C语⾔言程序中可能出现的不规范写法
*/

//C++可以声明占位符参数，占位符参数⼀一般⽤用于程序扩展和对C代码的兼容
int func2(int a, int b, int = 0)
{
    return a + b;
}
int main()
{
    //如果默认参数和占位参数在一起，都能调用起来
    func2(1, 2);
    func2(1, 2, 3);
    return 0;
}
```

### 函数重载

#### 规则(类似Java)
1. 函数名相同。
2. 参数个数不同,参数的类型不同,参数顺序不同,均可构成重载。
3. 返回值类型不同则不可以构成重载。
4. 一个函数,不能既作重载,又作默认参数的函数。

```cpp
int func(int a, int b, int c = 0)
{
    return a * b * c;
}
int func(int a, int b)
{
    return a + b;
}
int func(int a)
{
    return a;
}
int main()
{
    int c = 0;
    c = func(1, 2); //error. 存在二义性，调用失败，编译不能通过
    printf("c = %d\n", c);
    return 0;
}

```


## C++基本
### 头文件保护
#### 引出：**重复定义问题**
考虑以下示例：
**File_1.h**头文件包含以下内容
```cpp
int getNumber()
{
    return 4;
}
```

**File_2.h**
```cpp
#include "File_1.h"
```

**main.cpp**
```cpp
#include "File_1.h"
#include "File_2.h"

int main()
{
    return 0;
}
```
这个看似正常的程序**无法编译**！下面是所发生的事情。首先，main.cpp包含File_1.h，它将函数getNumber的定义复制到main.cpp中。然后，main.cpp包含File_2.h，间接包含File_1.h。这会将File_1.h的内容（包括函数getNumber的定义）复制到File_2.h中，然后将其复制到main.cpp中。

因此，在解析所有#include之后，main.cpp最终如下所示：
```cpp
int getNumber() //from File_1.h
{
    return 4;
}

int getNumber() //from File_2.h
{
    return 4;
}
int main()
{
    return 0;
}
```

#### 头文件保护
我们可以通过一种称为头文件保护（也称为包含保护）的机制来避免上述问题。头文件保护是采用以下形式的条件编译指令：
```cpp
//但根据惯例，它被设置为头文件的完整文件名，以大写字母键入，使用下划线表示空格或标点
//例如：square.h将被表示为：SQUARE_H    
#ifndef SOME_UNIQUE_NAME_HERE
#define SOME_UNIQUE_NAME_HERE

// 这里放置你的声明

#endif
```

### 基本调试策略
1. 注释代码
2. 验证代码流程
   在需要验证的代码前添加调试输出语句。
   打印用于调试的信息时，请使用```std::cerr```而不是```std:∶cout```。因为，std::cout可能有缓冲区而std::cerr没有缓冲，这意味着您发送给它的任何内容都将立即输出
3. 条件化调试代码
   在引入调试代码后，完成调试后，您要么需要删除它们，要么将它们注释掉。如果以后需要它们，则必须重新添加它们，或取消注释它们。非常麻烦且容易扰乱正常的代码功能。
   使用预处理指令，可以很容易的在整个程序中启用或禁用调试语句
   ```cpp
    #include <iostream>
    
    #define ENABLE_DEBUG // 注释掉这一行，可以禁用掉调试输出
    //如果这是一个多文件程序，#define ENABLE_DEBUG 将放在头文件中，被所有用到的地方引用，方便我们可以在单个位置注释/取消注释#define，并将其传播到所有代码文件。

    int getUserInput()
    {
        #ifdef ENABLE_DEBUG
        std::cerr << "getUserInput() called\n";
        #endif
        std::cout << "Enter a number: ";
        int x{};
        std::cin >> x;
        return x;
    }
    
    int main()
    {
        #ifdef ENABLE_DEBUG
        std::cerr << "main() called\n";
        #endif
        int x{ getUserInput() };
        std::cout << "You entered: " << x << '\n';
    
        return 0;
    }

   ```
4. 使用日志记录器（Logger）
   现代常用的调试和错误记录方式，具体内容可以在网络上学习

### 
每当您看到使用尖括号（<>）的C++语法（不包括预处理器）时，尖括号之间的东西很可能是类型。这通常是C++处理需要参数化类型的代码的方式。

