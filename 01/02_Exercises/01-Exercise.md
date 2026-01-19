### Exercise 1: Installing and start Jenkins as container
###  Prerequisite
Docker container environment (i.e. actual version of Docker-Desktop) is mandatory.
 
### Tasks
1. Login with SSH and port mapping on your AWS EC2 instance.
Example:
```bash
ssh -i "~/.ssh/fperri.pem" -L 8080:localhost:8080 "ubuntu@ec2-18-205-20-46.compute-1.amazonaws.com"
ssh -i "~/.ssh/fperri.pem" -L 8080:localhost:8080 "ubuntu@ec2-18-234-230-0.compute-1.amazonaws.com"
```
 
2. Pull Jenkins image from Docker Hub registry and list your images
```bash
docker pull jenkins/jenkins
```
 
3. Create a volume directory to keep (persist) the Jenkins data on your host
```bash
mkdir $HOME/jenkins-home
```
 
4. Run Jenkins as a container and give it a proper name to the container:
```bash
docker run -d -p 8080:8080 -v $HOME/jenkins-home:/var/jenkins_home --name jenkins-server jenkins/jenkins
```
 
5. Jenkins will ask for the administrator password. It can be found in the Jenkins logs:
```bash
docker logs jenkins-server
# [LF]> Please use the following password to proceed to installation:
# [LF]>
# [LF]> c49a5f35a7fe4b8c8d81972ca2727ec6
```
 
### ADMIN USER USED
# Username: admin
# Password: 1234
# Full name: Federico Perri
# E-mail address: perrif@bzz.ch
 
[<img src="img/01.png" width="250"/>](img/01.png)
 
6. After accepting the initial password, Jenkins asks whether to install the suggested plugins, which are adjusted for the most common use cases. As the first Jenkins installation, it's reasonable to let Jenkins install all the recommended plugins.
7. After the plugin installation, Jenkins asks you to set up a username, password, and other basic information. If you skip it, the token from step 2 will be used as the admin password.
 
[<img src="img/02.png" width="250"/>](img/02.png)
 
8. The installation is then complete, and you should see the Jenkins dashboard:
 
[<img src="img/03.png" width="250"/>](img/03.png)
 
9. Test Jenkins with the "Hello World" pipeline


WHEN RESTARTING EC2 INSTANCE:
```bash
docker start jenkins-server
```