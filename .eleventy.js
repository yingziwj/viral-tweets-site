const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");

module.exports = function(eleventyConfig) {
  // Add syntax highlighting
  eleventyConfig.addPlugin(syntaxHighlight);
  
  // Pass through static assets
  eleventyConfig.addPassthroughCopy("src/css");
  eleventyConfig.addPassthroughCopy("src/js");
  eleventyConfig.addPassthroughCopy("src/images");
  eleventyConfig.addPassthroughCopy("src/favicon.ico");
  eleventyConfig.addPassthroughCopy("src/ads.txt");
  eleventyConfig.addPassthroughCopy("src/_redirects");
  eleventyConfig.addPassthroughCopy("assets/favicon.svg");
  eleventyConfig.addPassthroughCopy("assets/favicon-16x16.png");
  eleventyConfig.addPassthroughCopy("assets/favicon-32x32.png");
  eleventyConfig.addPassthroughCopy("assets/favicon-512x512.png");
  eleventyConfig.addPassthroughCopy("assets/apple-touch-icon.png");
  
  // Create collections for blog posts
  eleventyConfig.addCollection("posts", function(collectionApi) {
    return collectionApi
      .getFilteredByGlob("src/blog/*.md")
      .filter((post) => !post.data.draft)
      .sort((a, b) => {
        return new Date(b.date) - new Date(a.date);
      });
  });
  
  // Date filter
  eleventyConfig.addFilter("dateFormat", function(date) {
    return new Date(date).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  });

  eleventyConfig.addFilter("htmlDateString", function(date) {
    return new Date(date).toISOString().split("T")[0];
  });
  
  // Excerpt filter
  eleventyConfig.addFilter("excerpt", function(content) {
    if (!content) return "";
    const plainText = content.replace(/<[^>]*>/g, '');
    return plainText.substring(0, 160) + "...";
  });
  
  // Slice filter for arrays
  eleventyConfig.addFilter("slice", function(arr, start, end) {
    if (!arr) return [];
    return arr.slice(start, end);
  });

  // Related posts filter - score by tag overlap
  eleventyConfig.addFilter("relatedPosts", function(posts, currentTags, currentUrl, limit) {
    if (limit === undefined) limit = 4;
    if (!Array.isArray(currentTags) || currentTags.length === 0) return [];
    var scored = [];
    for (var i = 0; i < posts.length; i++) {
      var p = posts[i];
      if (p.url === currentUrl) continue;
      var postTags = p.data.tags || [];
      var overlap = 0;
      for (var j = 0; j < postTags.length; j++) {
        if (currentTags.indexOf(postTags[j]) !== -1) overlap++;
      }
      if (overlap > 0) {
        scored.push({ post: p, score: overlap });
      }
    }
    scored.sort(function(a, b) { return b.score - a.score; });
    return scored.slice(0, limit).map(function(s) { return s.post; });
  });

  // RSS date filter (RFC 2822)
  eleventyConfig.addFilter("rssDate", function(date) {
    if (!date) return "";
    return new Date(date).toUTCString();
  });
  
  return {
    dir: {
      input: "src",
      output: "_site",
      includes: "_includes",
      data: "_data"
    },
    templateFormats: ["md", "njk", "html", "liquid"],
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk"
  };
};
