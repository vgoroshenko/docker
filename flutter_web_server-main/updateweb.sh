#!/bin/bash
sudo docker image prune -f 
cd /home/ec2-user/mln-ui 
git pull
sudo docker-compose up --build -d