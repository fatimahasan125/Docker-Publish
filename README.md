# Docker-Publish
A shell script to deploy a small website on an nginx container and pushing the changes to a user's repository. We also test whether the deployment has been successful or not. 


When DockerPublish.sh is run, it will prompt you to enter the following:

1)	Username of the docker.io account where you want to push the container 
2)	Password of the docker.io account 
3)	The name that you want to give your container when it is created and pushed
4)	The container tag 
5)	The Repository Name


The container is created, the file index.html is copied to the container, these changes are committed and then pushed to the repository provided.

Make sure when you run the script, you have the website folder in the same working directory so that the index.html file can be copied into the container. 

# Docker Verify

When DockerVerify.sh is run, it will prompt you to enter the following:

1)	Username of the docker.io account where you pushed the container in the previous part (DockerPublish.sh) 
2)	Repository name where the container was pushed
3)	The name that you want to give your container when it is created after pulling the previous image
4)	The container tag 


Once the container is pulled, it is mapped to port 80 and run. Curl localhost is used and the output is written to a new file index2.html. It is then compared with the original file (provided in the website folder) 

Make sure when you run the script, you have the website folder in the same working directory so that the two files can be compared. 

