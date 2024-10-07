resource "kubernetes_deployment" "this" {
  metadata {
    name      = var.app_name
    namespace = var.service_namespace
  }

  spec {
    replicas = var.replicas_number

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_unavailable = var.strategy_max_unavailable
        max_surge       = var.strategy_max_surge
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

          resources {
            requests = {
              cpu    = var.cpu_requests
              memory = var.memory_requests
            }

            limits = {
              cpu    = var.cpu_limits
              memory = var.memory_limits
            }
          }

          port {
            container_port = var.service_target_port
          }

          liveness_probe {
            http_get {
              path = var.liveness_probe_path
              port = var.service_target_port
            }

            initial_delay_seconds = var.liveness_probe_init_delay_sec
            period_seconds        = var.liveness_probe_period_sec
          }

          readiness_probe {
            http_get {
              path = var.readiness_probe_path
              port = var.service_target_port
            }
            initial_delay_seconds = var.readiness_probe_init_delay_sec
            period_seconds        = var.readiness_probe_period_sec
            failure_threshold     = var.readiness_failure_threshold
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
