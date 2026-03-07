#!/usr/bin/env python3
from PIL import Image, ImageDraw
import cairosvg
import os

# SVG content for Design #4 (Fire Tweet)
svg_content = '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <defs>
    <linearGradient id="grad4" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#f97316;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#ea580c;stop-opacity:1" />
    </linearGradient>
  </defs>
  <circle cx="32" cy="32" r="30" fill="url(#grad4)"/>
  <path d="M32 8 Q38 20 32 32 Q26 20 32 8" fill="#fef3c7"/>
  <path d="M32 14 Q36 24 32 34 Q28 24 32 14" fill="#fbbf24"/>
  <path d="M32 20 Q35 28 32 36 Q29 28 32 20" fill="#f97316"/>
  <circle cx="32" cy="24" r="3" fill="#fff"/>
  <path d="M28 28 Q32 26 36 28 L34 32 Z" fill="#fff" opacity="0.8"/>
  <circle cx="24" cy="36" r="2" fill="#fef3c7" opacity="0.7"/>
  <circle cx="40" cy="38" r="2.5" fill="#fef3c7" opacity="0.6"/>
  <circle cx="28" cy="42" r="1.5" fill="#fef3c7" opacity="0.5"/>
  <circle cx="36" cy="44" r="2" fill="#fef3c7" opacity="0.6"/>
</svg>'''

sizes = [
    (16, 16, 'favicon-16x16.png'),
    (32, 32, 'favicon-32x32.png'),
    (180, 180, 'apple-touch-icon.png'),
    (512, 512, 'favicon-512x512.png')
]

print("🎨 Converting SVG to PNG formats...")

for width, height, filename in sizes:
    # Convert SVG to PNG using cairosvg
    png_data = cairosvg.svg2png(bytestring=svg_content.encode('utf-8'), output_width=width, output_height=height)
    
    # Save PNG
    filepath = f"assets/{filename}"
    with open(filepath, 'wb') as f:
        f.write(png_data)
    
    print(f"✅ Created: {filename} ({width}x{height})")

print("\n🎉 All favicon formats created successfully!")
print("\n📋 Files created:")
for _, _, filename in sizes:
    print(f"  - assets/{filename}")
