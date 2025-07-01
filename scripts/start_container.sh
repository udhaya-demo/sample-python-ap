#!/bin/bash
cd /home/ubuntu/app

docker run -d -p 5000:5000 --name udhaya-feed-app udhayademo/udhaya-feed-app:latest
