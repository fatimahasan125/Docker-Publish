#!/bin/bash

echo -e "Please enter your credentials to log in to docker.io\nUsername: "
read user
sudo docker login --username=$user --password=$pass

if [ $? -ne 0 ]; then
    exit -1
fi

echo -e "Enter Container Name: "
read container_name

sudo docker run --name $container_name -d -p 80:80 nginx

if [ $? -ne 0 ]; then
    sudo docker logout
    exit -1
fi

chmod +rwx ./website/index.html
container_id=$(sudo docker ps -aqf "name=$container_name")
sudo docker cp $(pwd)/website/index.html $container_id:/usr/share/nginx/html

echo -e "Enter Tag:" 
read container_tag

echo -e "Enter Repository Name:"
read repository_name 


sudo docker commit $container_name $user/$repository_name:$container_tag

if [ $? -ne 0 ]; then
    sudo docker logout
    exit -1
fi

sudo docker push $user/$repository_name:$container_tag

if [ $? -ne 0 ]; then
    sudo docker logout
    exit -1
fi

sudo docker stop $container_name
sudo docker rm $container_name

sudo docker logout
