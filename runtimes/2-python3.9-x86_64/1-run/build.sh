#!/bin/bash

set -euxo pipefail

DOCKER_OS_ARCHITECTURE="linux/amd64"

docker build --platform $DOCKER_OS_ARCHITECTURE --progress plain --squash -t javiortizmol/docker-lambda:python3.9-x86_64 . 