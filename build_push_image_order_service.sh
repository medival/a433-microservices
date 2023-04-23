#! /bin/bash
# Set Variable
WORKDIR="/mnt/c/Users/medival/microservice-architecture/a433-microservices" # Set WORKDIR
IMAGE_NAME="order-service" # Set Image Name
TAG="latest" # Set Tag Image
PAT="/home/medival/.docker/token" # Set Personal Access Token Path
GITHUB_USERNAME="medival" # Set Github Username

# Step 1. Build the image
docker build  -t $IMAGE_NAME:$TAG . 

# Step 2. Tag Image
docker tag $IMAGE_NAME:$TAG ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG 

# Step 3. Display latest images
docker images | grep ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME | grep $TAG

# Step 4. Login to GHCR via Terminal
cat $PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Step 5. Push image to Docker Hub
docker push ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG