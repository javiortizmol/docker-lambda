#!/bin/sh

set -euxo pipefail

docker buildx build --platform linux/amd64 -t javiortizmol/lambda-base-2:build-x86_64 --load .

#docker build --no-cache --platform linux/amd64 -t javiortizmol/lambda-base-2:build-x86_64 .