locals {
  namespace = var.namespace

  vpc = {
    name = "main"

    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
  }

  natgw = {
    name = "main"
  }

  public_subnet = [
    {
      name = "public-a"
      cidr_block = "10.0.1.0/24"
      availability_zone = "ap-northeast-2a"
      map_public_ip_on_launch = true
    },
    {
      name = "public-b"
      cidr_block = "10.0.2.0/24"
      availability_zone = "ap-northeast-2b"
      map_public_ip_on_launch = true
    }
  ]

  private_subnet = [
    {
      name = "private-a"
      cidr_block = "10.0.101.0/24"
      availability_zone = "ap-northeast-2a"
      map_public_ip_on_launch = false
    },
    {
      name = "private-b"
      cidr_block = "10.0.102.0/24"
      availability_zone = "ap-northeast-2b"
      map_public_ip_on_launch = false
    }
  ]
}