const fs = require('fs');
const { execSync } = require('child_process');

// Read SVG
const svgContent = fs.readFileSync('assets/favicon.svg', 'utf8');

// Create different sizes
const sizes = [16, 32, 180]; // 16x16, 32x32, 180x180 (apple touch icon)

console.log('🎨 Converting SVG to PNG formats...');
console.log('SVG content loaded:', svgContent.length, 'bytes');

// For now, just copy SVG as the main favicon
// Modern browsers support SVG favicons
console.log('✅ SVG favicon ready at: assets/favicon.svg');

// Create a simple HTML preview
const preview = `
<!DOCTYPE html>
<html>
<head>
  <title>Favicon Preview</title>
  <link rel="icon" type="image/svg+xml" href="favicon.svg">
  <style>
    body { 
      font-family: system-ui; 
      display: flex; 
      justify-content: center; 
      align-items: center; 
      min-height: 100vh;
      background: linear-gradient(135deg, #f97316 0%, #ea580c 100%);
      margin: 0;
    }
    .preview {
      background: white;
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 20px 60px rgba(0,0,0,0.3);
      text-align: center;
    }
    img {
      width: 128px;
      height: 128px;
      margin: 20px 0;
    }
    h1 { color: #1a1a1a; margin: 0; }
    p { color: #666; }
  </style>
</head>
<body>
  <div class="preview">
    <h1>🔥 Favicon Preview</h1>
    <img src="favicon.svg" alt="Favicon">
    <p>Design #4: Fire Tweet</p>
  </div>
</body>
</html>
`;

fs.writeFileSync('assets/favicon-preview.html', preview);
console.log('✅ Preview created at: assets/favicon-preview.html');

console.log('\n📋 Next steps:');
console.log('1. Copy favicon.svg to assets/');
console.log('2. Update base.njk with favicon links');
console.log('3. Build and deploy');
