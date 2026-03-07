#!/usr/bin/env python3
from PIL import Image, ImageDraw

def create_fire_favicon(size, filename):
    """Create a simplified fire tweet favicon"""
    
    # Create image with transparent background
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Colors
    orange_start = (249, 115, 22, 255)  # #f97316
    orange_end = (234, 88, 12, 255)    # #ea580c
    yellow_light = (254, 243, 199, 255)  # #fef3c7
    yellow = (251, 191, 36, 255)  # #fbbf24
    white = (255, 255, 255, 255)
    
    # Background circle (orange gradient effect - use solid color)
    margin = size // 16
    draw.ellipse([margin, margin, size - margin, size - margin], fill=orange_start)
    
    # Fire shape (simplified - flame from bottom)
    cx, cy = size // 2, size // 2
    flame_base = size // 4
    
    # Outer flame
    flame_points = [
        (cx, cy - flame_base),  # top
        (cx + flame_base, cy),  # right
        (cx, cy + flame_base),  # bottom
        (cx - flame_base, cy),  # left
    ]
    draw.polygon(flame_points, fill=yellow_light)
    
    # Middle flame
    mid_flame = flame_base * 3 // 4
    mid_points = [
        (cx, cy - mid_flame),
        (cx + mid_flame, cy),
        (cx, cy + mid_flame),
        (cx - mid_flame, cy),
    ]
    draw.polygon(mid_points, fill=yellow)
    
    # Inner flame
    inner_flame = flame_base // 2
    inner_points = [
        (cx, cy - inner_flame),
        (cx + inner_flame, cy),
        (cx, cy + inner_flame),
        (cx - inner_flame, cy),
    ]
    draw.polygon(inner_points, fill=orange_start)
    
    # Small particles (sparks)
    spark_radius = max(2, size // 16)
    draw.ellipse([cx - flame_base - spark_radius, cy - spark_radius, 
                  cx - flame_base + spark_radius, cy + spark_radius], fill=yellow_light)
    draw.ellipse([cx + flame_base - spark_radius, cy + spark_radius * 2, 
                  cx + flame_base + spark_radius, cy + spark_radius * 3], fill=yellow_light)
    
    # Save
    img.save(filename, 'PNG')
    print(f"✅ Created: {filename} ({size}x{size})")

# Create all sizes
sizes = [
    (16, 'assets/favicon-16x16.png'),
    (32, 'assets/favicon-32x32.png'),
    (180, 'assets/apple-touch-icon.png'),
    (512, 'assets/favicon-512x512.png'),
]

print("🎨 Creating PNG favicons (Design #4: Fire Tweet)...")
for size, filename in sizes:
    create_fire_favicon(size, filename)

print("\n🎉 All favicon formats created!")
