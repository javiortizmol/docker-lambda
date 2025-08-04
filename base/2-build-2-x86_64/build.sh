#!/bin/sh

set -euxo pipefail

DOCKER_OS_ARCHITECTURE="linux/amd64"

docker buildx build --platform $DOCKER_OS_ARCHITECTURE -t javiortizmol/lambda-base-2:build-x86_64 --load .

#docker build --no-cache --platform linux/amd64 -t javiortizmol/lambda-base-2:build-x86_64 .