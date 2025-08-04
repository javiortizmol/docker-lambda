#!/bin/bash

DOCKER_OS_ARCHITECTURE="linux/amd64"

curl -O https://docker-lambda.s3.amazonaws.com/fs/base-2-x86_64.tgz

set -euxo pipefail

docker build --no-cache --platform ${DOCKER_OS_ARCHITECTURE} -t javiortizmol/lambda-base-2:x86_64 .

rm ./base-2-x86_64.tgz