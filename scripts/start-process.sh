#!/bin/bash
sudo -u root aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 194973748467.dkr.ecr.us-east-1.amazonaws.com
sudo -u root docker rm -f `docker ps -q -a`
sudo -u root docker rmi -f `docker images -q`
sleep 3
sudo -u root docker pull 194973748467.dkr.ecr.us-east-1.amazonaws.com/samplen:19
if [[ $? != 0 ]]
then
    sudo -u root aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 194973748467.dkr.ecr.us-east-1.amazonaws.com
    sudo -u root docker pull 194973748467.dkr.ecr.us-east-1.amazonaws.com/samplen:19
fi
sudo -u root docker run -d -p 8080:8080 --name mavenwebapp 194973748467.dkr.ecr.us-east-1.amazonaws.com/samplen:19
