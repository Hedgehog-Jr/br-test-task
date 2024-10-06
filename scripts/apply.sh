#!/bin/sh

terraform init
terraform apply \
  -auto-approve

if [ $? -eq 0 ]; then
    echo "Terraform apply successful."
else
    echo "Terraform apply failed!"
    # Handle failure, send notifications
    exit 1
fi
