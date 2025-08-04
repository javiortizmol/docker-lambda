#!/bin/bash

set -euxo pipefail

DOCKER_OS_ARCHITECTURE="linux/amd64"

docker build --platform $DOCKER_OS_ARCHITECTURE --no-cache -t javiortizmol/docker-lambda:provided.al2-x86_64 .