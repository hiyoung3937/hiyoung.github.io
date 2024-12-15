---
title: CSS笔记
date: 2022-08-18 15:11:02
tags: CSS
category: [前端,CSS]
---
<style>
    .class_1{
    color: red;
  }
</style>

近日为实现萌娘百科上的小黑条功能，特学习一番CSS<span class="heimu" title="你知道的太多了">，已经实现了捏</span>
<!--more-->
<h2> 一、CSS语法</h2>

#### 1.基本属性
1. CSS 规则集（rule-set）由选择器和声明块组成：
``` h1 {color:red;font-size:14px;}```
>- h1->选择器
>- color->属性
>- red->属性值
>- {color:red;}->声明

>- 选择器指向您需要设置样式的 HTML 元素。
>- 声明块包含一条或多条用分号分隔的声明。
>- 每条声明都包含一个 CSS 属性名称和一个值，以**冒号**分隔。
>- **多条 CSS 声明用分号**分隔，**声明块用花括号**括起来。

##### 实例1.1
在此例中，所有 ```<p>```元素都将居中对齐，并带有红色文本颜色

``` css

p {
  color: red;
  text-align: center;
}
```

#### 2.CSS选择器

#### 1. 分类
CSS 选择器用于“查找”（或选取）要设置样式的 HTML 元素。

我们可以将 CSS 选择器分为五类：

- 简单选择器（根据名称、id、类来选取元素）
- 组合器选择器（根据它们之间的特定关系来选取元素）
- 伪类选择器（根据特定状态选取元素）
- 伪元素选择器（选取元素的一部分并设置其样式）
- 属性选择器（根据属性或属性值来选取元素）

#### 2. CSS元素选择器
元素选择器根据元素名称来选择 HTML 元素

##### 实例1.2
在此例中，所有 ```<p>```元素都将居中对齐，并带有红色文本颜色

``` css

p {
  color: red;
  text-align: center;
}
```

#### 3. CSS id 选择器
id 选择器使用 HTML 元素的 id 属性来选择特定元素。

元素的 id 在页面中是唯一的，因此 id 选择器用于选择一个唯一的元素！

要选择具有特定 id 的元素，请写一个井号（#），后跟该元素的 id。

**注意**：id 名称不能以数字开头。
##### 实例1.3
这条 CSS 规则将应用于 id="para1" 的 HTML 元素：

``` css

#para1 {
  text-align: center;
  color: red;
}

<p id="para1">Hello World!</p>
<p>本段不受样式的影响。</p>
```

#### 4. CSS 类选择器

类选择器选择有特定 class 属性的 HTML 元素。

如需选择拥有特定 class 的元素，请写一个句点（.）字符，后面跟类名。

**注意**：类名不能以数字开头！
##### 实例1.4
在此例中，所有带有 class="center" 的 HTML 元素将为红色且居中对齐：
``` css

.center {
  text-align: center;
  color: red;
}

<h1 class="center">居中的红色标题</h1>
<p class="center">居中的红色段落。</p> 
```

##### 实例1.5
也可以指定只有特定的 HTML 元素会受类的影响。

在这个例子中，只有具有 class="center" 的 ``` <p> ```元素会居中对齐：

``` css

p.center {
  text-align: center;
  color: red;
}
```
##### 实例1.6
HTML 元素也可以引用多个类。

在这个例子中，<p> 元素将根据 class="center" 和 class="large" 进行样式设置：

``` css

<p class="center large">这个段落引用两个类。</p>
```

**Tips：class和id的区别**
>
id是一个标签，只能用在一个结构或内容上，用于区分不同的结构和内容

class是一个样式，可以用在任何结构和内容上
>

#### 5. CSS 通用选择器

通用选择器（*）选择页面上的所有的 HTML 元素。

##### 实例1.7
下面的 CSS 规则会影响页面上的每个 HTML 元素：

``` css

* {
  text-align: center;
  color: blue;
}
```

#### 6. CSS 分组选择器
分组选择器选取所有具有相同样式定义的 HTML 元素

如需对选择器进行分组，请用逗号来分隔每个选择器

##### 实例1.8
在这个例子中，```<h1>,<h2>,<p>``` 具有相同的属性

``` css 

h1, h2, p {
  text-align: center;
  color: red;
}
```

#### 7. 总结
<table>
<tr>
<th>选择器</th>     <th>例子</th>       <th>例子描述</th>
</tr>

<tr>
<td>.class</td>   <td>.intro</td>   <td>选取所有 class="intro" 的元素</td>
</tr>

<tr>
<td>#id</td>   <td>#firstname</td>   <td>选取 id="firstname" 的那个元素</td>
</tr>

<tr>
<td>*</td>   <td>*</td>   <td>选取所有元素。</td>
</tr>

<tr>
<td>element</td>   <td>p</td>   <td>选取所有&lt;p&gt;元素</td>
</tr>

<tr>
<td>element,element,..</td>   <td>div, p</td>   <td>选取所有 &lt;div&gt; 元素和所有 &lt;p&gt; 元素</td>
</tr>
</table>


### 二、如何添加CSS

#### 有四种插入样式表的方法：

- [外部(链接方式) CSS](#外部css)
- [内部(嵌入方式) CSS](#内部css)
- [行内 CSS](#行内css)
- [导入(导入方式) CSS](#导入css)
#### 外部CSS

通过使用外部样式表，只需修改一个文件即可改变整个网站的外观

每张 HTML 页面必须在 ```<head>```部分的```<link>```元素内包含对外部样式表文件的引用

外部样式表必须以 .css 扩展名保存，外部 .css 文件不应包含HTML标签，仅需写入css代码即可

外部CSS是目前使用最多的引入CSS的方式，比较推荐使用此方式添加CSS

**<span class="class_1">注意</span>**：请勿在属性值和单位之间添加空格（例如``` margin-left: 20 px;```）正确的写法是：```margin-left: 20px;```

##### 实例2.1
``` html
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body>

<h1>This is a heading</h1>
<p>This is a paragraph.</p>

</body>
</html>
```

#### 内部CSS 

如果一张 HTML 页面拥有唯一的样式，那么可以使用内部样式表。

内部样式是在```<head>```部分的```<style>```元素中进行定义，直接在style中添加css代码即可

##### 实例2.2
``` html
<!DOCTYPE html>
<html>
<head>
<style>
body {
  background-color: linen;
}

h1 {
  color: maroon;
  margin-left: 40px;
} 
</style>
</head>
<body>

<h1>This is a heading</h1>
<p>This is a paragraph.</p>

</body>
</html>
```

#### 行内CSS

行内样式（也称内联样式）可用于为单个元素应用唯一的样式。

如需使用行内样式，请将 style 属性添加到相关元素。style 属性可包含任何 CSS 属性。

并不建议使用此方式
##### 实例2.3
``` html
<!-- 行内样式在相关元素的 "style" 属性中定义： -->
<!DOCTYPE html>
<html>
<body>

<h1 style="color:blue;text-align:center;">This is a heading</h1>
<p style="color:red;">This is a paragraph.</p>

</body>
</html>
```

#### 导入CSS
导入方式指的是使用 CSS 规则引入外部 CSS 文件。
非必要情况下建议使用外部CSS(link标签引入)，原因如下：
>- link 属于 HTML，通过 <link> 标签中的 href 属性来引入外部文件，而 @import 属于 CSS，所以导入语句应写在 CSS 中，要注意的是导入语句应写在样式表的开头，否则无法正确导入外部文件；
<br>
>- @import 是 CSS2.1 才出现的概念，所以如果浏览器版本较低，无法正确导入外部样式文件；
<br>
>- 当 HTML 文件被加载时，link 引用的文件会同时被加载，而 @import 引用的文件则会等页面全部下载完毕再被加载；

##### 实例2.4
``` css
<style>
    @import url(style.css);
</style>
```