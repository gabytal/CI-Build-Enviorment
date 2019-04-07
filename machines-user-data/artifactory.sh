#!/usr/bin/env bash

##PARAMS
NEXUS_REPO_URI="https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.0.2-02-unix.tar.gz"

function installTools(){
    echo "±±±±±±±±±±±±±>installTools"
    yum update -y
    yum -y install sudo vim nano wget net-tools 
}
function installJAVA(){
    echo "±±±±±±±±±±±±±>installJAVA"
    yum -y install java-1.8.0-openjdk.x86_64
}

function installNexus(){
    echo "±±±±±±±±±±±±±>installNexus"
  mkdir /app && cd /app
  wget $NEXUS_REPO_URI
  tar -xvf nexus-*.tar.gz
  rm -f nexus-*.tar.gz
  mv nexus-* nexus
  adduser nexus
  chown -R nexus:nexus /app/nexus
  echo -e "\nrun_as_user=\"nexus\"" >> /app/nexus/bin/nexus.rc
  sudo ln -s /app/nexus/bin/nexus /etc/init.d/nexus
  chkconfig --add nexus
  chkconfig --levels 345 nexus on
  systemctl enable nexus
  systemctl start nexus
  sudo sed 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

}

function main(){
  installTools
  installJAVA
  installNexus
}

main
