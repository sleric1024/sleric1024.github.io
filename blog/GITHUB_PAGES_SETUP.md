# GitHub Pages 设置指南

## 仓库设置步骤

### 1. 访问你的 GitHub 仓库

打开浏览器，访问：https://github.com/sleric1024/sleric1024.github.io

### 2. 进入 Settings（设置）

- 点击仓库页面右上角的 **Settings** 标签

### 3. 配置 GitHub Pages

- 在左侧菜单中找到 **Pages** 选项（在 "Code and automation" 部分下）
- 点击进入 Pages 设置页面

### 4. 配置 Source（来源）

有两种配置方式：

#### 方式一：使用 master 分支（推荐，与当前配置匹配）

- **Source**: 选择 "Deploy from a branch"
- **Branch**: 选择 `master` 分支
- **Folder**: 选择 `/ (root)`
- 点击 **Save** 保存

#### 方式二：使用 gh-pages 分支

如果你想使用专门的 gh-pages 分支（需要修改 blog/\_config.yml 中的 deploy.branch）：

- **Source**: 选择 "Deploy from a branch"
- **Branch**: 选择 `gh-pages` 分支
- **Folder**: 选择 `/ (root)`
- 点击 **Save** 保存

### 5. 等待部署完成

- 保存后，GitHub 会自动开始构建和部署
- 页面顶部会显示一个通知框，告诉你网站正在构建
- 通常需要 1-3 分钟完成
- 完成后会显示：**Your site is live at https://sleric1024.github.io/**

## 重要说明

### 当前配置

你的 Hexo 配置文件（blog/\_config.yml）已设置为：

```yaml
deploy:
  type: git
  repo: https://github.com/sleric1024/sleric1024.github.io.git
  branch: master
```

这意味着当你运行 `hexo deploy` 时，生成的静态文件会被推送到 **master** 分支。

### GitHub Pages 工作原理

1. **Hexo 生成静态文件**：`hexo generate` 会在 `blog/public/` 目录生成 HTML、CSS、JS 文件
2. **部署到 GitHub**：`hexo deploy` 会将这些文件推送到指定的分支（master）
3. **GitHub Pages 发布**：GitHub 自动从该分支读取文件并发布到 https://sleric1024.github.io

### 注意事项

#### ⚠️ 分支冲突警告

你的仓库根目录已经有一些旧的 HTML 文件（index.html, 2022/, archives/ 等）。当你第一次运行 `hexo deploy` 时：

- Hexo 会**覆盖整个 master 分支**的内容
- 这些旧文件会被替换为新生成的 Hexo 网站
- 建议先备份重要的旧文件

#### 🔐 认证设置

首次部署时，GitHub 可能要求身份验证：

**选项 1：使用 Personal Access Token（推荐）**

1. 访问：https://github.com/settings/tokens
2. 点击 "Generate new token" → "Generate new token (classic)"
3. 勾选 `repo` 权限
4. 生成并复制 token
5. 部署时使用 token 作为密码

**选项 2：使用 SSH（更方便）**

1. 修改 blog/\_config.yml 中的 repo：
   ```yaml
   deploy:
     repo: git@github.com:sleric1024/sleric1024.github.io.git
   ```
2. 确保已配置 SSH key（运行 `ssh -T git@github.com` 测试）

## 部署流程

### 完整部署步骤

```bash
# 进入 blog 目录
cd /Users/I307742/git/sleric1024.github.io/blog

# 方法 1：使用脚本（推荐）
./deploy.sh

# 方法 2：手动执行
npx hexo clean      # 清理缓存
npx hexo generate   # 生成静态文件
npx hexo deploy     # 部署到 GitHub
```

### 首次部署后

1. 等待 1-3 分钟让 GitHub Pages 完成构建
2. 访问 https://sleric1024.github.io 查看你的网站
3. 如果看不到更新，尝试：
   - 清除浏览器缓存
   - 使用无痕模式访问
   - 等待更长时间（最多 10 分钟）

## 验证 GitHub Pages 状态

### 在 GitHub 网站上查看

1. 访问：https://github.com/sleric1024/sleric1024.github.io/settings/pages
2. 查看页面顶部的状态消息
3. 如果显示绿色勾选标记和网址，说明已成功部署

### 查看部署历史

1. 访问：https://github.com/sleric1024/sleric1024.github.io/deployments
2. 可以看到所有的部署记录和状态

## 常见问题

### Q: 部署后网站显示 404

**A**: 检查以下内容：

- GitHub Pages 是否已启用
- Branch 设置是否正确（应该是 master）
- 等待几分钟让 GitHub 完成构建

### Q: 样式丢失或显示不正常

**A**: 确认 blog/\_config.yml 中的 url 设置：

```yaml
url: https://sleric1024.github.io
```

### Q: 需要密码/token

**A**: 参考上面的 "认证设置" 部分，使用 Personal Access Token 或 SSH

### Q: 想使用自定义域名

**A**:

1. 在 blog/source/ 目录创建 CNAME 文件
2. 文件内容为你的域名，如：`blog.example.com`
3. 在域名服务商配置 DNS 记录指向 GitHub Pages

## 下一步

✅ 完成 GitHub Pages 设置后，运行：

```bash
cd /Users/I307742/git/sleric1024.github.io/blog
./deploy.sh
```

然后访问 https://sleric1024.github.io 查看你的博客！
