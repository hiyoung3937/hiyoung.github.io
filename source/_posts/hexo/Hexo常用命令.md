---
title: Hexo常用命令
tags: [Hexo]
date: 2023-07-01 01:50:25
categories: [前端,网站建设]
mathjax:
---

记录一下平常会用到的一些Hexo指令，在指定文件夹下Git Bash here输入命令即可
<!-- more -->
## 基本命令

### init
建立一个新的网站。如果没有设定folder 的话，Hexo 会在目前的资料夹建立网站
``` Bash
hexo init [folder] 
```

### New
建立一篇新的文章。如果没有设定layout的话，则会使用_config.yml中的default_layout设定代替
```Bash
hexo new [layout] "title" 
```
### Generate
产生静态档案
```Bash
hexo generate 
```
生成静态档案即部署网站
```Bash
hexo d -g 
```
|选项|	描述|
|:---:|:---:|
|-d,--deploy|	产生完成即部署网站|
|-w,--watch|	监看档案变更|

### Server
启动本地预览，默认地址是http://localhost:4000/
```Bash
hexo server
```
|选项|	描述|
|:---:|:---:|
|-p,--port|	自选端口|
|-s,--static|	只使用静态档案|
|-l,--log|	启动记录器，或覆盖记录格式|

### Clean
清除缓存数据( db.json) 和已产生的静态档案( public)。
```Bash
hexo clean
```

### Version
显示版本资讯。
```Bash
hexo version
```

### Debug
在终端中显示除错讯息并储存记录档到debug.log
```Bash
hexo --debug
```

### Plugins
查看所有你安装的hexo插件
```Bash
npm ls -dept 0 
```

### 修改文章默认layout
在下列文件中可以修改新建文章的layout（文章开头的Front-matter内容）
```
scaffolds\post.md
```