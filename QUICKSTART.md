# 🚀 Quick Start - Deploy Viral Tweet Hub

## Your Site Info
- **Name:** Viral Tweet Hub
- **Domain:** `viraltweethub.pages.dev`
- **Location:** `/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site`

---

## Step 1: Push to GitHub (5 minutes)

### Create GitHub Repository
1. Go to https://github.com/new
2. Repository name: `viral-tweets-site`
3. Make it **Public** (required for free Cloudflare Pages)
4. Click "Create repository"

### Push Your Code
Open Terminal and run:

```bash
cd "/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site"

# Replace YOUR_USERNAME with your GitHub username
git remote add origin https://github.com/YOUR_USERNAME/viral-tweets-site.git
git branch -M main
git push -u origin main
```

✅ Done! Your code is now on GitHub.

---

## Step 2: Deploy to Cloudflare Pages (5 minutes)

### Create Cloudflare Account
1. Go to https://pages.cloudflare.com
2. Sign up (free) with email or Google account

### Connect Your Repository
1. Click **"Create a project"**
2. Select **"Connect to Git"**
3. Click **"Authorize Cloudflare Pages"** to connect GitHub
4. Select your repository: `viral-tweets-site`
5. Click **"Begin setup"**

### Configure Build
| Setting | Value |
|---------|-------|
| Framework preset | `Eleventy` (or `None`) |
| Build command | `npm run build` |
| Build output directory | `_site` |
| Root directory | `/` |

### Deploy!
1. Click **"Save and Deploy"**
2. Wait 1-2 minutes for build
3. Your site will be live at: `https://viral-tweets-site-xxxx.pages.dev`

### Customize Domain Name
1. In Cloudflare Pages dashboard, select your project
2. Go to **"Custom domains"**
3. Click **"Add custom domain"**
4. Enter: `viraltweethub.pages.dev`
5. Cloudflare will configure DNS automatically

✅ Done! Your site is live at `https://viraltweethub.pages.dev`

---

## Step 3: Verify Automation (1 minute)

### Check Cron Jobs
```bash
crontab -l
```

You should see 3 scheduled posts per day:
- 9:30 AM (morning)
- 2:30 PM (afternoon)  
- 8:30 PM (evening)

### Test Content Generation
```bash
cd "/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site"
./content-scheduler.sh force
```

### Check Logs
```bash
tail -f cron-log.txt
```

---

## Step 4: Monitor & Maintain

### Daily (Automated ✅)
- 3 new posts generated automatically
- Site rebuilds automatically
- Logs written to `cron-log.txt`

### Weekly (Manual)
- Review content quality
- Check Cloudflare Analytics
- Edit top-performing posts

### AdSense Reminder ⚠️
- **Apply after:** 10+ posts AND 2 weeks of content
- **Target date:** March 19, 2026
- **Status:** Saved in MEMORY.md

---

## Need Help?

### Common Issues

**Build fails on Cloudflare?**
- Check build logs in Cloudflare dashboard
- Verify `npm run build` works locally

**Cron jobs not running?**
```bash
# Check cron is enabled
crontab -l

# Test manually
./cron-generate-content.sh
```

**Site not updating?**
- Push new changes to GitHub
- Cloudflare auto-deploys on push

---

## Success Checklist

- [ ] Code pushed to GitHub
- [ ] Cloudflare Pages project created
- [ ] Site builds successfully
- [ ] Custom domain configured (`viraltweethub.pages.dev`)
- [ ] Cron jobs verified
- [ ] First automated post generated
- [ ] Analytics enabled in Cloudflare

---

_Ready to go live? Start with Step 1!_
