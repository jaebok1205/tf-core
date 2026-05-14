output "instance_web" {
  description = "Gallery EC2 인스턴스 정보"
  value = {
    id = aws_instance.web.id
    public_ip = aws_instance.web.public_ip
    # http_endpoint = "http://${aws_instance.web.public_ip}:${local.instance.allow_access.port}"
    http_endpoint = "http://${aws_instance.web.public_ip}:80"
  }
}

/*
output "sg" {
  value = {
    id = aws_security_group.this.id
    name = aws_security_group.this.name
  }
}

output "iamprofile" {
  value = {
    name = aws_iam_instance_profile.this.name
  }
}

output "iamrole" {
  value = aws_iam_role.this.id
}
*/