---
layout: base.njk
title: Home
description: Master the art of writing viral tweets on X (Twitter). Learn proven strategies, tips, and techniques to grow your audience and create content that resonates.
---

<!-- Hero Section -->
<section class="hero">
  <div class="container">
    <div class="hero-content">
      <h1>Write Tweets That Go Viral</h1>
      <p>Learn the proven strategies, psychology, and techniques behind viral content on X (Twitter). Grow your audience and make an impact.</p>
      <div class="hero-cta">
        <a href="/tips/" class="btn btn-primary">Get Started</a>
        <a href="/blog/" class="btn btn-secondary">Read Blog</a>
      </div>
    </div>
  </div>
</section>

<!-- Ad Slot - Top -->
<div class="container">
  <div class="ad-slot ad-slot-top">
    <div>
      <p class="ad-label">Advertisement</p>
      <p>Google AdSense - Leaderboard (970x90)</p>
    </div>
  </div>
</div>

<!-- Features Section -->
<section class="section">
  <div class="container">
    <div class="section-title">
      <h2>Why Learn Viral Tweet Writing?</h2>
      <p>Twitter is one of the most powerful platforms for building influence, sharing ideas, and growing your personal brand.</p>
    </div>
    
    <div class="feature-grid">
      <div class="feature-card">
        <div class="feature-icon">📈</div>
        <h3>Grow Your Audience</h3>
        <p>Learn how to attract engaged followers who genuinely care about your content and message.</p>
      </div>
      
      <div class="feature-card">
        <div class="feature-icon">💡</div>
        <h3>Share Your Ideas</h3>
        <p>Amplify your voice and reach millions with content that resonates and gets shared.</p>
      </div>
      
      <div class="feature-card">
        <div class="feature-icon">🎯</div>
        <h3>Build Authority</h3>
        <p>Establish yourself as a thought leader in your niche with consistent viral content.</p>
      </div>
      
      <div class="feature-card">
        <div class="feature-icon">💰</div>
        <h3>Monetize Your Presence</h3>
        <p>Turn your Twitter following into income through sponsorships, products, and services.</p>
      </div>
      
      <div class="feature-card">
        <div class="feature-icon">🔥</div>
        <h3>Master the Algorithm</h3>
        <p>Understand how Twitter's algorithm works and optimize your content for maximum reach.</p>
      </div>
      
      <div class="feature-card">
        <div class="feature-icon">✍️</div>
        <h3>Perfect Your Craft</h3>
        <p>Develop your unique voice and writing style that stands out in a crowded feed.</p>
      </div>
    </div>
  </div>
</section>

<!-- Latest Blog Posts -->
<section class="section section-light">
  <div class="container">
    <div class="section-title">
      <h2>Latest from the Blog</h2>
      <p>Fresh insights and strategies for writing viral tweets, updated regularly.</p>
    </div>
    
    <div class="blog-grid">
      {% for post in collections.posts %}
      <article class="blog-card">
        <div class="blog-card-image">🚀</div>
        <div class="blog-card-content">
          <div class="blog-card-meta">
            <span>{{ post.date | dateFormat }}</span>
            <span>•</span>
            <span>{{ post.data.readingTime or '5 min' }} read</span>
          </div>
          <h3>{{ post.data.title }}</h3>
          <p>{{ post.data.description }}</p>
          <a href="{{ post.url }}" class="blog-card-link">
            Read More
            <span>→</span>
          </a>
        </div>
      </article>
      {% endfor %}
    </div>
    
    <div style="text-align: center; margin-top: var(--spacing-2xl);">
      <a href="/blog/" class="btn btn-primary">View All Posts</a>
    </div>
  </div>
</section>

<!-- Ad Slot - Middle -->
<div class="container">
  <div class="ad-slot">
    <div>
      <p class="ad-label">Advertisement</p>
      <p>Google AdSense - Responsive Ad</p>
    </div>
  </div>
</div>

<!-- CTA Section -->
<section class="section" style="background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-dark) 100%); color: var(--color-white);">
  <div class="container">
    <div class="section-title">
      <h2 style="color: var(--color-white);">Ready to Go Viral?</h2>
      <p style="color: var(--color-gray-100);">Start implementing these strategies today and watch your Twitter presence explode.</p>
    </div>
    
    <div style="text-align: center;">
      <a href="/tips/" class="btn btn-primary">Explore Tips</a>
      <a href="/contact/" class="btn btn-secondary" style="margin-left: var(--spacing-md);">Get in Touch</a>
    </div>
  </div>
</section>

<!-- Schema.org ArticleList for Homepage -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "ItemList",
  "itemListElement": [
    {% for post in collections.posts | slice(0, 3) %}
    {
      "@type": "ListItem",
      "position": {{ loop.index }},
      "url": "{{ site.url }}{{ post.url }}"
    }{% if not loop.last %},{% endif %}
    {% endfor %}
  ]
}
</script>
