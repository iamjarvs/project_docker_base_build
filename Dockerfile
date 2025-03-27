# Use a stable base image
FROM ubuntu:22.04

# Avoid interactive prompts during build
ARG DEBIAN_FRONTEND=noninteractive

# Set maintainer label
LABEL maintainer="Adam J"
LABEL description="Base development image with common tools"
LABEL version="1.0"

# Update and install common dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    python3 \
    python3-pip \
    vim \
    wget \
    # Add your other common tools here
    && rm -rf /var/lib/apt/lists/*

# Set up any global configurations
RUN git config --global core.editor "vim"

# Set up Python environment if needed
RUN pip3 install --no-cache-dir \
    pytest \
    black \
    flake8 \
    streamlit \
    # Add your common Python packages here

# You can add other language-specific tools as needed
# For example, for Node.js:
# RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
#     && apt-get install -y nodejs \
#     && npm install -g yarn typescript eslint

# Set working directory
WORKDIR /app

# Add any scripts or configurations you want available in the image
COPY scripts/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Default command
CMD ["/bin/bash"]