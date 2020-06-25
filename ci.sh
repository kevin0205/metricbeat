#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" = "true" ] || [ "$TRAVIS_BRANCH" != "master" ]; then
  docker buildx build \
    --progress plain \
    --platform=linux/amd64,linux/arm64 \
    --build-arg VERSION=7.5.2
    .
  exit $?
fi
echo $DOCKER_PASSWORD | docker login -u kevin0205 --password-stdin &> /dev/null
TAG="${TRAVIS_TAG:-latest}"
docker buildx build \
    --progress plain \
    --platform=linux/amd64,linux/arm64 \
    --build-arg VERSION=7.5.2
    -t $DOCKER_REPO:$TAG \
    --push \
    .
