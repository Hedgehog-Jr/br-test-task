#!/bin/bash

# Configuration variables
IMAGE_NAME="terraform-image"
CONTAINER_NAME="terraform-container"
CLIENT_CERTIFICATE_PATH="$(realpath ~/.minikube/profiles/minikube/client.crt)"
CLIENT_KEY_PATH="$(realpath ~/.minikube/profiles/minikube/client.key)"
CLUSTER_CA_CERTIFICATE_PATH="$(realpath ~/.minikube/ca.crt)"
TERRAFORM_TOKEN="$(realpath ~/.terraform.d/credentials.tfrc.json)"
K8S_HOST="https://$(minikube ip):8443"


# Check if the user provided an argument
if [ $# -eq 0 ]
then
  echo "No argument provided. Please provide 'apply' or 'plan'."
  exit 1
fi

TF_COMMAND=$1

# Verify that the argument is either 'apply' or 'plan'
if [ "$TF_COMMAND" != "apply" ] && [ "$TF_COMMAND" != "plan" ]
then
  echo "Invalid terraform command. Please provide 'apply' or 'plan'."
  exit 1
fi


# rebuild the Docker image
if [[ "$(docker images -q $IMAGE_NAME:$IMAGE_TAG 2> /dev/null)" != "" ]]; then
  docker rmi $IMAGE_NAME
fi
docker build \
  -t $IMAGE_NAME \
  -f infra.Dockerfile \
  --build-arg TF_COMMAND=$TF_COMMAND .

# Run the container using the built image
echo "Running the Terraform container..."
docker run \
  --rm \
  --net=host \
  -v $CLIENT_CERTIFICATE_PATH:/root/.minikube/profiles/minikube/client.crt \
  -v $CLIENT_KEY_PATH:/root/.minikube/profiles/minikube/client.key \
  -v $CLUSTER_CA_CERTIFICATE_PATH:/root/.minikube/ca.crt \
  -v $TERRAFORM_TOKEN:/root/.terraform.d/credentials.tfrc.json \
  -e TF_VAR_kubernetes_host=$K8S_HOST \
  $IMAGE_NAME
