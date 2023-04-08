#! /bin/bash
# Set Variable
WORKDIR="/mnt/c/Users/medival/microservice-architecture/a433-microservices" # Set WORKDIR
IMAGE_NAME="item-app" # Set Image Name
TAG="v1" # Set Tag Image
PAT="/home/medival/.docker/token" # Set Personal Access Token Path
GITHUB_USERNAME="medival" # Set Github Username


# Step 1. Go to working directory and build the image
# cd $WORKDIR && docker build -t $IMAGE_NAME:$TAG $WORKDIR

# Step 2. List all local images
# docker images

# Step 3. Tag Image
docker tag $IMAGE_NAME:$TAG ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG 

# Step 4. Login to GHCR via Terminal
cat $PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Step 5. Push image to Docker Hub
docker push ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG