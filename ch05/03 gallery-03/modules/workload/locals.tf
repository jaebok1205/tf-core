locals {
  namespace = var.namespace

  vpc_id = var.vpc_id

  asg = {
    name = "web"

    max_size = 4#var.asg_max_size
    min_size = 1
    desired_capacity = 1

    vpc_zone_identifier = var.asg_vpc_zone_identifier
    target_group_arns = var.asg_target_group_arns

    health_check_type         = "ELB"
    health_check_grace_period = 600

    deploy_version = "1.0.0"
  }

  lt = {
    name = "web"

    image_id = data.aws_ami.amazon_linux.id
    instance_type = "t3.small"

    iam_instance_profile = {
      name = var.lt_iam_instance_profile_name
    }

    # user_data = base64encode(templatefile("templates/user_data.sh.tpl", {
    #   profile     = "dev"
    #   server_port = 8080
    # }))

    user_data = base64encode(templatefile("${path.module}/templates/user_data.sh.tpl", {
      profile     = "dev"
      server_port = var.lt_service_port
    }))

    allow_access = {
      port        = var.lt_service_port
      cidr_blocks = var.lt_allow_access_cidr_blocks
    }
  }
}