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

# Step 5: Build the Python 3.8 runtime image
echo "Step 5: Building Python 3.8 runtime image..."
cd runtimes/1-python3.8-x86_64/1-run
./build.sh
cd ../../..

# Step 6: Build the Python 3.8 runtime build image
echo "Step 6: Building Python 3.8 runtime build image..."
cd runtimes/1-python3.8-x86_64/2-build
./build.sh
cd ../../..

# Step 7: Build the Python 3.9 runtime image
echo "Step 7: Building Python 3.9 runtime image..."
cd runtimes/2-python3.9-x86_64/1-run
./build.sh
cd ../../..

# Step 8: Build the Python 3.9 runtime build image
echo "Step 8: Building Python 3.9 runtime build image..."
cd runtimes/2-python3.9-x86_64/2-build
./build.sh
cd ../../..

# Step 9: Build the Python 3.10 runtime image
echo "Step 9: Building Python 3.10 runtime image..."
cd runtimes/3-python3.10-x86_64/1-run
./build.sh
cd ../../..

# Step 10: Build the Python 3.10 runtime build image
echo "Step 10: Building Python 3.10 runtime build image..."
cd runtimes/3-python3.10-x86_64/2-build
./build.sh
cd ../../..

# Step 11: Build the Python 3.11 runtime image
echo "Step 11: Building Python 3.11 runtime image..."
cd runtimes/4-python3.11-x86_64/1-run
./build.sh
cd ../../..

# Step 12: Build the Python 3.11 runtime build image
echo "Step 12: Building Python 3.11 runtime build image..."
cd runtimes/4-python3.11-x86_64/2-build
./build.sh
cd ../../..

# Step 13: Build the Python 3.12 runtime image
echo "Step 13: Building Python 3.12 runtime image..."
cd runtimes/5-python3.12-x86_64/1-run
./build.sh
cd ../../..

# Step 14: Build the Python 3.12 runtime build image
echo "Step 14: Building Python 3.12 runtime build image..."
cd runtimes/5-python3.12-x86_64/2-build
./build.sh
cd ../../..

echo "All images built successfully!"
echo ""
echo "Available images:"
docker images | grep -E "(javiortizmol|lambda)" | head -20 