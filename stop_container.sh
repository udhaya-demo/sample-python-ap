#!/bin/bash
set -e

# Check for running containers
RUNNING_CONTAINERS=$(docker ps -q)

if [ -n "$RUNNING_CONTAINERS" ]; then
  echo "Stopping running containers..."
  docker stop $RUNNING_CONTAINERS

  echo "Removing stopped containers..."
  docker rm $RUNNING_CONTAINERS
else
  echo "No running containers found."
fi

