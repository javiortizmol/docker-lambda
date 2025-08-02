#!/bin/bash

set -euxo pipefail

echo "Building Docker Lambda images in dependency order..."

# Step 1: Build the base Lambda image
echo "Step 1: Building base Lambda image..."
cd base/1-base-2-x86_64
./build.sh
cd ../..

# Step 2: Build the build image with Python support
echo "Step 2: Building build image with Python support..."
cd base/2-build-2-x86_64
./build.sh
cd ../..

# Step 3: Build the provided runtime image
echo "Step 3: Building provided runtime image..."
cd runtimes/0-provided.al2-x86_64/1-run
./build.sh
cd ../../..

# Step 4: Build the provided runtime build image
echo "Step 4: Building provided runtime build image..."
cd runtimes/0-provided.al2-x86_64/2-build
./build.sh
cd ../../..

# Step 5: Build the Python runtime image
echo "Step 5: Building Python runtime image..."
cd runtimes/1-python3.12-x86_64/1-run
./build.sh
cd ../../..

# Step 6: Build the Python runtime build image
echo "Step 6: Building Python runtime build image..."
cd runtimes/1-python3.12-x86_64/2-build
./build.sh
cd ../../..

echo "All images built successfully!"
echo ""
echo "Available images:"
docker images | grep -E "(javiortizmol|lambda)" | head -20 