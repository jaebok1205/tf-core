resource "aws_iam_role" "this" {
  name = "${local.project}-iamrole-${local.iamrole.name}"

  assume_role_policy = local.iamrole.assume_role_policy.json
  #assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy
  
  tags = {
    Name = "${local.project}-iamrole-${local.iamrole.name}"
  }
}

resource "aws_iam_role_policy_attachment" "this" {
  role = aws_iam_role.this.name
  policy_arn = local.iamrole.policy_arn
}

resource "aws_iam_instance_profile" "this" {
  name = "${local.project}-iamprofile-${local.iamrole.name}"

  role = aws_iam_role.this.name

  tags = {
    Name = "${local.project}-iamprofile-${local.iamrole.name}"
  }
}

resource "aws_vpc" "this" {
  //vpc_id = local.vpc_id
}

resource "aws_security_group" "this" {
  name = "${local.project}-sg-${local.instance.name}"
  vpc_id = local.vpc_id

  ingress {
    from_port = local.instance.allow_access.port
    to_port = local.instance.allow_access.port
    protocol = "tcp"
    cidr_blocks = local.instance.allow_access.cidr_blocks
  }

  egress {
    from_port = local.instance.allow_access.port
    to_port = local.instance.allow_access.port
    protocol = "tcp"
    cidr_blocks = local.instance.allow_access.cidr_blocks
  }

  tags = {
    Name = "${local.project}-sg-instance"
  }
}

resource "aws_instance" "this" {
  ami                         = local.instance.ami
  instance_type               = local.instance.instance_type
  associate_public_ip_address = local.instance.associate_public_ip_address

  vpc_security_group_ids      = [aws_security_group.this.id]
  iam_instance_profile        = aws_iam_instance_profile.this.name
  depends_on                  = [ aws_iam_role_policy_attachment.this]

  tags = {
    Name                      = "${local.project}-instance-${local.instance.name}"
  }

}
/*
resource "aws_instance" "web2" {
  ami                         = local.instance.ami
  instance_type               = local.instance.instance_type
  associate_public_ip_address = local.instance.associate_public_ip_address

  vpc_security_group_ids      = [aws_security_group.this.id]
  iam_instance_profile        = aws_iam_instance_profile.this.name
  depends_on                  = [ aws_iam_role_policy_attachment.this]

  tags = {
    Name                      = "${local.project}-instance-${local.instance.name}"
  }
}
*/



/*
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true # DNS 호스트네임 사용 설정 (추천)

  tags = {
    Name = "tf-core-vpc"
  }
}

# 2. 서브넷 생성 (보안 그룹을 배치할 공간)
resource "aws_subnet" "public_a" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a" # 서울 리전 a존

  tags = {
    Name = "tf-core-subnet-public-a"
  }
}

resource "aws_security_group" "name" {
  vpc_id = aws_vpc.main.id
  name = "${local.project}-sg-web"
  description = "${local.project} default_tags test"

  tags = {
    Name = "${local.project}-sg-web"
  }
}
*/