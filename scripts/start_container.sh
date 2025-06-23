#!/bin/bash
set -e

# Stop and remove any existing container based on this image
CONTAINER_ID=$(docker ps -q --filter "ancestor=udhayademo/simple-python-flask-app")
if [ ! -z "$CONTAINER_ID" ]; then
    echo "Stopping and removing existing container..."
    docker stop "$CONTAINER_ID"
    docker rm "$CONTAINER_ID"
fi

# Pull the Docker image from Docker Hub
docker pull udhayademo/simple-python-flask-app

# Run the Docker image as a container
docker run -d -p 5000:5000 udhayademo/simple-python-flask-app
