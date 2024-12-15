---
title: 使用Git上传文件至Github
date: 2022-08-03 11:18:44
tags: [Git,Github]
category: 实用工具教程
---
最近经常要使用Github保存我学习过程中的代码，发现无法直接上传文件夹，遂在网上查了一下使用Git上传，所以写个博文记录一下
<!--more-->
## Github端操作
### 1. 复制仓库地址
![使用Git上传文件至Github_1](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/使用Git上传文件至Github_1.3syztscmys80.jpg)

## 本地端操作
### 1. 在本地新建一个空文件夹
![使用Git上传文件至Github_2](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/使用Git上传文件至Github_2.5nufudqca7w0.jpg )
<center style="font-size:16px;color:#FFFFF">我这里已经clone完成</center>

### 2. 在文件夹内呼出Git Bash框
![使用Git上传文件至Github_3](https://cdn.staticaly.com/gh/hiyoung3937/img_hiyoung@master/bolg/使用Git上传文件至Github_3.5l2lii1fkd80.jpg)

### 3. Clone远程仓库
``` bash
git clone + 你的仓库地址
git clone https://github.com/hiyoung3937/study_code.git  //示例
``` 
### 4. 直接将需要上传的文件拖入即可

### 5. 上传
``` bash
cd  study_code.git   //根据自己的远程仓库名输入
git init
git add .
git commit -m “你的提交信息”
git push
```

----------------------
## 命令说明
<table>
<tr>
<th>clone + 仓库地址</th>           <td>克隆你的仓库至本地</td>
</tr>
<tr>
 <th>cd + 你的远程仓库名</th>       <td>进入到远程仓库内(根据自己的仓库名输入)</td>
<tr>
 <th>git init </th>                <td>初始化Git</td> 
</tr>
<tr>
 <th>git add .	</th>              <td>将工作区的文件添加到暂存区<br>（"."是当前目录下的所有文件，也可只输入文件夹名称）</td>
</tr>
<tr>
 <th>git commit -m  "你的提交信息"</th> 	<td>将暂存区的文件添加到本地仓库</td>
</tr>
<tr>
 <th>git push</th>                      <td>提交到远程仓库（可能需要你输入帐号和密码）</td>
</tr>
<tr>
<th>git pull <远程库名> <远程分支名>:<本地分支名></th>     <td>拉取远程仓库分支内容到本地分支<br>
                                                            git pull 命令等同于先做了git fetch ，再做了git merge</td>
</table>