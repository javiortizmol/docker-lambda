#!/bin/bash

set -euxo pipefail

docker build --progress plain --squash -t javiortizmol/docker-lambda:python3.12-build-x86_64 . 