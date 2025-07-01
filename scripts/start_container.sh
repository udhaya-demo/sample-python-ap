#!/bin/bash

# Stop and remove existing container if it exists
docker stop udhaya-feed-app || true
docker rm udhaya-feed-app || true

# Run the container and bind Flask's port 5000 to EC2 host's 127.0.0.1
docker run -d \
  -p 127.0.0.1:5000:5000 \
  --name udhaya-feed-app \
  udhayademo/udhaya-feed-app:latest
