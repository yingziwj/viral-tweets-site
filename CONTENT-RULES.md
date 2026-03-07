# 📜 内容发布规则 - 严禁违反！

**创建日期:** 2026-03-07  
**重要性:** ⚠️ 最高优先级 - 违反会导致网站质量问题

---

## ❌ 已发生的严重错误（绝不再犯！）

### 错误 #1: 卡片标题和摘要为空
**问题:** 文章没有 frontmatter，导致博客列表页显示空标题和空描述  
**影响:** 网站看起来像半成品，严重影响用户体验和 SEO  
**根本原因:** `daily-content.sh` 生成的 Markdown 文件缺少 YAML frontmatter

**✅ 解决方案:**
- 每篇文章必须有完整的 frontmatter
- 必须包含：`layout`, `title`, `date`, `description`, `readingTime`, `emoji`
- 在 `generate_content()` 函数中，**先写 frontmatter，再写内容**

**正确格式示例:**
```yaml
---
layout: base.njk
title: "文章标题"
date: 2026-03-07 20:00:00
description: "文章的简短描述，1-2 句话，用于 SEO 和卡片预览"
readingTime: "5 min read"
emoji: "🚀"
tags: [twitter, viral-tweets, social-media]
category: blog
author: Viral Tweet Hub Team
---
```

---

### 错误 #2: 文章具体内容没有样式
**问题:** 文章内容没有应用 layout 模板，导致纯文本无样式  
**影响:** 阅读体验极差，没有品牌感  
**根本原因:** frontmatter 中缺少 `layout: base.njk`

**✅ 解决方案:**
- frontmatter 第一行必须是 `layout: base.njk`
- 确保 `base.njk` 模板正确引用 CSS 样式
- 测试新文章时，必须访问完整页面验证样式

---

### 错误 #3: 发布旧闻（重复内容）
**问题:** 发布已经发布过的文章标题/内容  
**影响:** 内容重复，降低网站质量，浪费发布配额  
**根本原因:** 没有检查已发布标题的历史记录

**✅ 解决方案:**
1. 维护 `.content-state.json` 中的 `publishedTitles` 数组
2. 每次生成前先调用 `check_duplicate()` 函数
3. 标题去重逻辑：
   - 检查 state 文件中的历史记录
   - 检查现有博客文件的 frontmatter title
   - 如果发现重复，尝试其他标题或添加时间戳
4. 发布后立即更新 state 文件

**检查流程:**
```bash
# 1. 生成标题
POST_TITLE="随机选择的标题"

# 2. 检查是否重复
if check_duplicate "$POST_TITLE"; then
    echo "❌ 重复标题，跳过"
    exit 1
fi

# 3. 发布后记录
更新 publishedTitles 数组
```

---

## ✅ 内容生成标准流程

### 步骤 1: 生成前检查
```bash
# 检查当前时间是否在发布窗口
slot=$(should_post)
if [ "$slot" == "not_posting_time" ]; then
    echo "⏰ 不在发布窗口"
    exit 0
fi

# 检查是否是审查日（周日）
if [ "$slot" == "review_day" ]; then
    echo "📅 今天是审查日"
    exit 0
fi
```

### 步骤 2: 生成内容
```bash
# 1. 选择唯一标题（检查重复）
POST_TITLE=$(get_unique_title)

# 2. 选择随机风格
STYLE=${STYLES[$RANDOM % ${#STYLES[@]}]}

# 3. 生成描述
DESCRIPTION=$(generate_description "$POST_TITLE" "$STYLE")

# 4. 生成完整内容（包含 frontmatter）
generate_content "$POST_TITLE" "$STYLE" "$DESCRIPTION" > "${BLOG_DIR}/${FILENAME}"
```

### 步骤 3: 验证内容
```bash
# 检查 frontmatter 是否完整
if ! grep -q "^layout:" "$FILE"; then
    echo "❌ 缺少 layout"
    exit 1
fi

if ! grep -q "^title:" "$FILE"; then
    echo "❌ 缺少 title"
    exit 1
fi

if ! grep -q "^description:" "$FILE"; then
    echo "❌ 缺少 description"
    exit 1
fi
```

### 步骤 4: 构建和部署
```bash
# 1. 构建网站
npm run build

# 2. 验证构建成功
if [ ! -f "_site/blog/${SLUG}/index.html" ]; then
    echo "❌ 构建失败"
    exit 1
fi

# 3. Git 提交
git add -A
git commit -m "📝 Auto-post: $(date +"%Y-%m-%d %H:%M")"
git push origin main

# 4. 更新状态
update_state "publishedTitles" "$POST_TITLE"
```

---

## 🧪 发布前检查清单

每次发布前必须验证：

- [ ] Frontmatter 完整（layout, title, date, description, readingTime, emoji）
- [ ] 标题唯一（检查 publishedTitles 和现有文件）
- [ ] 描述非空且有意义（15-25 个单词）
- [ ] 内容应用了样式（访问完整页面验证）
- [ ] 构建成功（检查 _site 目录）
- [ ] 状态文件已更新

---

## 📋 文件责任

| 文件 | 作用 | 关键内容 |
|------|------|----------|
| `daily-content.sh` | 内容生成 | 必须生成完整 frontmatter |
| `content-scheduler.sh` | 调度管理 | 调用 daily-content.sh + git push |
| `.content-state.json` | 状态追踪 | publishedTitles 数组防重复 |
| `src/blog/index.md` | 博客列表 | 使用 post.data.title 和 post.data.description |
| `base.njk` | 页面模板 | 应用 CSS 样式 |

---

## 🚨 如果再次出现问题

### 调试步骤

1. **检查生成的 Markdown 文件:**
   ```bash
   cat src/blog/latest-post.md | head -20
   ```
   确认 frontmatter 存在且格式正确

2. **检查构建输出:**
   ```bash
   npm run build 2>&1 | grep -E "(Error|Writing)"
   ```

3. **检查网站实际效果:**
   ```bash
   curl https://viral-tweets-site.pages.dev/blog/ | grep -A5 "blog-card"
   ```

4. **查看日志:**
   ```bash
   tail -20 content-activity.log
   tail -20 launchagent-log.txt
   ```

### 紧急修复

如果发布了有问题的文章：

```bash
# 1. 删除问题文章
rm src/blog/problematic-post.md

# 2. 回滚状态文件
git checkout .content-state.json

# 3. 重新构建
npm run build

# 4. 提交修复
git add -A
git commit -m "🔧 Remove problematic post"
git push origin main
```

---

## 📝 更新日志

### 2026-03-07 - 初始版本
- 添加 frontmatter 生成
- 添加内容去重机制
- 添加发布前验证
- 创建此规则文档

---

**最后提醒:** 质量 > 数量。宁可少发一篇，也不要发垃圾内容。
