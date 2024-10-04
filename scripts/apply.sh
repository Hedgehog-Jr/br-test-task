#!/bin/sh

terraform init
terraform apply \
  -auto-approve \
  -var-file=common.tfvars
