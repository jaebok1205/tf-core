resource "aws_iam_role" "instance" {
  name = "${local.project}-iamrole-instance-minimal"

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

  tags = {
    Name = "${local.project}-iamrole-instance"
  }
}

resource "aws_iam_role_policy_attachment" "instance" {
  role = aws_iam_role.instance.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "instance" {
  name = "${local.project}-iamprofile-instance"

  role = aws_iam_role.instance.name

  tags = {
    Name = "${local.project}-iamprofile-instance"
  }
}

resource "aws_security_group" "instance" {
  name = "${local.project}-sg-instance"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.project}-sg-instance"
  }
}

resource "aws_instance" "ssm_test" {
  ami = "ami-0c2bff4e36e51470a"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.instance.id]

  iam_instance_profile = aws_iam_instance_profile.instance.name

  depends_on = [ aws_iam_role_policy_attachment.instance]

  tags = {
    Name = "${local.project}-instance-ssm-test"
  }

}




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