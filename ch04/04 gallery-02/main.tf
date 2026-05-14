resource "aws_iam_role" "this" {
  name               = "${local.namespace}-iamrole-${local.iamrole.name}"
  assume_role_policy = local.iamrole.assume_role_policy

  tags = {
    Name = "${local.namespace}-iamrole-${local.iamrole.name}"
  }
}

resource "aws_iam_instance_profile" "this" {
  name = "${local.namespace}-iamprofile-${local.iamrole.name}"
  role = aws_iam_role.this.name

  tags = {
    Name = "${local.namespace}-iamprofile-${local.iamrole.name}"
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = local.iamrole.policy_arn
}

resource "aws_security_group" "this" {
  name   = "${local.namespace}-sg-instance-${local.instance.name}"
  vpc_id = local.vpc_id

  ingress {
    from_port   = local.instance.allow_access.port
    to_port     = local.instance.allow_access.port
    protocol    = "tcp"
    cidr_blocks = local.instance.allow_access.cidr_blocks
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.namespace}-sg-instance-${local.instance.name}"
  }
}

resource "aws_instance" "this" {
  ami                         = local.instance.ami
  instance_type               = local.instance.instance_type
  subnet_id                   = local.instance.subnet_id
  associate_public_ip_address = local.instance.associate_public_ip_address

  # key_name                    = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [aws_security_group.this.id]
  iam_instance_profile   = aws_iam_instance_profile.this.name

  user_data_replace_on_change = true
  user_data = local.instance.user_data
  depends_on = [aws_iam_role_policy_attachment.this]

  tags = {
    Name = "${local.namespace}-instance-${local.instance.name}"
  }
}



# resource "aws_key_pair" "deployer" {
#   key_name   = "docker_key"
#   public_key = file("~/docker_key.pem") # 로컬 공개키 경로
# }