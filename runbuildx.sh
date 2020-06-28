#!/bin/bash

docker buildx build --platform "$TARGET_ARCH" --build-arg VERSION="$TARGET_VERSION" -t "$DOCKER_REPO" -t "$DOCKER_REPO":"$TARGET_VERSION" . --push
