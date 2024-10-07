# BR test task

This project provides a streamlined solution for deploying applications into a Kubernetes environment.

## Project Structure

This project is organized into several key directories:

- `app/`: Contains a Flask Python application that serves as the main application logic.
- `infra/`: Contains Terraform scripts for provisioning and managing infrastructure resources.
  - `infra/modules/`: Contains reusable infrastructure modules.
    - `infra/modules/k8s_service/`: Contains a Kubernetes service module.
- `scripts/`: Contains deployment scripts that automate the process of deploying the infrastructure.

## Getting Started

### Prerequisites

List of dependencies that need to be installed before running this project.

- local Kubernetes cluster
- docker
- local terraform authorisation tokens

### Installation

```bash
# Clone the repository
git clone https://github.com/Hedgehog-Jr/br-test-task.git

# To deploy infrastructure using terraform tool we have to use ./scripts/run_terraform.sh script
# This scrip require additional argument 'plan' or 'apply' 

# Run terrafrom plan (execute from project root directory)
./scripts/run_terraform.sh plan

# Run terrafrom apply (execute from project root directory)
./scripts/run_terraform.sh apply
```

### Deploying or updating existing Kubernetes services

To deploy new kubernetes service or update existing one:
1. Update `./infra/k8s_services.tf` script. Description of all parameters can be found in `./infra/modules/k8s_service/variables.tf`. Required parameters are:
   * service_name
   * app_name
   * service_port_type
   * docker_image
2. Run plan step to see and verify changes
```bash
./scripts/run_terraform.sh plan
```
3. Run apply step to apply all changes from previous step
```bash
./scripts/run_terraform.sh apply
```

### NOTE
* You can directly execute the apply step without initiating the plan step first. 
If done so, Terraform will automatically execute the plan step and proceed to apply all the changes without any manual intervention.

* Terraform cloud was used as statefile storage. To switch Terraform organization or workspace modify `./infra/main.tf` file.
Also workspace execution mode should be configured as Local (custom).
More details about how to create organization and workspace can be found [here](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/organizations).
