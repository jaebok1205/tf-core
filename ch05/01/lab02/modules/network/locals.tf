locals {
  namespace = var.namespace

  vpc = {
    name = "main"
    enable_dns_hostnames = true
    enable_dns_support = true
  }

  subnet = {
    name = "public-a"
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = true

  }
}