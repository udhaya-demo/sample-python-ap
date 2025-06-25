#!/bin/bash
set -e

echo "Running cleanup before deployment..."

# Optional: stop any old containers
CONTAINER_ID=$(docker ps -q --filter "ancestor=udhayademo/simple-python-flask-app")
if [ ! -z "$CONTAINER_ID" ]; then
    echo "Stopping and removing existing container during cleanup..."
    docker stop "$CONTAINER_ID"
    docker rm "$CONTAINER_ID"
fi

# Optional: prune unused images
docker image prune -f

# ✅ Clean up existing deployment folder contents
echo "Cleaning up existing files in /home/ubuntu/sample-python-ap..."
rm -rf /home/ubuntu/sample-python-ap/*

# Also clean hidden files (like .git, .dockerignore) if any
rm -rf /home/ubuntu/sample-python-ap/.* 2>/dev/null || true

echo "Cleanup done."
