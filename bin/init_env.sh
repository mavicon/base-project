#!/bin/bash
export SOFTWARE_HOME=~/Software
export PROJECTS_ROOT=~/Projects
export PROJECT_HOME=${PROJECTS_ROOT}/${PROJECT_NAME}

function doMvnWithSettings() {
  "$MAVEN_HOME/bin/mvn" -s "$PROJECT_HOME"/bin/mvn-settings.xml $*
}

if [[ -n ${JAVA_VERSION} ]]; then
  echo "Using java ${JAVA_VERSION}"
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk${JAVA_VERSION}/Contents/Home
  export PATH=${JAVA_HOME}/bin:${PATH}
fi

if [[ -n ${MAVEN_VERSION} ]]; then
  echo "Using maven ${MAVEN_VERSION}"
  export MAVEN_HOME=${SOFTWARE_HOME}/apache-maven-${MAVEN_VERSION}
  #export PATH=${MAVEN_HOME}/bin:${PATH}
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
fi
