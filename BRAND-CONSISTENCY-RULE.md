# 🎯 品牌一致性规则 - X (Twitter)

**创建日期:** 2026-03-07  
**优先级:** ⚠️ 高 - 必须在每次发布前执行

---

## 📋 规则说明

**所有提及 "Twitter" 的地方必须替换为 "X (Twitter)"**

### 原因
1. **品牌官方名称:** Twitter 已于 2023 年正式更名为 X
2. **专业形象:** 统一品牌名称显得更专业
3. **SEO 优化:** 避免搜索引擎混淆
4. **用户认知:** 帮助用户理解平台名称变化

---

## ✅ 自动替换规则

### 在 `daily-content.sh` 中的实现

```bash
# ✅ CRITICAL RULE: Replace all "Twitter" with "X (Twitter)" for brand consistency
# This applies to: title, description, and all content
echo "🔄 Applying brand consistency: Twitter → X (Twitter)"
sed -i '' 's/Twitter/X (Twitter)/g' "$TEMP_FILE"
sed -i '' 's/twitter/X (Twitter)/g' "$TEMP_FILE"
```

### 替换范围
- ✅ 文章标题 (title)
- ✅ 文章描述 (description)
- ✅ 正文内容 (body)
- ✅ 标签 (tags)
- ✅ 分类 (category)

---

## 🧪 验证方法

### 检查文件中是否有孤立的 "Twitter"
```bash
# 应该返回 0 或只有 "X (Twitter)" 格式
grep "Twitter" article.md

# 正确输出示例:
# description: "...X (Twitter)..."
# tags: [X (Twitter), ...]
# I almost quit X (Twitter) before...
```

### 验证替换成功
```bash
# 统计 X (Twitter) 出现次数
grep -o "X (Twitter)" article.md | wc -l

# 应该返回大于 0 的数字
```

---

## 📝 示例对比

### ❌ 错误示例
```yaml
title: "How to Grow on Twitter"
description: "Tips for Twitter success"
tags: [twitter, social-media]
```

正文：
> "I learned this on Twitter last year..."

### ✅ 正确示例
```yaml
title: "How to Grow on X (Twitter)"
description: "Tips for X (Twitter) success"
tags: [X (Twitter), social-media]
```

正文：
> "I learned this on X (Twitter) last year..."

---

## 🔍 发布前检查

每次发布前必须验证：

- [ ] 标题中的 Twitter → X (Twitter)
- [ ] 描述中的 Twitter → X (Twitter)
- [ ] 正文中的 Twitter → X (Twitter)
- [ ] 标签中的 twitter → X (Twitter)
- [ ] 没有孤立的 "Twitter" 字样

---

## 🚨 如果发现违规

### 手动修复
```bash
# 对单篇文章
sed -i '' 's/Twitter/X (Twitter)/g' src/blog/article.md
sed -i '' 's/twitter/X (Twitter)/g' src/blog/article.md

# 对所有文章
find src/blog -name "*.md" -exec sed -i '' 's/Twitter/X (Twitter)/g' {} \;
find src/blog -name "*.md" -exec sed -i '' 's/twitter/X (Twitter)/g' {} \;
```

### 重新构建
```bash
npm run build
git add -A
git commit -m "🔧 Fix brand consistency: Twitter → X (Twitter)"
git push origin main
```

---

## 📊 影响范围

| 文件类型 | 影响 | 自动替换 |
|----------|------|----------|
| 新文章 | ✅ 高 | ✅ 是 |
| 旧文章 | ⚠️ 中 | ❌ 否（需手动） |
| 页面标题 | ✅ 高 | ✅ 是 |
| Meta 描述 | ✅ 高 | ✅ 是 |
| Tags | ✅ 中 | ✅ 是 |

---

## 📈 监控建议

- 每周检查一次新发布内容
- 使用 grep 批量扫描旧文章
- 考虑添加 CI/CD 检查步骤

---

**最后更新:** 2026-03-07  
**状态:** ✅ 已实施并自动化
