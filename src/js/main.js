/**
 * Viral Tweet Academy - Main JavaScript
 * Handles mobile menu, smooth scrolling, and interactive features
 */

document.addEventListener('DOMContentLoaded', function() {
  
  // Mobile Menu Toggle
  const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
  const navMenu = document.querySelector('.nav-menu');
  
  if (mobileMenuToggle && navMenu) {
    mobileMenuToggle.addEventListener('click', function() {
      navMenu.classList.toggle('active');
      this.setAttribute('aria-expanded', navMenu.classList.contains('active'));
    });
    
    // Close menu when clicking outside
    document.addEventListener('click', function(e) {
      if (!mobileMenuToggle.contains(e.target) && !navMenu.contains(e.target)) {
        navMenu.classList.remove('active');
        mobileMenuToggle.setAttribute('aria-expanded', 'false');
      }
    });
  }
  
  // Smooth scroll for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
      const href = this.getAttribute('href');
      if (href !== '#' && document.querySelector(href)) {
        e.preventDefault();
        document.querySelector(href).scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        });
      }
    });
  });
  
  // Newsletter form handling (placeholder)
  const newsletterForm = document.querySelector('.newsletter-form');
  if (newsletterForm) {
    newsletterForm.addEventListener('submit', function(e) {
      e.preventDefault();
      const email = this.querySelector('input[type="email"]').value;
      // TODO: Integrate with email service (Mailchimp, ConvertKit, etc.)
      alert('Thanks for subscribing! We\'ll send viral tweet tips to: ' + email);
      this.reset();
    });
  }
  
  // Lazy loading images (if needed)
  if ('loading' in HTMLImageElement.prototype) {
    const images = document.querySelectorAll('img[loading="lazy"]');
    images.forEach(img => {
      img.src = img.dataset.src;
    });
  } else {
    // Fallback for browsers that don't support lazy loading
    const script = document.createElement('script');
    script.src = 'https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.3.2/lazysizes.min.js';
    document.body.appendChild(script);
  }
  
  // Add scroll indicator to header
  const header = document.querySelector('.site-header');
  if (header) {
    window.addEventListener('scroll', function() {
      if (window.scrollY > 50) {
        header.style.boxShadow = '0 4px 6px rgba(0,0,0,0.1)';
      } else {
        header.style.boxShadow = '0 1px 2px rgba(0,0,0,0.05)';
      }
    });
  }
  
  // Copy to clipboard functionality for tweet examples
  document.querySelectorAll('.copy-tweet').forEach(button => {
    button.addEventListener('click', function() {
      const tweetText = this.closest('.tweet-example').querySelector('.tweet-text').textContent;
      navigator.clipboard.writeText(tweetText).then(() => {
        const originalText = this.textContent;
        this.textContent = 'Copied!';
        this.style.background = 'var(--color-success)';
        setTimeout(() => {
          this.textContent = originalText;
          this.style.background = '';
        }, 2000);
      });
    });
  });
  
  // Track outbound links (for analytics)
  document.querySelectorAll('a[href^="http"]').forEach(link => {
    link.addEventListener('click', function(e) {
      // TODO: Send to analytics
      console.log('Outbound link clicked:', this.href);
    });
  });
  
  // Share buttons functionality
  document.querySelectorAll('.share-button').forEach(button => {
    button.addEventListener('click', function() {
      const platform = this.dataset.platform;
      const url = encodeURIComponent(window.location.href);
      const title = encodeURIComponent(document.title);
      
      let shareUrl;
      switch(platform) {
        case 'twitter':
          shareUrl = `https://twitter.com/intent/tweet?url=${url}&text=${title}`;
          break;
        case 'facebook':
          shareUrl = `https://www.facebook.com/sharer/sharer.php?u=${url}`;
          break;
        case 'linkedin':
          shareUrl = `https://www.linkedin.com/shareArticle?mini=true&url=${url}&title=${title}`;
          break;
        default:
          return;
      }
      
      window.open(shareUrl, '_blank', 'width=600,height=400');
    });
  });
  
  // Reading progress bar (for blog posts)
  const createProgressBar = () => {
    const progressBar = document.createElement('div');
    progressBar.className = 'reading-progress';
    progressBar.style.cssText = `
      position: fixed;
      top: 0;
      left: 0;
      height: 3px;
      background: var(--color-primary);
      z-index: 1000;
      transition: width 0.1s ease;
    `;
    document.body.appendChild(progressBar);
    
    window.addEventListener('scroll', () => {
      const windowHeight = window.innerHeight;
      const documentHeight = document.documentElement.scrollHeight - windowHeight;
      const scrolled = window.scrollY;
      const progress = (scrolled / documentHeight) * 100;
      progressBar.style.width = `${progress}%`;
    });
  };
  
  // Only add progress bar on blog post pages
  if (document.querySelector('.post-content')) {
    createProgressBar();
  }
  
  // Table of contents for long posts
  const createTOC = () => {
    const postContent = document.querySelector('.post-content');
    if (!postContent) return;
    
    const headings = postContent.querySelectorAll('h2, h3');
    if (headings.length < 2) return;
    
    const toc = document.createElement('nav');
    toc.className = 'table-of-contents';
    toc.innerHTML = `
      <h4>Table of Contents</h4>
      <ul>
        ${Array.from(headings).map(h => `
          <li>
            <a href="#${h.id || h.textContent.toLowerCase().replace(/\s+/g, '-')}">
              ${h.textContent}
            </a>
          </li>
        `).join('')}
      </ul>
    `;
    
    toc.style.cssText = `
      background: var(--color-gray-50);
      padding: var(--spacing-lg);
      border-radius: var(--radius-md);
      margin-bottom: var(--spacing-xl);
    `;
    
    postContent.insertBefore(toc, postContent.firstChild);
  };
  
  createTOC();
  
  // Ad slot placeholder click handler (for development)
  document.querySelectorAll('.ad-slot').forEach(slot => {
    slot.addEventListener('click', function() {
      console.log('Ad slot clicked - integrate with AdSense');
    });
  });
  
  console.log('Viral Tweet Academy initialized');
});

// Service Worker registration for PWA (optional)
if ('serviceWorker' in navigator) {
  window.addEventListener('load', () => {
    // Uncomment to enable PWA
    // navigator.serviceWorker.register('/sw.js');
  });
}
