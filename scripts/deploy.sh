#!/bin/bash
cd /home/ubuntu/cloud-native-monitoring

docker stop flask-app || true
docker rm flask-app || true
docker rmi flask-monitoring || true

docker build -t flask-monitoring .

docker run -d \
  -p 5000:5000 \
  --name flask-app \
  flask-monitoring
