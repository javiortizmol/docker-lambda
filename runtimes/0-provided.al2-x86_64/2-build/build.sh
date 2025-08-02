#!/bin/bash

set -euxo pipefail

docker build -t javiortizmol/docker-lambda:provided.al2-build-x86_64 .