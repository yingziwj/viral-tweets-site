# Deployment Guide - Viral Tweet Hub

## 🚀 Quick Deploy to Cloudflare Pages

### Step 1: Push to GitHub

```bash
cd "/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site"

# Initialize Git (already done)
git init

# Add Cloudflare Pages domain to site config
# Edit src/_data/site.json and update:
# "url": "https://viraltweethub.pages.dev"

# Create GitHub repository
# Go to github.com/new and create: viral-tweets-site

# Push code
git remote add origin https://github.com/YOUR_USERNAME/viral-tweets-site.git
git branch -M main
git push -u origin main
```

### Step 2: Connect to Cloudflare Pages

1. **Go to Cloudflare Pages:**
   - Visit: https://pages.cloudflare.com
   - Sign in / Create account (free)

2. **Create New Project:**
   - Click "Create a project"
   - Select "Connect to Git"
   - Choose your GitHub account
   - Select repository: `viral-tweets-site`

3. **Configure Build Settings:**
   - **Framework preset:** `None` (or select `Eleventy` if available)
   - **Build command:** `npm run build`
   - **Build output directory:** `_site`
   - **Root directory:** `/` (default)

4. **Environment Variables (optional):**
   - `NODE_VERSION:` `18` (or latest LTS)

5. **Deploy:**
   - Click "Save and Deploy"
   - Wait for build to complete (~1-2 minutes)

### Step 3: Your Site is Live!

Your site will be available at:
```
https://viral-tweets-site-xxxx.pages.dev
```

### Step 4: Customize Domain (Optional)

To use `viraltweethub.pages.dev`:

1. Go to Cloudflare Pages dashboard
2. Select your project
3. Go to "Custom domains"
4. Click "Add custom domain"
5. Enter: `viraltweethub.pages.dev`
6. Follow DNS configuration steps

---

## 📅 Automated Content Schedule

Cron jobs are configured to publish 3 times daily (Beijing Time):

| Time | Slot | Cron |
|------|------|------|
| 9:30 AM | Morning | `30 9 * * *` |
| 2:30 PM | Afternoon | `30 14 * * *` |
| 8:30 PM | Evening | `30 20 * * *` |

**Sundays:** Content review day (no new posts)

### Manage Content Generation

```bash
# Check status
./content-scheduler.sh status

# Force generate a post
./content-scheduler.sh force

# View logs
tail -f cron-log.txt
```

---

## 📊 Google AdSense Setup

### Prerequisites Checklist

- [ ] 10+ quality blog posts published
- [ ] 2+ weeks of consistent content
- [ ] Privacy Policy page ✅ (already created)
- [ ] Terms of Service page ✅ (already created)
- [ ] Contact page ✅ (already created)
- [ ] Original, valuable content ✅

### Application Steps

1. **Go to Google AdSense:**
   - Visit: https://adsense.google.com
   - Sign in with Google account

2. **Add Your Site:**
   - Enter URL: `https://viraltweethub.pages.dev`
   - Select language: English

3. **Add AdSense Code:**
   - Copy the verification code
   - Edit `src/_includes/base.njk`
   - Paste code in `<head>` section
   - Rebuild and redeploy

4. **Wait for Approval:**
   - Review time: 1-3 days (sometimes up to 2 weeks)
   - Check email for status updates

5. **Once Approved:**
   - Enable auto ads OR
   - Place ad units manually (already have placeholders)

### Ad Placement (Already Configured)

- Header banner (728x90)
- Between content sections
- Sidebar (if applicable)
- In-article ads

---

## 🔧 Maintenance

### Daily Tasks (Automated)
- ✅ Content generation (3x/day)
- ✅ Site rebuild
- ✅ Activity logging

### Weekly Tasks (Manual)
- [ ] Review generated content quality
- [ ] Edit/improve top-performing posts
- [ ] Check analytics (Cloudflare Pages → Analytics)
- [ ] Engage with comments (if enabled)

### Monthly Tasks
- [ ] Review AdSense earnings
- [ ] Analyze top traffic sources
- [ ] Plan content themes for next month
- [ ] Update outdated posts

---

## 📝 Troubleshooting

### Cron Jobs Not Running?

```bash
# Check cron status
crontab -l

# Check cron logs
grep CRON /var/log/system.log | tail -20

# Test script manually
./cron-generate-content.sh
```

### Build Fails?

```bash
# Check Node.js version
node --version  # Should be 16+

# Reinstall dependencies
rm -rf node_modules package-lock.json
npm install

# Rebuild
npm run build
```

### Cloudflare Deploy Fails?

1. Check build logs in Cloudflare Pages dashboard
2. Verify build command: `npm run build`
3. Verify output directory: `_site`
4. Check for Node.js version mismatch

---

## 📞 Support

- **Cloudflare Pages Docs:** https://developers.cloudflare.com/pages/
- **Eleventy Docs:** https://www.11ty.dev/docs/
- **AdSense Help:** https://support.google.com/adsense

---

_Last updated: 2026-03-05_
