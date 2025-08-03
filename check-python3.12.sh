#!/bin/bash

echo "Checking if Python 3.12 is available in docker-lambda S3 bucket..."

# Check Python 3.12 availability
echo "Checking Python 3.12..."
if curl -s -I https://docker-lambda.s3.amazonaws.com/fs/python3.12-x86_64.tgz | grep -q "200 OK"; then
    echo "✅ Python 3.12 is now available!"
    echo "You can now update the Dockerfiles to use:"
    echo "  curl https://docker-lambda.s3.amazonaws.com/fs/python3.12-x86_64.tgz | tar -zx -C /opt"
    echo ""
    echo "Files to update:"
    echo "  - runtimes/2-python3.12-x86_64/1-run/Dockerfile"
    echo "  - runtimes/2-python3.12-x86_64/2-build/Dockerfile"
else
    echo "❌ Python 3.12 is not yet available"
    echo "Current status:"
    curl -I https://docker-lambda.s3.amazonaws.com/fs/python3.12-x86_64.tgz | head -1
fi

echo ""
echo "Available Python versions:"
for version in 3.8 3.9 3.10 3.11 3.12; do
    if curl -s -I https://docker-lambda.s3.amazonaws.com/fs/python${version}-x86_64.tgz | grep -q "200 OK"; then
        echo "✅ Python $version - Available"
    else
        echo "❌ Python $version - Not available"
    fi
done 