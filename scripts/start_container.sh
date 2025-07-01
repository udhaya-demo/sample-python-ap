#!/bin/bash

# Stop and remove old container if exists
docker stop udhaya-feed-app || true
docker rm udhaya-feed-app || true

# Start new container (do NOT bind to port 80; let NGINX handle that)
docker run -d --name udhaya-feed-app -p 5000:5000 udhayademo/udhaya-feed-app:latest
