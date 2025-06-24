#!/bin/bash
set -e

echo "Running cleanup before deployment..."

# Optional: stop any old containers (just in case)
CONTAINER_ID=$(docker ps -q --filter "ancestor=udhayademo/simple-python-flask-app")
if [ ! -z "$CONTAINER_ID" ]; then
    echo "Stopping and removing existing container during cleanup..."
    docker stop "$CONTAINER_ID"
    docker rm "$CONTAINER_ID"
fi

# Optional: prune unused images (not strictly required)
docker image prune -f
