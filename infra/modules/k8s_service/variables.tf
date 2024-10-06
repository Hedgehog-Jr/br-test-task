variable "replicas_number" {
  type        = number
  description = "Service replicas number"
  default     = 3
}

variable "service_port" {
  type        = number
  description = "The exposed port for accessing the Kubernetes service"
  default     = 80
}

variable "service_target_port" {
  type        = number
  description = "The pod port where traffic is directed from the service"
  default     = 8080
}

variable "service_port_protocol" {
  type        = string
  description = "Service port protocol"
  default     = "TCP"
}

variable "strategy_max_unavailable" {
  type        = string
  description = "The maximum number of pods that can be unavailable during the update"
  default     = "0"
}

variable "strategy_max_surge" {
  type        = string
  description = "The maximum number of pods that can be scheduled above the desired number of pods"
  default     = "1"
}

variable "liveness_probe_init_delay_sec" {
  type        = number
  description = "The number of seconds to wait after the container has started before the liveness probe is initiated"
  default     = 30
}

variable "liveness_probe_period_sec" {
  type        = number
  description = "The frequency in seconds with which the liveness probe is executed"
  default     = 10
}

variable "readiness_probe_init_delay_sec" {
  type        = number
  description = "The number of seconds to wait after the container has started before the readiness probe is initiated for the first time"
  default     = 5
}

variable "readiness_probe_period_sec" {
  type        = number
  description = "The frequency in seconds with which the readiness probe is executed"
  default     = 5
}

variable "readiness_failure_threshold" {
  type        = number
  description = "The number of times the probe is allowed to fail consecutively before the container is considered to be not ready"
  default     = 3
}

variable "service_port_type" {
  type        = string
  description = "Service port type"
}

variable "app_name" {
  type        = string
  description = "Name of the application"
}

variable "service_name" {
  type        = string
  description = "Name of the service"
}

variable "docker_image" {
  type        = string
  description = "Docker image to use for the deployment"
}
