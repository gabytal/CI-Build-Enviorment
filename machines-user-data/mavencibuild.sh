#!/bin/bash
#this is a simple CI script
##PARAMS
GIT_REPO_URI="https://github.com/zivkashtan/course.git"
BUILD_ACTION="package"
ARTIFACT_GROUP_ID="clinic.programming.time-tracker"
ARTIFACT_ID="time-tracker-parent"
ARTIFACT_VERSION="0.3.1"
ARTIFACT_Dpackaging="pom"
ARTIFACT_FILE="web/timetracker.war"
NEXUS_REPO_URL="https://172.16.1.101:8081/repository/maven-snapshots"

function sourceCodePull(){  
  git clone ${GIT_REPO_URI}
  echo "pulling code...."
}

function build(){  
 echo "build in progress.."
 cd course/
sed -i "s/<java.version>.*<\/java.version>/<java.version>1.7<\/java.version>/" pom.xml
mvn ${BUILD_ACTION}
  
}

function publishingArtifact(){  
 echo "publishing artifact to artifactory...."
  mvn deploy:deploy-file \
  -DgroupId=${ARTIFACT_GROUP_ID} \
  -DartifactId=${ARTIFACT_ID} \
  -Dversion=${ARTIFACT_VERSION} \
  -Dpackaging=${ARTIFACT_Dpackaging} \
  -Dfile=${ARTIFACT_FILE} \
  -Durl=${NEXUS_REPO_URL}
  
}
function main(){
  sourceCodePull
  build
  publishingArtifact
}

main