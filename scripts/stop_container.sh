#!/bin/bash
set -e

# Stop any running container based on the image
CONTAINER_ID=$(docker ps -q --filter "ancestor=udhayademo/simple-python-flask-app")
if [ ! -z "$CONTAINER_ID" ]; then
    echo "Stopping container..."
    docker stop "$CONTAINER_ID"
    docker rm "$CONTAINER_ID"
fi
