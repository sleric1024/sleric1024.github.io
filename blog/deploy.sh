#!/bin/bash

# 清理旧的生成文件
echo "清理旧的生成文件..."
npx hexo clean

# 生成静态文件
echo "生成静态文件..."
npx hexo generate

# 部署到 GitHub
echo "部署到 GitHub Pages..."
npx hexo deploy

echo "部署完成！"
echo "你的网站将在几分钟后更新到: https://sleric1024.github.io"
