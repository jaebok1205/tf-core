locals {
  namespace = var.namespace
  vpc_id = var.vpc_id

  iamrole = {
    name = "instance"
    assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy
    policy_arn         = data.aws_iam_policy.aws_ssm_core_policy.arn
  }

  lb = {
    name = "main"
    internal = false
    load_balancer_type = "application"
    subnets = var.lb_subnets

    listener = {
      port = 80
      protocol = "HTTP"
      cidr_blocks = ["0.0.0.0/0"]
    }

    target_group = {
      port = var.lb_listener_port
      protocol = "HTTP"
      target_type = "instance"

      health_check = {
        enabled = true
        port = var.lb_target_group_port
        protocol = "HTTP"
        path = "/actuator/health"
        healthy_threshold = 3
        unhealthy_threshold = 3
        timeout             = 5
        interval = 30
      }
    }
  }

}