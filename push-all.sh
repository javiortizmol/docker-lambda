#!/bin/bash

set -euxo pipefail

echo "Pushing Docker Lambda images to registry..."

# Step 1: Push the base Lambda image
echo "Step 1: Pushing base Lambda image..."
docker push javiortizmol/lambda-base-2:x86_64

# Step 2: Push the build image with Python support
echo "Step 2: Pushing build image with Python support..."
docker push javiortizmol/lambda-base-2:build-x86_64

# Step 3: Push the provided runtime image
echo "Step 3: Pushing provided runtime image..."
docker push javiortizmol/docker-lambda:provided.al2-x86_64

# Step 4: Push the provided runtime build image
echo "Step 4: Pushing provided runtime build image..."
docker push javiortizmol/docker-lambda:provided.al2-build-x86_64

# Step 5: Push the Python 3.8 runtime image
echo "Step 5: Pushing Python 3.8 runtime image..."
docker push javiortizmol/docker-lambda:python3.8-x86_64

# Step 6: Push the Python 3.8 runtime build image
echo "Step 6: Pushing Python 3.8 runtime build image..."
docker push javiortizmol/docker-lambda:python3.8-build-x86_64

# Step 7: Push the Python 3.9 runtime image
echo "Step 7: Pushing Python 3.9 runtime image..."
docker push javiortizmol/docker-lambda:python3.9-x86_64

# Step 8: Push the Python 3.9 runtime build image
echo "Step 8: Pushing Python 3.9 runtime build image..."
docker push javiortizmol/docker-lambda:python3.9-build-x86_64

# Step 9: Push the Python 3.10 runtime image
echo "Step 9: Pushing Python 3.10 runtime image..."
docker push javiortizmol/docker-lambda:python3.10-x86_64

# Step 10: Push the Python 3.10 runtime build image
echo "Step 10: Pushing Python 3.10 runtime build image..."
docker push javiortizmol/docker-lambda:python3.10-build-x86_64

# Step 11: Push the Python 3.11 runtime image
echo "Step 11: Pushing Python 3.11 runtime image..."
docker push javiortizmol/docker-lambda:python3.11-x86_64

# Step 12: Push the Python 3.11 runtime build image
echo "Step 12: Pushing Python 3.11 runtime build image..."
docker push javiortizmol/docker-lambda:python3.11-build-x86_64

# Step 13: Push the Python 3.12 runtime image
echo "Step 13: Pushing Python 3.12 runtime image..."
docker push javiortizmol/docker-lambda:python3.12-x86_64

# Step 14: Push the Python 3.12 runtime build image
echo "Step 14: Pushing Python 3.12 runtime build image..."
docker push javiortizmol/docker-lambda:python3.12-build-x86_64

echo "All images pushed successfully!"
echo ""
echo "Available images in registry:"
echo "- javiortizmol/lambda-base-2:x86_64"
echo "- javiortizmol/lambda-base-2:build-x86_64"
echo "- javiortizmol/docker-lambda:base-x86_64"
echo "- javiortizmol/docker-lambda:provided.al2-x86_64"
echo "- javiortizmol/docker-lambda:provided.al2-build-x86_64"
echo "- javiortizmol/docker-lambda:python3.8-x86_64"
echo "- javiortizmol/docker-lambda:python3.8-build-x86_64"
echo "- javiortizmol/docker-lambda:python3.9-x86_64"
echo "- javiortizmol/docker-lambda:python3.9-build-x86_64"
echo "- javiortizmol/docker-lambda:python3.10-x86_64"
echo "- javiortizmol/docker-lambda:python3.10-build-x86_64"
echo "- javiortizmol/docker-lambda:python3.11-x86_64"
echo "- javiortizmol/docker-lambda:python3.11-build-x86_64"
echo "- javiortizmol/docker-lambda:python3.12-x86_64"
echo "- javiortizmol/docker-lambda:python3.12-build-x86_64" 