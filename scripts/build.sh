#!/bin/bash
# Local build script

# Configuration
IMAGE_NAME="yourusername/base-dev-image"
TAG=${1:-"latest"}

echo "Building $IMAGE_NAME:$TAG..."
docker build -t "$IMAGE_NAME:$TAG" .

echo "Testing image..."
./tests/verify-tools.sh "$IMAGE_NAME:$TAG"

echo "Done! Run with: docker run -it $IMAGE_NAME:$TAG"