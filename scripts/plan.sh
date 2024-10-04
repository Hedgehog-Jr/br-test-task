#!/bin/sh

terraform init
terraform plan \
  -var-file=common.tfvars
