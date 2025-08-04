#!/bin/bash

set -euxo pipefail

export PUBLISH_DATE=$(date "+%Y%m%d%H%M")
export NO_ARCH_TAG="javiortizmol/docker-lambda:python3.10-build"
export BASE_IMAGE="${NO_ARCH_TAG}-x86_64"

docker tag ${BASE_IMAGE} ${BASE_IMAGE}-${PUBLISH_DATE}
docker tag ${BASE_IMAGE} ${NO_ARCH_TAG}
docker push ${NO_ARCH_TAG}
docker push ${BASE_IMAGE}
docker push ${BASE_IMAGE}-${PUBLISH_DATE} 