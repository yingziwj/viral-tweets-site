# Google Analytics 配置指南

## 📊 为什么要添加 Google Analytics？

- 追踪网站访问量
- 了解用户来源（搜索引擎、社交媒体等）
- 分析最受欢迎的页面
- 监控用户行为（停留时间、跳出率等）
- 为 AdSense 申请提供数据支持

---

## 🚀 配置步骤（5 分钟）

### 第 1 步：创建 Google Analytics 账户

1. 访问：**https://analytics.google.com**
2. 点击 **"Start measuring"**
3. 用你的 Google 账号登录（和 AdSense 同一个账号最好）

### 第 2 步：设置账户

1. **Account name:** `Viral Tweet Hub`
2. 点击 **"Next"**

### 第 3 步：设置 Property（属性）

1. **Property name:** `Viral Tweet Hub`
2. **Reporting time zone:** `China Standard Time`
3. **Currency:** `CNY` 或 `USD`
4. 点击 **"Next"**

### 第 4 步：选择业务信息

1. **Business size:** `Small business`（或根据实际情况）
2. **Category:** `Internet Media` 或 `Marketing & Advertising`
3. 点击 **"Next"**

### 第 5 步：选择目标

选择适合的目标，例如：
- ✅ Generate leads
- ✅ Drive online sales
- ✅ Raise brand awareness
- ✅ Examine user behavior

点击 **"Create"**

### 第 6 步：选择平台

1. 选择 **"Web"**（网站）
2. 点击 **"Next"**

### 第 7 步：输入网站信息

1. **Website URL:** `https://viral-tweets-site.pages.dev`
2. **Stream name:** `Viral Tweet Hub`
3. 点击 **"Create stream"**

### 第 8 步：获取 Measurement ID

创建成功后，你会看到一个 **Measurement ID**，格式类似：
```
G-XXXXXXXXXX
```

复制这个 ID！

---

## 🔧 添加到网站

### 方法 1：修改配置文件（推荐）

1. 打开文件：`/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site/src/_data/site.json`

2. 找到 `analytics` 部分：
```json
"analytics": {
  "ga4": "",
  "enabled": false
}
```

3. 填入你的 Measurement ID：
```json
"analytics": {
  "ga4": "G-XXXXXXXXXX",
  "enabled": true
}
```

4. 保存文件

### 方法 2：直接修改模板

如果不想修改配置文件，也可以直接在 `base.njk` 中硬编码：

```html
<!-- Google Analytics 4 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

---

## 📤 部署更新

修改完成后，推送到 GitHub：

```bash
cd "/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site"
git add .
git commit -m "Add Google Analytics tracking"
git push
```

Cloudflare Pages 会自动重新部署（约 1-2 分钟）。

---

## ✅ 验证安装

### 方法 1：Realtime 报告

1. 打开你的网站：https://viral-tweets-site.pages.dev
2. 在 Google Analytics 后台，点击 **"Reports"** → **"Realtime"**
3. 应该能看到至少 1 个活跃用户（你自己）

### 方法 2：使用 Google Tag Assistant

1. 安装 Chrome 扩展：**Google Tag Assistant Companion**
2. 访问你的网站
3. 扩展会显示 GA 标签是否正确加载

### 方法 3：检查网页源代码

1. 在网站上右键 → **"查看网页源代码"**
2. 搜索 `G-XXXXXXXXXX`
3. 应该能找到你的 GA 代码

---

## 📈 常用报告

### 1. Realtime（实时）
- 当前在线用户数
- 正在查看的页面
- 用户来源

### 2. Acquisition（获客）
- 流量来源（Google、Twitter、直接访问等）
- 哪些渠道带来最多用户

### 3. Engagement（互动）
- 平均停留时间
- 跳出率
- 最受欢迎的页面

### 4. Demographics（人口统计）
- 用户地理位置
- 年龄分布
- 设备类型（手机/PC）

---

## 🔗 与 AdSense 关联

申请 AdSense 时，有 Analytics 数据会增加通过率：

1. 在 Google Analytics 后台
2. 点击 **"Admin"** → **"Product Links"** → **"AdSense Links"**
3. 关联你的 AdSense 账户

---

## 📊 进阶功能

### 设置目标转化

追踪重要行为，例如：
- 点击 "Subscribe" 按钮
- 访问联系页面
- 点击外部链接

### 设置事件追踪

追踪特定交互：
```javascript
// 追踪按钮点击
gtag('event', 'click', {
  'event_category': 'Engagement',
  'event_label': 'Subscribe Button'
});
```

### 启用增强测量

在 GA4 设置中启用：
- 页面滚动追踪
- 出站点击
- 站内搜索
- 文件下载

---

## ⚠️ 注意事项

### GDPR 合规

如果你的网站有欧洲用户，需要：
- 添加 Cookie 同意横幅
- 允许用户选择退出追踪

### 隐私政策

更新隐私政策，说明使用 Google Analytics：

```markdown
## Analytics

We use Google Analytics to analyze website usage and improve our content.
Google Analytics collects information such as pages visited, time spent on site,
and geographic location. This data is anonymized and used for statistical purposes only.
```

（你的隐私政策页面已经包含了相关内容）

---

## 🎯 下一步

配置好 Google Analytics 后：

1. ✅ 监控网站流量
2. ✅ 分析用户行为
3. ✅ 优化内容策略
4. ✅ 准备 AdSense 申请

---

_有问题随时问！_
