#!/bin/bash

# Daily Content Generator for Viral Tweet Hub
# Creates human-like content with varied writing styles to avoid AI detection

POST_TITLE="$1"
DATE=$(date +"%Y-%m-%d")
BLOG_DIR="/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site/src/blog"

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
    "I spent $0 on ads and got 2M impressions. Here's my exact strategy:"
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

# Generate content based on style
generate_content() {
    local title="$1"
    local style="$2"
    
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

---
*Published: ${DATE}*
*Reading time: 3 min*
EOF
            ;;
        "storytelling")
            cat << EOF
# ${title}

Let me tell you a story.

${ANECDOTES[$RANDOM % ${#ANECDOTES[@]}]}

## The Beginning

I was exactly where you are now. Posting daily. Getting nowhere. Wondering if I should just give up.

Then something changed.

## The Turning Point

I started analyzing every viral tweet in my niche. Not just skimming—really studying them.

Here's the pattern I noticed:

### Pattern #1: Specificity Wins
Vague: "Work hard and succeed"
Specific: "I wrote 500 words every morning at 6 AM for 90 days. Here's what happened."

### Pattern #2: Vulnerability Connects
People don't want perfect. They want real.
Share your failures, not just wins.

### Pattern #3: Timing Matters (But Not How You Think)
It's not about posting at "peak hours."
It's about posting when YOUR audience is active.

## What I Did Next

I implemented these three patterns consistently for 30 days.

Results:
- 1 tweet hit 500K impressions
- Gained 3,200 followers
- Got my first brand deal ($500)

## Your Turn

You don't need to copy me. Just apply the patterns to YOUR story.

${CTAS[$RANDOM % ${#CTAS[@]}]}

---
*Published: ${DATE}*
*Reading time: 4 min*
EOF
            ;;
        "listicle")
            cat << EOF
# ${title}

${HOOKS[$RANDOM % ${#HOOKS[@]}]}

After analyzing hundreds of viral tweets, I've identified the key patterns.

Here are ${RANDOM % 5 + 5} actionable tips you can use TODAY:

## ${RANDOM % 5 + 5} Tips for Viral Tweets

### 1. The 3-Second Rule
If your first line doesn't grab attention in 3 seconds, rewrite it.
Period.

### 2. Use Numbers (But Make Them Specific)
❌ "Lots of people do this"
✅ "73% of top creators do this daily"

### 3. White Space is Your Friend
Dense text = scroll past
Clean formatting = read through

### 4. Ask Questions That Demand Answers
"Not many know this" → "What's the one Twitter mistake you keep making?"

### 5. Thread Structure Matters
Hook → Value → Value → Value → CTA
That's the formula.

### 6. Engage Before You Post
Comment on 5 big accounts before posting your tweet.
Algorithm loves active users.

### 7. Repurpose Your Winners
That tweet that did well 3 months ago?
Rewrite it. Post it again. Different angle.

### 8. Use Visuals Strategically
Tweets with images get 150% more retweets.
But only if they add value.

### 9. Reply to Comments (First Hour)
The first hour after posting is CRITICAL.
Reply to every comment. Boosts engagement.

### 10. Study Your Analytics
Check what worked. Do more of that.
Stop what didn't. Simple.

## Quick Summary

1. Hook them fast
2. Be specific with numbers
3. Format for readability
4. Ask engaging questions
5. Structure your threads
6. Engage before posting
7. Repurpose winners
8. Add relevant visuals
9. Reply quickly
10. Track and iterate

${CTAS[$RANDOM % ${#CTAS[@]}]}

---
*Published: ${DATE}*
*Reading time: 5 min*
EOF
            ;;
        "case-study")
            cat << EOF
# ${title}

## Case Study: How One Tweet Got 2.3M Impressions

Let's dissect a real viral tweet and understand WHY it worked.

### The Tweet

> "I spent 6 months building a SaaS.
> 
> $0 in revenue.
> 
> Here's what I learned (so you don't make the same mistakes):
> 
> [Thread 🧵]"

### The Breakdown

**Impressions:** 2.3M
**Likes:** 47K
**Retweets:** 12K
**Followers gained:** 8,500

## Why This Tweet Went Viral

### 1. The Hook
"I spent 6 months building a SaaS" → Immediately establishes credibility and stakes.

### 2. The Twist
"$0 in revenue" → Creates curiosity. Why are they sharing a failure?

### 3. The Promise
"Here's what I learned" → Offers value from the failure.

### 4. The Format
"[Thread 🧵]" → Signals there's more value coming.

### 5. The Timing
Posted Tuesday 10 AM EST → Peak Twitter hours for business/tech audience.

## The Thread Structure

Tweet 1: Hook + Promise
Tweet 2-8: Specific lessons (each standalone valuable)
Tweet 9: Summary
Tweet 10: CTA (Follow for more)

## What You Can Steal

1. **Failure stories > Success stories** (more relatable)
2. **Specific numbers build credibility** (6 months, $0, not "a while")
3. **Promise value upfront** (tell them what they'll learn)
4. **Thread format keeps people engaged** (more time on tweet = algorithm boost)

## Apply This Today

Take your best lesson and structure it the same way:

> "I [did something hard] for [specific time].
> 
> [Surprising result].
> 
> Here's what I learned:
> 
> [Thread 🧵]"

${CTAS[$RANDOM % ${#CTAS[@]}]}

---
*Published: ${DATE}*
*Reading time: 4 min*
EOF
            ;;
        "opinion")
            cat << EOF
# ${title}

${HOOKS[$RANDOM % ${#HOOKS[@]}]}

And I'm tired of pretending otherwise.

## The Hard Truth

Everyone's giving you the same recycled advice:

- "Post consistently"
- "Engage with your audience"
- "Use the right hashtags"

This advice isn't wrong. It's just... incomplete.

Here's what nobody's telling you:

### Truth #1: Consistency Without Strategy is Wasted Effort

Posting daily garbage for a year won't make you viral.
It'll just make you the person who posts daily garbage.

Quality > Quantity. Always.

### Truth #2: "Engagement" Doesn't Mean What You Think

Replying "great post!" on 100 tweets isn't engagement.
It's spam.

Real engagement:
- Thoughtful comments that add to the conversation
- Sharing with your unique perspective
- Building actual relationships

### Truth #3: Hashtags Are Dead (For Most People)

Unless you're a brand or have 100K+ followers, hashtags won't save you.

Focus on:
- Writing better hooks
- Creating shareable content
- Building genuine connections

### Truth #4: The Algorithm Rewards Value, Not Tricks

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

---
*Published: ${DATE}*
*Reading time: 5 min*
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
    )
    POST_TITLE=${TITLES[$RANDOM % ${#TITLES[@]}]}
fi

# Generate filename from title (handle both English and Chinese)
if echo "$POST_TITLE" | grep -q "[\u4e00-\u9fff]"; then
    # Chinese title - use timestamp
    FILENAME="post-$(date +%Y%m%d-%H%M%S).md"
else
    # English title - slugify
    FILENAME=$(echo "$POST_TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
    FILENAME="${FILENAME}.md"
fi

# Check if post already exists
if [ -f "${BLOG_DIR}/${FILENAME}" ]; then
    echo "❌ Post already exists: ${FILENAME}"
    exit 1
fi

# Generate content
echo "📝 Creating new post: ${POST_TITLE}"
echo "🎨 Style: ${RANDOM_STYLE}"

generate_content "$POST_TITLE" "$RANDOM_STYLE" > "${BLOG_DIR}/${FILENAME}"

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
