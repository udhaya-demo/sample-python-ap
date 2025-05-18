#!/bin/bash
set -e

# Greeting
echo "Hi"

# Get running container IDs
running_containers=$(docker ps -q)

if [ -z "$running_containers" ]; then
  echo "No running containers found."
else
  echo "Stopping running containers..."
  docker stop $running_containers

  echo "Removing stopped containers..."
  docker rm $running_containers

  echo "All running containers have been stopped and removed."
fi
