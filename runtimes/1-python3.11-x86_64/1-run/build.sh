#!/bin/bash

set -euxo pipefail

docker build --progress plain --squash -t javiortizmol/docker-lambda:python3.11-x86_64 .