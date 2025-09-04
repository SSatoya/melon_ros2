#!/bin/bash
set -e

# 1. Clone franka_description
cd ./melon_ws/src
if [ ! -d "franka_description" ]; then
  git clone https://github.com/frankaemika/franka_description.git
fi

# 2. Build the Docker image
cd ../../
docker compose build

# 3. Start the container
docker compose up -d