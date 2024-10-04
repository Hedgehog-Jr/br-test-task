variable "client_certificate_path" {
  type = string
  default = "/root/.minikube/profiles/minikube/client.crt"
}

variable "client_key_path" {
  type = string
  default = "/root/.minikube/profiles/minikube/client.key"
}

variable "cluster_ca_certificate_path" {
  type = string
  default = "/root/.minikube/ca.crt"
}

variable "kubernetes_host" {
  type = string
}
