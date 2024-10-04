variable "client_certificate_path" {
  type = string
  description = "Path to the client certificate file"
  default = "/root/.minikube/profiles/minikube/client.crt"
}

variable "client_key_path" {
  type = string
  description = "Path to the client key file"
  default = "/root/.minikube/profiles/minikube/client.key"
}

variable "cluster_ca_certificate_path" {
  type = string
  description = "Path to the cluster CA certificate file"
  default = "/root/.minikube/ca.crt"
}

variable "backend_organization" {
  type = string
  description = "Name of the Hashicorp organization"
  default = "hedgehog_test_organization"
}

variable "backend_workspaces" {
  type = string
  description = "Name of the Hashicorp workspace"
  default = "hedgehog_test_workspace"
}

variable "kubernetes_host" {
  type = string
  description = "Kubernetes host address"
}
