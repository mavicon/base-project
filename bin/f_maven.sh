#!/bin/bash

function doMvnWithSettings() {
  "$MAVEN_HOME/bin/mvn" -s "$PROJECT_HOME"/bin/mvn-settings.xml $*
}
