#!/bin/bash

##PARAMS
JENKINS_REPO_URI="jenkins-2.150.2-1.1"
## END PARAMS

function installPreReq(){
    echo "±±±±±±±±±±±±±>installPreReq"
    yum update -y
    yum install -y yum-utils git nano java wget unzip bash-completion
}

function installJenkins(){
  echo "±±±±±±±±±±±±±>install jenkins"
  yum install -y https://prodjenkinsreleases.blob.core.windows.net/redhat-stable/${JENKINS_REPO_URI}.noarch.rpm java
  systemctl enable jenkins
  systemctl start jenkins
}

function installDocker(){
  yum update -y 
  yum install -y docker
  systemctl enable docker
  systemctl start docker
  sudo groupadd docker
  sudo usermod -aG docker jenkins
}

function installMaven(){
  sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
  sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
  sudo yum install -y apache-maven
  mvn --version
}

function main(){
  installPreReq
  installJenkins
  installDocker
  installMaven
}
main
