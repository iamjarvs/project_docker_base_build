#!/bin/bash
# Manual publish script

# Configuration
IMAGE_NAME="yourusername/base-dev-image"
TAG=${1:-"latest"}

echo "Logging into Docker Hub..."
docker login

echo "Pushing $IMAGE_NAME:$TAG..."
docker push "$IMAGE_NAME:$TAG"

echo "Done! Image is available at: $IMAGE_NAME:$TAG"