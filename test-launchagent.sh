#!/bin/bash

# 测试脚本 - 验证 LaunchAgent 是否工作

LOG_FILE="/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site/test-launchagent.txt"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] LaunchAgent 测试成功！" >> "$LOG_FILE"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] 当前用户：$(whoami)" >> "$LOG_FILE"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] 工作目录：$(pwd)" >> "$LOG_FILE"
echo "---" >> "$LOG_FILE"
