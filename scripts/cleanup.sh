#!/bin/bash
set -e

echo "Running cleanup before deployment..."

# Stop and remove old container (if any)
CONTAINER_ID=$(docker ps -q --filter "ancestor=udhayademo/simple-python-flask-app")
if [ ! -z "$CONTAINER_ID" ]; then
    echo "Stopping and removing existing container during cleanup..."
    docker stop "$CONTAINER_ID"
    docker rm "$CONTAINER_ID"
fi

# Remove unused Docker images
docker image prune -f

# Fix permissions to avoid permission denied issues
sudo chown -R ubuntu:ubuntu /home/ubuntu/sample-python-ap
sudo chmod -R u+w /home/ubuntu/sample-python-ap

# Remove all files and folders EXCEPT scripts/ and interview-questions/
echo "Cleaning up existing files in /home/ubuntu/sample-python-ap (excluding scripts and interview-questions)..."
find /home/ubuntu/sample-python-ap -mindepth 1 \
  ! -path "/home/ubuntu/sample-python-ap/scripts*" \
  ! -path "/home/ubuntu/sample-python-ap/interview-questions*" \
  -exec rm -rf {} +

echo "Cleanup done."
