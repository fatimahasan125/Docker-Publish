#!/bin/bash

echo -e "Enter username: "
read user

echo -e "Enter Repository Name: "
read repo_name

echo -e "Enter Container Name: "
read container_name 

echo -e "Enter Container Tag: "
read tag

sudo docker pull $user/$repo_name:$tag 

if [ $? -ne 0 ]; then
    exit -1
fi

sudo docker run --name=$container_name -d -p 80:80 $user/$repo_name:$tag

if [ $? -ne 0 ]; then
    exit -1
fi

touch index2.html
curl localhost > index2.html

if sudo cmp -s  $(pwd)/website/index.html index2.html ; then
	echo "Verified. The response is the same as published"
else
	echo "Files are not the same"
fi
	 
echo "Stopping container: "
sudo docker stop $container_name
echo "Removing container: "
sudo docker rm $container_name
