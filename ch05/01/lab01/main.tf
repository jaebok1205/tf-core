module "vpc" {
  source = "./modules/vpc"

  name = "main"
  namespace = local.namespace
  cidr_block = "10.0.0.0/16"
}

module "subnet" {
  source = "./modules/subnet"

  name = "public-a"
  namespace = local.namespace

  vpc_id = module.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true
}