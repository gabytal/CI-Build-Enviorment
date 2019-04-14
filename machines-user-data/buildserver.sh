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
  wget https://www-us.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz -P /tmp
  sudo tar xf /tmp/apache-maven-*.tar.gz -C /opt
  sudo ln -s /opt/apache-maven-3.6.0 /opt/maven
  sudo ln -s /opt/maven/bin/mvn /usr/local/bin/mvn
}

function main(){
  installPreReq
  installJenkins
  installDocker
  installMaven
}
main
