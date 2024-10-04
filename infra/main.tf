terraform {
  required_version = ">= 1.5.2"

  backend "remote" {
    organization = "hedgehog_test_organization"

    workspaces {
      name = "hedgehog_test_workspace"
    }
  }

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}
