#!/bin/bash

# Cron wrapper for Viral Tweet Hub content generation
# This script is called by cron jobs to generate and publish content

# Set up environment
export PATH="/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin"
export NODE_PATH="/usr/local/lib/node_modules"

# Project directory
PROJECT_DIR="/Volumes/Extreme SSD/openclaw/webBot/viral-tweets-site"

# Log file
LOG_FILE="${PROJECT_DIR}/cron-log.txt"

# Timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Function to log messages
log() {
    echo "[${TIMESTAMP}] $1" >> "$LOG_FILE"
}

# Change to project directory
cd "$PROJECT_DIR" || {
    log "ERROR: Failed to change to project directory"
    exit 1
}

log "Starting content generation..."

# Run the content scheduler
./content-scheduler.sh run >> "$LOG_FILE" 2>&1

# Check exit status
if [ $? -eq 0 ]; then
    log "Content generation completed successfully"
else
    log "ERROR: Content generation failed"
fi

# Rebuild the site
log "Rebuilding site..."
npm run build >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    log "Site rebuild completed"
else
    log "ERROR: Site rebuild failed"
fi

log "---"
