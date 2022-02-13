#!/bin/bash
sudo docker image prune -f
cd /home/ec2-user/test
git pull
sudo make build
#sudo docker-compose up --build -d