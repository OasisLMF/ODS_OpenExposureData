#!/usr/bin/env bash                                                                                                                          

if [ -z "$1" ]; then
    DOCKER_TAG='latest'
else
    DOCKER_TAG=$1
fi

docker build -f docker/Dockerfile.build_package -t ods-builder:"$DOCKER_TAG" .
docker run --entrypoint tox ods-builder:"$DOCKER_TAG"
