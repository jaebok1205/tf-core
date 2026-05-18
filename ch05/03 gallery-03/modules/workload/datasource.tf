data "aws_ami" "amazon_linux" {
  most_recent = true  # 이 줄을 추가하세요!
  
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
  
  owners      = ["amazon"]
}