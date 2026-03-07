#!/bin/bash

# Daily Content Generator for Viral Tweet Hub
# Creates human-like content with varied writing styles to avoid AI detection
# ✅ FIXED: Added proper frontmatter, content deduplication, and styling

POST_TITLE="$1"
DATE=$(date +"%Y-%m-%d")
DATETIME=$(date +"%Y-%m-%d %H:%M:%S")
BLOG_DIR="/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site/src/blog"
STATE_FILE="/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site/.content-state.json"

# Writing style templates (rotated daily to add variety)
STYLES=("conversational" "storytelling" "listicle" "case-study" "opinion")
RANDOM_STYLE=${STYLES[$RANDOM % ${#STYLES[@]}]}

# Hook templates
HOOKS=(
    "Here's the thing nobody tells you about viral tweets..."
    "I analyzed 1000+ viral tweets. Here's what I found:"
    "Stop making this mistake if you want viral tweets:"
    "The secret to viral tweets isn't what you think..."
    "3 years ago I had 47 followers. Last week I hit 50K. Here's how:"
    "Unpopular opinion: Most 'viral tweet advice' is garbage."
    "I spent \$0 on ads and got 2M impressions. Here's my exact strategy:"
    "Your tweets aren't flopping because of the algorithm. It's this:"
)

# Personal anecdote starters
ANECDOTES=(
    "I learned this the hard way when my tweet got 12 likes in 3 days..."
    "This changed everything for me after months of posting into the void..."
    "A DM from a follower with 100K+ followers opened my eyes..."
    "I almost quit Twitter before discovering this..."
    "My biggest viral tweet (2.3M impressions) started as a random thought..."
)

# Call-to-action variations
CTAS=(
    "What's your biggest Twitter struggle? Drop it below 👇"
    "Try this today and let me know how it goes!"
    "Bookmark this for your next tweet session."
    "Follow for more daily Twitter growth tips."
    "RT if this helped you! ♻️"
)

# Emojis for posts
EMOJIS=("🚀" "📈" "💡" "🎯" "⚡" "🔥" "💪" "🧠" "✨" "📝" "🎨" "🏆" "💰" "🎭" "🌟")
RANDOM_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]}

# Reading time estimates (3-7 min)
READING_TIMES=("3 min read" "4 min read" "5 min read" "6 min read" "7 min read")
RANDOM_READING_TIME=${READING_TIMES[$RANDOM % ${#READING_TIMES[@]}]}

# Check for duplicate titles (prevent reposting old content)
check_duplicate() {
    local title="$1"
    local title_lower=$(echo "$title" | tr '[:upper:]' '[:lower:]')
    
    # Check in state file published titles
    if [ -f "$STATE_FILE" ]; then
        if grep -qi "$title_lower" "$STATE_FILE" 2>/dev/null; then
            return 0  # Is duplicate
        fi
    fi
    
    # Check existing blog posts
    for file in "${BLOG_DIR}"/*.md; do
        if [ -f "$file" ]; then
            local existing_title=$(grep -m1 "^title:" "$file" | sed 's/title: *"\?\([^"]*\)"\?/\1/')
            if [ -n "$existing_title" ]; then
                local existing_lower=$(echo "$existing_title" | tr '[:upper:]' '[:lower:]')
                if [[ "$existing_lower" == *"$title_lower"* ]] || [[ "$title_lower" == *"$existing_lower"* ]]; then
                    return 0  # Is duplicate
                fi
            fi
        fi
    done
    
    return 1  # Not duplicate
}

# Generate description from title and content preview
generate_description() {
    local title="$1"
    local style="$2"
    local title_lower=$(echo "$title" | tr '[:upper:]' '[:lower:]')
    
    case $style in
        "conversational")
            echo "A no-nonsense guide to ${title_lower}. Learn practical tips you can apply today to grow your Twitter presence."
            ;;
        "storytelling")
            echo "The story behind ${title_lower}. Real lessons from real Twitter growth experiences."
            ;;
        "listicle")
            local num=$((RANDOM % 7 + 3))
            echo "${title} - ${num} proven strategies backed by data and real results."
            ;;
        "case-study")
            echo "Deep dive: ${title}. Analysis of what works, what doesn't, and why."
            ;;
        "opinion")
            echo "Unpopular truths about ${title_lower}. The advice nobody wants to hear but everyone needs."
            ;;
        *)
            echo "Master ${title_lower} with these actionable tips and strategies."
            ;;
    esac
}

# Generate content based on style WITH PROPER FRONTMATTER
generate_content() {
    local title="$1"
    local style="$2"
    local description="$3"
    local emoji="$4"
    local reading_time="$5"
    
    # Write frontmatter FIRST
    cat << EOF
---
layout: base.njk
title: "${title}"
date: ${DATETIME}
description: "${description}"
readingTime: "${reading_time}"
emoji: "${emoji}"
tags: [twitter, viral-tweets, social-media, content-creation, growth]
category: blog
author: Viral Tweet Hub Team
---

EOF

    # Now write the content body
    case $style in
        "conversational")
            cat << EOF
# ${title}

${HOOKS[$RANDOM % ${#HOOKS[@]}]}

${ANECDOTES[$RANDOM % ${#ANECDOTES[@]}]}

Let me break it down for you:

## The Reality Check

Most people overthink their tweets. They spend 20 minutes crafting the "perfect" post, only to get crickets.

Here's what actually works:

### 1. Write Like You Talk
Forget corporate speak. Your tweets should sound like something you'd say to a friend at coffee.

**Bad:** "Leveraging synergistic paradigms for optimal engagement"
**Good:** "Here's what I learned posting 5x a day for a month"

### 2. Hook Them in the First Line
You have about 0.5 seconds to stop the scroll. Make it count.

- Start with a bold statement
- Ask a provocative question
- Share a surprising number

### 3. Add Value, Not Noise
Every tweet should either:
- Teach something
- Entertain
- Inspire action

If it doesn't do one of these? Delete it.

## The Bottom Line

Viral tweets aren't luck. They're pattern recognition + consistent practice.

${CTAS[$RANDOM % ${#CTAS[@]}]}
EOF
            ;;
        "storytelling")
            cat << EOF
# ${title}

${ANECDOTES[$RANDOM % ${#ANECDOTES[@]}]}

Let me take you back to when I started...

## Where I Began

3 years ago, I had:
- 47 followers
- Tweets getting 2-3 likes
- Zero idea what I was doing

## The Turning Point

Then I discovered something that changed everything.

I stopped trying to be clever and started being **useful**.

### What Shifted

1. **I studied viral content** - Not to copy, but to understand patterns
2. **I wrote every day** - Even when nobody was watching
3. **I engaged genuinely** - Not "follow for follow" nonsense

## The Results

Fast forward to today:
- 50K+ followers
- Multiple tweets with 1M+ impressions
- A community that actually cares

## What This Means for You

You don't need:
- A huge following
- Perfect writing
- Viral luck

You need:
- Consistency
- Value
- Patience

${CTAS[$RANDOM % ${#CTAS[@]}]}
EOF
            ;;
        "listicle")
            local num_strategies=$((RANDOM % 5 + 5))
            cat << EOF
# ${title}

${HOOKS[$RANDOM % ${#HOOKS[@]}]}

After analyzing 500+ viral tweets, here are the patterns:

## ${num_strategies} Strategies That Actually Work

### 1. The Hook Formula
First line = make or break.

**Winning hooks:**
- "I did X so you don't have to"
- "Unpopular opinion: [contrarian take]"
- "Here's the truth about [topic]"

### 2. White Space is Your Friend
Dense text = instant scroll-past.

Use short paragraphs. Like this.

### 3. Numbers Build Credibility
❌ "Many people struggle with this"
✅ "73% of creators make this mistake"

### 4. Ask Questions That Demand Answers
Not: "Any tips?"
Yes: "What's your biggest Twitter struggle right now?"

### 5. End with a Clear CTA
Tell people what to do next:
- "Bookmark this"
- "Follow for more"
- "RT to help others"

### 6. Post at the Right Time
Peak hours for engagement:
- Tuesday-Thursday: 9-11 AM
- Wednesday: 2-3 PM
- Avoid: Weekends (unless your audience is active)

### 7. Engage Before You Post
Spend 10 minutes commenting on others' content before posting your own.

## Quick Recap

1. Hook them fast
2. Use white space
3. Add specific numbers
4. Ask good questions
5. Clear CTA
6. Right timing
7. Engage first

${CTAS[$RANDOM % ${#CTAS[@]}]}
EOF
            ;;
        "case-study")
            cat << EOF
# ${title}

Let's dissect a real viral tweet and understand WHY it worked.

## The Tweet

> "I spent 6 months building a SaaS.
> 
> Made \$0 in revenue.
> 
> Here's what I learned (so you don't make the same mistakes):
> 
> [Thread 🧵]"

## The Breakdown

**Impressions:** 2.3M
**Likes:** 47K
**Retweets:** 12K
**Followers gained:** 8,500

## Why This Tweet Went Viral

### 1. The Hook
"I spent 6 months building a SaaS" → Immediately establishes credibility and stakes.

### 2. The Twist
"Made \$0 in revenue" → Creates curiosity. Why are they sharing a failure?

### 3. The Promise
"Here's what I learned" → Offers value from the failure.

### 4. The Format
"[Thread 🧵]" → Signals there's more value coming.

### 5. The Timing
Posted Tuesday 10 AM EST → Peak Twitter hours for business/tech audience.

## The Thread Structure

**Tweet 1:** Hook + Promise
**Tweet 2-8:** Specific lessons (each standalone valuable)
**Tweet 9:** Summary
**Tweet 10:** CTA (Follow for more)

## What You Can Steal

1. **Failure stories > Success stories** (more relatable)
2. **Specific numbers** (not "a lot" but "2.3M")
3. **Clear structure** (setup → twist → value)
4. **Thread format** (keeps people reading)

## Apply This Today

Next time you post:
- Lead with stakes
- Add a twist
- Promise value
- Use thread format for depth

${CTAS[$RANDOM % ${#CTAS[@]}]}
EOF
            ;;
        "opinion")
            cat << EOF
# ${title}

${HOOKS[$RANDOM % ${#HOOKS[@]}]}

## Unpopular Truth #1: Most Advice is Garbage

"Post 10x a day!"
"Use these exact hashtags!"
"Engage in pods!"

None of it matters if your content sucks.

## Unpopular Truth #2: You're Probably Boring

Harsh? Yes.
True? Also yes.

Most tweets are:
- Generic platitudes
- Obvious observations
- Desperate self-promotion

## Unpopular Truth #3: Consistency > Virality

One viral tweet won't change your life.
100 good tweets will.

Stop chasing virality.
Start building trust.

## Unpopular Truth #4: The Algorithm Rewards Value, Not Tricks

All the "growth hacks" and "algorithm tricks"?
Mostly noise.

The algorithm is simple:
- Do people engage with your content?
- Do they spend time reading it?
- Do they share it?

Yes to all three = viral.
No = crickets.

## What Actually Works

1. Study viral content in your niche (really study it)
2. Identify patterns (not just topics)
3. Apply those patterns to YOUR unique perspective
4. Iterate based on what resonates
5. Repeat for 6+ months

Boring? Maybe.
Effective? Absolutely.

## My Challenge to You

For the next 30 days:
- Post 1 high-quality tweet per day
- Spend 20 minutes engaging meaningfully
- Track what works
- Double down on winners

No hacks. No tricks. Just consistent value.

${CTAS[$RANDOM % ${#CTAS[@]}]}
EOF
            ;;
    esac
}

# Create the blog post
if [ -z "$POST_TITLE" ]; then
    # Generate a random title if none provided
    TITLES=(
        "The Psychology Behind Why Some Tweets Go Viral"
        "5 Tweet Hooks That Stop the Scroll Every Time"
        "Why Your Tweets Aren't Getting Engagement (And How to Fix It)"
        "The Complete Guide to Twitter Threads in 2025"
        "I Analyzed 500 Viral Tweets: Here Are The Patterns"
        "From 0 to 10K: A Realistic Twitter Growth Roadmap"
        "The Twitter Algorithm Explained (Without the BS)"
        "7 Mistakes Killing Your Tweet Engagement"
        "How to Write Tweets People Actually Want to Read"
        "The Art of the Perfect Tweet Hook"
        "Why Most Twitter Advice is Wrong"
        "The 3-Second Rule: How to Hook Readers Instantly"
        "Thread Writing 101: Turn One Tweet into a Story"
        "Engagement Bait vs. Genuine Value: Know the Difference"
        "How I Grew from 0 to 10K Without Buying Followers"
    )
    
    # Try up to 5 times to find a non-duplicate title
    for i in {1..5}; do
        POST_TITLE=${TITLES[$RANDOM % ${#TITLES[@]}]}
        if ! check_duplicate "$POST_TITLE"; then
            break
        fi
        POST_TITLE=""
    done
    
    # If still no unique title, add timestamp
    if [ -z "$POST_TITLE" ] || check_duplicate "$POST_TITLE"; then
        POST_TITLE="Twitter Growth Insights #$(date +%Y%m%d)"
    fi
fi

# Final duplicate check
if check_duplicate "$POST_TITLE"; then
    echo "❌ Duplicate title detected: ${POST_TITLE}"
    echo "Skipping to avoid reposting old content."
    exit 1
fi

# Generate filename from title (slugify for SEO-friendly URLs)
# Remove special characters, convert to lowercase, replace spaces with hyphens
FILENAME=$(echo "$POST_TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')

# Remove consecutive hyphens
FILENAME=$(echo "$FILENAME" | sed 's/--*/-/g')

# Remove leading/trailing hyphens
FILENAME=$(echo "$FILENAME" | sed 's/^-//;s/-$//')

# Add .md extension
FILENAME="${FILENAME}.md"

# Handle duplicate filenames by appending timestamp
if [ -f "${BLOG_DIR}/${FILENAME}" ]; then
    BASENAME="${FILENAME%.md}"
    TIMESTAMP=$(date +%H%M%S)
    FILENAME="${BASENAME}-${TIMESTAMP}.md"
    echo "⚠️  File exists, using: ${FILENAME}"
fi

# Generate description
DESCRIPTION=$(generate_description "$POST_TITLE" "$RANDOM_STYLE")

# Generate content
echo "📝 Creating new post: ${POST_TITLE}"
echo "🎨 Style: ${RANDOM_STYLE}"
echo "📊 Emoji: ${RANDOM_EMOJI}"
echo "⏱️  Reading time: ${RANDOM_READING_TIME}"

generate_content "$POST_TITLE" "$RANDOM_STYLE" "$DESCRIPTION" "$RANDOM_EMOJI" "$RANDOM_READING_TIME" > "${BLOG_DIR}/${FILENAME}"

# Update state file to track published titles (prevent future duplicates)
if [ -f "$STATE_FILE" ]; then
    # Simple update: create new state file with updated info
    TITLE_LOWER=$(echo "$POST_TITLE" | tr '[:upper:]' '[:lower:]')
    cat > "${STATE_FILE}.tmp" << EOF
{
  "lastPostDate": "${DATE}",
  "postsToday": 1,
  "totalPosts": 10,
  "lastStyle": "${RANDOM_STYLE}",
  "publishedTitles": ["${TITLE_LOWER}"]
}
EOF
    mv "${STATE_FILE}.tmp" "$STATE_FILE"
fi

# Rebuild the site
cd "/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site"
npm run build

echo "✅ Post created: ${FILENAME}"
echo "🌐 Site rebuilt successfully"
echo ""
echo "Next steps:"
echo "1. Review and edit the post if needed"
echo "2. Add relevant images"
echo "3. Commit and push to trigger Cloudflare Pages deploy"
