#!/usr/bin/env bash                                                                                                                          

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PACKAGE_OUTPUT="$SCRIPT_DIR"/dist

if [ ! -d "$PACKAGE_OUTPUT" ]; then
  mkdir "$PACKAGE_OUTPUT"
else
  rm -fr "$PACKAGE_OUTPUT"/*
fi

if [ -z "$1" ]; then
    DOCKER_TAG='latest'
else
    DOCKER_TAG=$1
fi

docker build -f docker/Dockerfile.build_package -t ods-builder:"$DOCKER_TAG" .
docker run --entrypoint tox ods-builder:"$DOCKER_TAG"
