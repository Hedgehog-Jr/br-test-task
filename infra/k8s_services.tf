module "python_app_service" {
  source = "./modules/k8s_service"

  app_name          = "python-app1"
  docker_image      = "corji4/br-test-app:latest"
  service_name      = "python-service1"
  replicas_number   = 1
  service_port_type = "NodePort"
}
