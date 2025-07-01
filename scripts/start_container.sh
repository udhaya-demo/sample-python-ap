#!/bin/bash
cd /home/ubuntu/app

docker run -d -p 80:5000 --name udhaya-feed-app your-docker-username/udhaya-feed-app:latest
