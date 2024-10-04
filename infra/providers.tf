provider "kubernetes" {
  host = var.kubernetes_host

  client_certificate     = file(var.client_certificate_path)
  client_key             = file(var.client_key_path)
  cluster_ca_certificate = file(var.cluster_ca_certificate_path)
}
