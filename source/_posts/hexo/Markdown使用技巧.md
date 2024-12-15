---
title: Markdown实用技巧
tags: [Markdown]
date: 2023-06-30 21:33:47
categories: [前端,网站建设]
mathjax: true
---

记录一下可能会用到非Markdown基础语法包含的实用技巧
官方的速查表<Markdown 语法速查表>(https://markdown.com.cn/cheat-sheet.html#%E5%9F%BA%E6%9C%AC%E8%AF%AD%E6%B3%95)

<!-- more -->
## Markdown实现页内跳转
<span id="jump">**跳转到的地方**</span>

比较通用的一个方法是使用html标签实现
1. 定义一个锚(id)：```<span id="jump">跳转到的地方</span>```
2. 使用markdown语法：```[点击跳转](#jump)```

[点击跳转](#jump)

## Markdown中的表格

处理使用markdown原生格式的表格使用html的表格更方便
1. markdown原生格式
   ```
    | 左对齐 | 右对齐 | 居中对齐 |
    | :-----| ----:  | :----: |
    | 单元格 | 单元格 | 单元格 |
    | 单元格 | 单元格 | 单元格 |
   ```

2. html实现

- tr：tr 是 table row 的缩写，表示表格的一行。
- td：td 是 table data 的缩写，表示表格的数据单元格。
- th：th 是 table header的缩写，表示表格的表头单元格
- align：设置内容左、右对齐或居中
- colspan：用于合并单元格

<table>
    <tr>
        <td align="center">$A_1$</td>
        <td align="center">$A_2$</td>
        <td align="center">...</td>
        <td align="center">$A_n$</td>
        <td align="center">判断测试字段</td>
        <td align="center">后继地址字段</td>
    </tr>
    <tr>
        <td colspan="4" align="center">操作控制</td>
        <td colspan="2" align="center">顺序控制</td>>
    </tr>
</table>

``` html
<table>
    <tr>
        <td align="center">$A_1$</td>
        <td align="center">$A_2$</td>
        <td align="center">...</td>
        <td align="center">$A_n$</td>
        <td align="center">判断测试字段</td>
        <td align="center">后继地址字段</td>
    </tr>
    <tr>
        <td colspan="4" align="center">操作控制</td>
        <td colspan="2" align="center">顺序控制</td>>
    </tr>
</table>
```

