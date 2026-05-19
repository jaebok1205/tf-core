locals {
  org       = "tf-core"
  project   = "gallery04"
  environment = var.env
  
  namespace = "${local.org}-${local.project}-${local.environment}"

  infra = {
    lb = {
      listener_port = 80#var.infra_lb_listener_port
    }

    lt = {
      service_port = 8080#var.infra_lt_service_port
      instance_type = var.infra_lt_instance_type
    }

    asg = { 
      max_size = var.infra_asg_max_size
      min_size = var.infra_asg_min_size
      desired_capacity = var.infra_asg_desired_capacity
      deploy_version = "1.0.0" #var.infra_asg_deploy_version
    }
  }
}