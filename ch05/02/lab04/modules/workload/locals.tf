locals {
  namespace = var.namespace

  vpc_id = var.vpc_id

  instance = {
    name = "web"

    ami = data.aws_ami.amazon_linux.id
    instance_type = "t3.small"
    associate_public_ip_address = false
    subnet_id = var.instance_subnet_id
    
    iam_instance_profile = var.instance_iam_instance_profile

    allow_access = {
      port        = 80
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  lb = {
    target_group_arn = var.lb_target_group_arn
  }
}