#!/bin/bash
set -e  # Exit on error

echo "=================="

# Configure Git
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# Run the Python script
python3 /usr/bin/feed.py

# Commit and push changes
git add -A
git commit -m "Update Feed"
git push --set-upstream origin main

echo "=================="
