#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: init_project <your-project-name>"
fi

export PROJECT_NAME=$1
export PROJECT_HOME="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
export PROJECT_DIR=${PROJECT_HOME}/${PROJECT_NAME}

echo "Creating project directory ${PROJECT_DIR}"

if [ ! -d "$PROJECT_DIR" ]; then
    mkdir ${PROJECT_DIR}
fi

cp -R -n ${BASE_PROJECT_HOME}/project-template/* ${PROJECT_DIR}
chmod a+rx ${PROJECT_DIR}/bin/*.sh

find . -name '*' -type f -exec sed -i '' -e "s/testje/${PROJECT_NAME}/g" {} \;
