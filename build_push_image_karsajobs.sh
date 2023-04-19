#! /bin/bash
# Set Variable
WORKDIR="/mnt/c/Users/medival/microservice-architecture/a433-microservices" # Set WORKDIR
IMAGE_NAME="karsajobs" # Set Image Name
TAG="latest" # Set Tag Image
PAT="/home/medival/.docker/token" # Set Personal Access Token Path
GITHUB_USERNAME="medival" # Set Github Username
BRANCH_NAME="karsajobs"

# Step 0. Checkout branch karsajobs
git checkout $BRANCH_NAME

# Step 1. Go to working directory and build the image
docker build -t $IMAGE_NAME:$TAG .

# Step 2. List all local images
docker images

# Step 3. Tag Image
docker tag $IMAGE_NAME:$TAG ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG 

# Step 4. Login to GHCR via Terminal
cat $PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

# Step 5. Push image to Docker Hub
docker push ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$TAG

# Step 6. Checkout to main BRANCH
git checkout main