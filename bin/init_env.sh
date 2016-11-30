#!/bin/bash
export SOFTWARE_HOME=${SOFTWARE_HOME}:-~/Software
export PROJECT_HOME=${PROJECTS_ROOT}/${PROJECT_NAME}

if(-n ${JAVA_VERSION})
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk${JAVA_VERSION}/Contents/Home/java
  export PATH=${JAVA_HOME}/bin:$PATH:
fi

if(-n ${MAVEN_VERSION})
  alias mvn='${SOFTWARE_HOME}/apache-maven-${MAVEN_VERSION}/bin/mvn -s ${PROJECT_HOME}/bin/mvn-settings.xml'
fi
