#!/bin/bash
export SOFTWARE_HOME=${SOFTWARE_HOME}:~/Software
export PROJECT_HOME=${PROJECTS_ROOT}/${PROJECT_NAME}

if [[ -n ${JAVA_VERSION} ]]; then
  echo "Using java ${JAVA_VERSION}"
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk${JAVA_VERSION}/Contents/Home/java
  export PATH=${JAVA_HOME}/bin:${PATH}
fi

if [[ -n ${MAVEN_VERSION} ]]; then
  echo "Using maven ${MAVEN_VERSION}"
  alias mvn='${SOFTWARE_HOME}/apache-maven-${MAVEN_VERSION}/bin/mvn -s ${PROJECT_HOME}/bin/mvn-settings.xml'
fi

if [[ -n ${GROOVY_VERSION} ]]; then
  echo "Using groovy ${GROOVY_VERSION}"
  export PATH=${SOFTWARE_HOME}/groovy-${GROOVY_VERSION}/bin:${PATH}
fi

if [[ -n ${GRADLE_VERSION} ]]; then
  echo "Using gradle ${GRADLE_VERSION}"
  export PATH=${SOFTWARE_HOME}/gradle-${GRADLE_VERSION}/bin:${PATH}
fi
