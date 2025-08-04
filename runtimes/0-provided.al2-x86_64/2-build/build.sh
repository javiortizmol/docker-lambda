#!/bin/bash

set -euxo pipefail

DOCKER_OS_ARCHITECTURE="linux/amd64"

docker build --platform $DOCKER_OS_ARCHITECTURE -t javiortizmol/docker-lambda:provided.al2-build-x86_64 .