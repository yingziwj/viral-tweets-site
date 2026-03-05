# GitHub 配置指南

## 🔑 SSH 密钥已生成！

你的 SSH 公钥：
```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF6tqR3i1Rm6z42g0Z8SBScdiEe5gK23JC33NX6oSmqS yingziwj@github
```

---

## 📋 配置步骤（2 分钟）

### 第 1 步：添加 SSH 密钥到 GitHub

1. 访问：https://github.com/settings/keys
2. 点击 **"New SSH key"**
3. 标题：`MacBook Air`（或任意名称）
4. 复制上面的公钥，粘贴到 **Key** 框中
5. 点击 **"Add SSH key"**

### 第 2 步：创建仓库

1. 访问：https://github.com/new
2. 仓库名：`viral-tweets-site`
3. 设为 **Public**（必须公开，Cloudflare Pages 免费计划需要）
4. **不要** 勾选 "Add a README" 或 ".gitignore"
5. 点击 **"Create repository"**

### 第 3 步：测试连接

完成以上两步后，运行：

```bash
ssh -T git@github.com
```

应该看到：`Hi yingziwj! You've successfully authenticated...`

---

## 🚀 推送代码

配置完成后，告诉我，我会执行推送命令！

或者手动运行：

```bash
cd "/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site"
git remote add origin git@github.com:yingziwj/viral-tweets-site.git
git branch -M main
git push -u origin main
```

---

_完成后告诉我，我会继续下一步！_
