#!/bin/bash
# File: platzi_trips_app/scripts/jfrog/jfrog_npm_build_publish.sh
# 2022-04-05 | CR

cd "`dirname "$0"`" ;
SCRIPTS_DIR="`pwd`" ;
echo "SCRIPTS_DIR = ${SCRIPTS_DIR}";

echo "";
echo "*| Reading parameters from .env |*";
echo "";

# Variables
if [ -f "${SCRIPTS_DIR}/.env" ]; then
    set -o allexport; . "${SCRIPTS_DIR}/.env"; set +o allexport ;
fi

echo "";
echo "*| Moving to project root directory |*";
echo "";

if [ "${CI_PROJECT_DIR}" = "" ]; then
    export CI_PROJECT_DIR="${SCRIPTS_DIR}/../.." ;
fi
echo "CI_PROJECT_DIR/GIT_REPO_NAME = ${CI_PROJECT_DIR}/${GIT_REPO_NAME}";
cd "${CI_PROJECT_DIR}/${GIT_REPO_NAME}"
echo "Current Dir: `pwd`";

# App version
# Is specified on the `pubspec.yaml` file, for example: version: 1.0.0+1
# And it must be referenced on the CHANGELOG.md, if not, the dart pub publish will complaint.

echo "";
echo "*| Add token to the Pub client and set PUB_HOSTED_URL envvar |*";
echo "";

export PUB_HOSTED_URL="${JFROG_URL}/artifactory/api/pub/${ARTIFACTORY_REPO}"
echo "PUB_HOSTED_URL = ${PUB_HOSTED_URL}";
echo "";
echo "${JFROG_ACCESS_TOKEN}" | dart pub token add "${PUB_HOSTED_URL}" ;

echo "";
echo "*| Publish package to artifactory (first time or update to a new version) |*";
echo "";

# sed "s/publish_to:/# publish_to:/" pubspec.yaml ; # sed working wierd on the Mac so use perl instead...
perl -i -pe's/publish_to:/# publish_to:/g' pubspec.yaml ;
dart pub publish ;
perl -i -pe's/# publish_to:/publish_to:/g' pubspec.yaml ;

echo "";
echo "*| Spring cleaning |*";
echo "";

unset PUB_HOSTED_URL ;
