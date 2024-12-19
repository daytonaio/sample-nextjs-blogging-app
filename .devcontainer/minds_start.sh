#!/bin/bash

echo "Starting the process of pulling the MindsDB Docker image..."

sudo docker --version
# Pull the MindsDB Docker image and wait for it to complete
sudo docker pull mindsdb/mindsdb

# Check if the pull was successful
if [ $? -eq 0 ]; then
    echo "MindsDB Docker image has been successfully pulled."
else
    echo "Failed to pull the MindsDB Docker image."
    exit 1
fi

# Run the MindsDB container
echo "Starting the MindsDB container..."
sudo docker run --name mindsdb_container -p 47334:47334 -d mindsdb/mindsdb

# Wait a moment to ensure the container is fully started
echo "Waiting for the MindsDB container to start..."
sleep 5

# Check if Docker container is running
if sudo docker ps --filter "name=mindsdb_container" --format '{{.Names}}' | grep -q mindsdb_container; then
    echo "MindsDB container is up and running."
else
    echo "Failed to start the MindsDB container."
    exit 1
fi

# Install npm dependencies
echo "Installing npm dependencies..."
sudo npm install && echo 'Dependencies installed.'

# Generate Prisma client
echo "Generating Prisma client..."
sudo npx prisma generate
