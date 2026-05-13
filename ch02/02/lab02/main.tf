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