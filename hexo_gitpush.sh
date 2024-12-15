#! /bin/bash
cd D:/Hexo/hiyoung.github.io

git add .
git commit -m "update"
git push origin hexo

sleep 1

hexo clean
hexo d -g