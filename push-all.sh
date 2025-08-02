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

# Step 5: Push the Python runtime image
echo "Step 5: Pushing Python runtime image..."
docker push javiortizmol/docker-lambda:python3.11-x86_64

# Step 6: Push the Python runtime build image
echo "Step 6: Pushing Python runtime build image..."
docker push javiortizmol/docker-lambda:python3.11-build-x86_64

echo "All images pushed successfully!"
echo ""
echo "Available images in registry:"
echo "- javiortizmol/lambda-base-2:x86_64"
echo "- javiortizmol/lambda-base-2:build-x86_64"
echo "- javiortizmol/docker-lambda:base-x86_64"
echo "- javiortizmol/docker-lambda:provided.al2-x86_64"
echo "- javiortizmol/docker-lambda:provided.al2-build-x86_64"
echo "- javiortizmol/docker-lambda:python3.11-x86_64"
echo "- javiortizmol/docker-lambda:python3.11-build-x86_64" 