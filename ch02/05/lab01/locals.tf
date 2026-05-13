locals {
  project = "tf-core-lab01"


  instance = {
    name                        = "web01 server"
    ami                         = "ami-0c003e98ceffee43e"
    instance_type               = var.instance_type
    associate_public_ip_address = true

    allow_access = {
      port        = var.service_port
      cidr_blocks = var.cidr_blocks
    }
  }

  iamrole = {
    name = "instance"

    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement   = [{
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }]
    })

    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

  }
/*
  instance2 = {
    name = "web02 server"
    ami = "ami-0c003e98ceffee43e"
    instance_type = "t3.micro"
    associate_public_ip_address = true

    allow_access = {
      port = 0
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
*/
  sg = {

  }

}