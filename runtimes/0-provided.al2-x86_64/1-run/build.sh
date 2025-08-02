#!/bin/bash

set -euxo pipefail

docker build --no-cache -t javiortizmol/docker-lambda:provided.al2-x86_64 .