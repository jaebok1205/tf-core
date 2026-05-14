output "instance_web" {
  description = "Gallery EC2 인스턴스 정보"
  value = {
    id = aws_instance.this.id
    public_ip = aws_instance.this.public_ip
    # http_endpoint = "http://${aws_instance.this.public_ip}:${local.instance.allow_access.port}"
    http_endpoint = "http://${aws_instance.this.public_ip}:${local.instance.allow_access.port}"
  }
}

output "web_endpoint" {
  value = "http://${aws_instance.this.public_ip}:${local.instance.allow_access.port}"
}

