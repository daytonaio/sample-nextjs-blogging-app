# Start with the official JavaScript/Node.js dev container image
FROM mcr.microsoft.com/devcontainers/javascript-node:latest

# Install Docker CLI to allow running Docker commands within the dev container
RUN apt-get update && apt-get install -y docker.io

# Pull the MindsDB Docker image
RUN docker pull mindsdb/mindsdb

# Start the MindsDB container
RUN docker run --name mindsdb_container -p 47334:47334 -d mindsdb/mindsdb || echo "MindsDB container already exists or is running"

# Set the working directory inside the container
WORKDIR /workspace

# Default command to keep the container running
CMD ["sleep", "infinity"]
