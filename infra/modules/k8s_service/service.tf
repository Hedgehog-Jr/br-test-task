resource "kubernetes_deployment" "this" {
  metadata {
    name = var.app_name
  }

  spec {
    replicas = var.replicas_number

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          name  = var.app_name
          image = var.docker_image
          port {
            container_port = var.service_target_port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "this" {
  metadata {
    name = var.service_name
  }
  spec {
    selector = {
      app = var.app_name
    }
    port {
      protocol    = var.service_port_protocol
      port        = var.service_port
      target_port = var.service_target_port
    }
    type = var.service_port_type
  }
}
