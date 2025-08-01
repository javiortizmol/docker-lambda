#!/bin/bash

curl -O https://docker-lambda.s3.amazonaws.com/fs/base-2-x86_64.tgz

set -euxo pipefail

docker build --no-cache --platform linux/amd64 -t javiortizmol/lambda-base-2:x86_64 .

rm ./base-2-x86_64.tgz