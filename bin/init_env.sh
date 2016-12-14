#!/bin/bash
source ${BASE_PROJECT_HOME}/bin/f_global.sh
source ${BASE_PROJECT_HOME}/bin/f_maven.sh
source ${BASE_PROJECT_HOME}/bin/f_vagrant.sh

setGlobalAliasses

export SOFTWARE_HOME=~/Software
export PROJECTS_ROOT=~/Projects
export PROJECT_HOME=${PROJECTS_ROOT}/${PROJECT_NAME}

if [[ -n ${JAVA_VERSION} ]]; then
  echo "Using java ${JAVA_VERSION}"
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk${JAVA_VERSION}/Contents/Home
  export PATH=${JAVA_HOME}/bin:${PATH}
fi

if [[ -n ${MAVEN_VERSION} ]]; then
  echo "Using maven ${MAVEN_VERSION}"
  export MAVEN_HOME=${SOFTWARE_HOME}/apache-maven-${MAVEN_VERSION}
  alias mvn=doMvnWithSettings
fi

if [[ -n ${GROOVY_VERSION} ]]; then
  echo "Using groovy ${GROOVY_VERSION}"
  export PATH=${SOFTWARE_HOME}/groovy-${GROOVY_VERSION}/bin:${PATH}
fi

if [[ -n ${GRADLE_VERSION} ]]; then
  echo "Using gradle ${GRADLE_VERSION}"
  export PATH=${SOFTWARE_HOME}/gradle-${GRADLE_VERSION}/bin:${PATH}
fi

if [[ -n ${VAGRANT_LOCATION} ]]; then
  echo "Using vagrant machines in ${VAGRANT_LOCATION}"
  export VAGRANT_CWD=${VAGRANT_LOCATION}
  setVagrantAliasses
fi
