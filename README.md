# Docker-Publish
A shell script to deploy a small website on an nginx container and pushing the changes to a user's repository


When DockerPublish.sh is run, it will prompt you to enter the following:

1)	Username of the docker.io account where you want to push the container 
2)	Password of the docker.io account 
3)	The name that you want to give your container when it is created and pushed
4)	The container tag 
5)	The Repository Name


The container is created, the file index.html is copied to the container, these changes are committed and then pushed to the repository provided.

Make sure when you run the script, you have the website folder in the same working directory so that the index.html file can be copied into the container. 

