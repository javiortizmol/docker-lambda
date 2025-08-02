#!/bin/bash

set -euxo pipefail

docker build -t javiortizmol/docker-lambda:python3.11-build-x86_64 .