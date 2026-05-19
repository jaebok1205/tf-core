locals {
  org = "tf-core"
  project = "lab01"
  environment = var.env

  namespace = "${local.org}-${local.project}-${local.environment}"

  infra = {
    lb = {
      listener_port = var.infra_lb_listener_port
    }

    lt = {
      instance_type = var.infra_lt_instance_type
      service_port = var.infra_lb_service_port
    }

    db = {
      username = var.infra_db_username
      userpassword = var.infra_db_password
    }

    asg = { 
      max_size = var.infra_asg_max_size
      min_size = var.infra_asg_min_size
      desired_capacity = var.infra_asg_desired_capacity
      deploy_version = var.infra_asg_deploy_version
    }
  }
}