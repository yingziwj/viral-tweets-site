# 自动化任务持久化配置

## ✅ 当前状态

### Cron 服务
- **状态**: 系统级服务，重启后自动运行
- **配置文件**: `/usr/lib/cron/tabs/wjjava` (通过 `crontab -l` 查看)
- **日志**: `/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site/cron-log.txt`

### 发帖时间表 (北京时间)
| 时间 | 任务 |
|------|------|
| 9:30 AM | 上午文章 |
| 2:30 PM | 下午文章 |
| 8:30 PM | 晚上文章 |

---

## ⚠️ 重要注意事项

### 1. 外部 SSD 挂载
- cron 任务依赖外部 SSD 挂载到 `/Volumes/Extreme SSD/`
- **重启后**: 确保 SSD 已连接并自动挂载
- **如果未挂载**: cron 任务会失败，日志中会显示错误

### 2. macOS 权限
确保 cron 有 **完全磁盘访问权限**:
1. 系统设置 → 隐私与安全性 → 完全磁盘访问权限
2. 添加 `/usr/sbin/cron` 或 Terminal

### 3. 浏览器/前台页面
- **关闭浏览器不影响**: cron 是后台服务，独立运行
- **关闭 Terminal 不影响**: cron 是系统服务
- **重启电脑后**: cron 会自动重启，但需要 SSD 已挂载

---

## 🔧 验证自动化是否运行

### 检查 cron 服务
```bash
ps aux | grep cron | grep -v grep
```

### 查看最近的执行日志
```bash
tail -20 "/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site/cron-log.txt"
```

### 检查今日生成的文章
```bash
ls -la "/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site/src/blog/" | grep $(date +%Y%m%d)
```

---

## 🚨 故障排查

### 如果 cron 任务没有执行：

1. **检查 SSD 是否挂载**:
   ```bash
   ls "/Volumes/Extreme SSD/"
   ```

2. **检查 cron 日志**:
   ```bash
   tail -50 "/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site/cron-log.txt"
   ```

3. **手动测试运行**:
   ```bash
   cd "/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site"
   ./cron-generate-content.sh
   ```

4. **检查 node 是否可用**:
   ```bash
   which node
   node --version
   ```

---

## 📋 重启后的检查清单

重启电脑后，确认以下几点：

- [ ] 外部 SSD 已连接并挂载
- [ ] 网络已连接（GitHub 推送需要）
- [ ] cron 服务正在运行：`ps aux | grep cron`
- [ ] 查看日志确认下次任务时间

---

## 🔄 可选：创建 LaunchAgent (更可靠)

如果希望更可靠的开机自启，可以创建 macOS LaunchAgent：

```bash
# 创建 LaunchAgent 配置文件
mkdir -p ~/Library/LaunchAgents

# 配置文件内容 (com.viraltweethub.scheduler.plist)
```

（如需要，请联系我帮你配置）

---

_最后更新：2026-03-06_
