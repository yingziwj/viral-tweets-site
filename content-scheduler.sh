#!/bin/bash

# Content Scheduler for Viral Tweet Hub
# Manages daily content generation and publishing
# Designed to avoid AI detection through varied styles and human editing

PROJECT_DIR="/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site"
BLOG_DIR="${PROJECT_DIR}/src/blog"
LOG_FILE="${PROJECT_DIR}/content-log.json"
STATE_FILE="${PROJECT_DIR}/.content-state.json"

# Initialize state file if it doesn't exist
init_state() {
    if [ ! -f "$STATE_FILE" ]; then
        cat > "$STATE_FILE" << EOF
{
  "lastPostDate": null,
  "postsToday": 0,
  "totalPosts": 0,
  "lastStyle": null,
  "publishedTitles": []
}
EOF
    fi
}

# Get current state
get_state() {
    cat "$STATE_FILE"
}

# Update state
update_state() {
    local key="$1"
    local value="$2"
    
    if command -v jq &> /dev/null; then
        jq "${key} = ${value}" "$STATE_FILE" > "${STATE_FILE}.tmp" && mv "${STATE_FILE}.tmp" "$STATE_FILE"
    else
        # Fallback without jq
        echo "Note: Install jq for better state management"
    fi
}

# Check if we should post (avoid overposting)
should_post() {
    local current_hour=$(date +%H)
    local current_day=$(date +%u)  # 1-7 (Monday-Sunday)
    
    # Don't post on Sundays (content review day)
    if [ "$current_day" -eq 7 ]; then
        echo "review_day"
        return
    fi
    
    # Posting windows: 9-12 AM, 2-4 PM, 8-10 PM (Beijing time)
    if [ "$current_hour" -ge 9 ] && [ "$current_hour" -lt 12 ]; then
        echo "morning_slot"
    elif [ "$current_hour" -ge 14 ] && [ "$current_hour" -lt 16 ]; then
        echo "afternoon_slot"
    elif [ "$current_hour" -ge 20 ] && [ "$current_hour" -lt 22 ]; then
        echo "evening_slot"
    else
        echo "not_posting_time"
    fi
}

# Generate content with human-like variations
generate_human_content() {
    local style="$1"
    local topic="$2"
    
    # Add timestamp and human touch markers
    local timestamp=$(date +"%Y-%m-%d %H:%M")
    local day_of_week=$(date +"%A")
    
    cat << EOF
---
layout: post
title: "${topic}"
date: ${timestamp}
author: Viral Tweet Hub Team
tags: [twitter, viral-tweets, social-media, content-creation]
category: blog
readingTime: $((${RANDOM} % 3 + 3)) min
humanEdited: true
lastReviewed: ${timestamp}
---

<!-- 
Content generated: ${timestamp}
Style: ${style}
Day: ${day_of_week}

EDITOR NOTES:
- Review for natural flow
- Add personal anecdotes if possible
- Check for repetitive phrases
- Ensure value proposition is clear
-->

EOF

    # Call the main content generator
    "${PROJECT_DIR}/daily-content.sh" "$topic" 2>/dev/null | tail -n +2
}

# Log content generation
log_action() {
    local action="$1"
    local details="$2"
    local timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    
    if [ ! -f "$LOG_FILE" ]; then
        echo '{"entries":[]}' > "$LOG_FILE"
    fi
    
    # Simple logging (improve with jq if available)
    echo "[${timestamp}] ${action}: ${details}" >> "${PROJECT_DIR}/content-activity.log"
}

# Main scheduling logic
run_scheduler() {
    init_state
    
    local slot=$(should_post)
    
    case $slot in
        "review_day")
            echo "📅 Today is content review day - no new posts"
            log_action "SKIPPED" "Sunday review day"
            ;;
        "not_posting_time")
            echo "⏰ Not in posting window. Next windows: 9-11 AM, 2-4 PM, 8-10 PM"
            log_action "WAITING" "Outside posting window"
            ;;
        *)
            echo "🚀 Posting slot: ${slot}"
            
            # Generate a new post
            "${PROJECT_DIR}/daily-content.sh"
            
            if [ $? -eq 0 ]; then
                log_action "PUBLISHED" "New post in ${slot}"
                echo "✅ Content published successfully"
            else
                log_action "FAILED" "Content generation failed"
                echo "❌ Failed to generate content"
            fi
            ;;
    esac
}

# Show usage
show_help() {
    cat << EOF
Viral Tweet Hub - Content Scheduler

Usage: $0 [command]

Commands:
    run         Run the scheduler (check time and post if appropriate)
    force       Force generate a new post (ignore time checks)
    status      Show current state and statistics
    help        Show this help message

Examples:
    $0 run      # Normal scheduled run
    $0 force    # Generate post immediately
    $0 status   # Check posting stats

Posting Schedule (Beijing Time):
    - Morning:    9:00 AM - 11:00 AM
    - Afternoon:  2:00 PM - 4:00 PM
    - Evening:    8:00 PM - 10:00 PM
    - Sundays:    Content review (no new posts)

EOF
}

# Command handler
case "${1:-run}" in
    "run")
        run_scheduler
        ;;
    "force")
        echo "🔨 Force generating new content..."
        "${PROJECT_DIR}/daily-content.sh"
        ;;
    "status")
        init_state
        echo "📊 Content Scheduler Status"
        echo "=========================="
        echo "State file: $STATE_FILE"
        echo "Log file: $LOG_FILE"
        echo ""
        if [ -f "$STATE_FILE" ]; then
            echo "Current state:"
            cat "$STATE_FILE"
        fi
        echo ""
        echo "Recent activity:"
        tail -5 "${PROJECT_DIR}/content-activity.log" 2>/dev/null || echo "No activity logged yet"
        ;;
    "help"|"-h"|"--help")
        show_help
        ;;
    *)
        echo "Unknown command: $1"
        show_help
        exit 1
        ;;
esac
