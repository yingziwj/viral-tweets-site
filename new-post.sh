#!/bin/bash

# ============================================
# Viral Tweet Academy - Daily Content Script
# ============================================
# This script helps you create and publish new blog posts quickly
# 
# Usage: ./new-post.sh "Your Post Title"
# ============================================

# Check if title is provided
if [ -z "$1" ]; then
    echo "❌ Please provide a post title"
    echo "Usage: ./new-post.sh \"Your Post Title\""
    exit 1
fi

# Get today's date
DATE=$(date +%Y-%m-%d)

# Create slug from title (lowercase, hyphens instead of spaces)
SLUG=$(echo "$1" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | sed 's/[^a-z0-9-]//g')

# File path
FILE_PATH="src/blog/${DATE}-${SLUG}.md"

# Check if file already exists
if [ -f "$FILE_PATH" ]; then
    echo "❌ File already exists: $FILE_PATH"
    exit 1
fi

# Create the new post file with template
cat > "$FILE_PATH" << EOF
---
title: "$1"
date: ${DATE}
description: "Write a compelling description for SEO (150-160 characters)"
readingTime: "5 min read"
emoji: "🚀"
---

<!-- Write your content here in Markdown -->

## Introduction

Start with a compelling hook that draws readers in...

## Main Point 1

Your first main point with examples and details...

## Main Point 2

Your second main point with examples and details...

## Main Point 3

Your third main point with examples and details...

## Conclusion

Summarize key takeaways and include a call-to-action...

---

**Found this useful?** Follow [@viraltweetacademy](https://twitter.com/viraltweetacademy) for daily tips.

**Questions?** Drop them in the replies!
EOF

echo "✅ New post created: $FILE_PATH"
echo ""
echo "Next steps:"
echo "1. Edit the file: code $FILE_PATH (or your preferred editor)"
echo "2. Write your content"
echo "3. Build the site: npm run build"
echo "4. Test locally: npm start"
echo "5. Deploy: git add . && git commit -m 'Add new post: $1' && git push"
echo ""
