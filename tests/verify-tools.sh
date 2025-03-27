#!/bin/bash
# Test that all expected tools are available in the image

IMAGE=$1

echo "Verifying tools in $IMAGE..."

# Run a container and check for each tool
docker run --rm "$IMAGE" bash -c "
  set -e
  echo '✓ bash is working'
  command -v git && echo '✓ git is installed'
  command -v python3 && echo '✓ python3 is installed'
  command -v pip3 && echo '✓ pip3 is installed'
  # Add checks for all your other tools
  echo 'All tools verified!'
"