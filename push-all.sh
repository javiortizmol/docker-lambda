#!/bin/bash

set -euxo pipefail

echo "Pushing Docker Lambda images to registry..."

# Push base images first
echo "Step 1: Pushing base Lambda image..."
docker push javiortizmol/lambda-base-2:x86_64

echo "Step 2: Pushing build image with Python support..."
docker push javiortizmol/lambda-base-2:build-x86_64

# Find all runtime directories and execute their publish.sh scripts
echo "Step 3: Pushing runtime images..."
for runtime_dir in runtimes/*/; do
    if [ -d "$runtime_dir" ]; then
        runtime_name=$(basename "$runtime_dir")
        echo "Processing runtime: $runtime_name"
        
        # Check for 1-run/publish.sh
        if [ -f "${runtime_dir}1-run/publish.sh" ]; then
            echo "  Pushing runtime image for $runtime_name..."
            cd "${runtime_dir}1-run"
            ./publish.sh
            cd ../../..
        fi
        
        # Check for 2-build/push.sh
        if [ -f "${runtime_dir}2-build/publish.sh" ]; then
            echo "  Pushing build image for $runtime_name..."
            cd "${runtime_dir}2-build"
            ./publish.sh
            cd ../../..
        fi
    fi
done

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