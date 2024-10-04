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
