locals {
  project = "tf-core-lab01"

  iamrole = {
    name = "instance"

    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }]
    })

    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

  }

  instance = {
    name = "ssm-est"
    ami = "ami-0c003e98ceffee43e"
    instance_type = "t3.micro"

    allow_access = {
      port = 0
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  
  sg = {

  }

}