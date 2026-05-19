module "network" {
  source = "./modules/network"
  namespace = local.namespace
}

module "platform" {
  source = "./modules/platform"
  namespace = local.namespace

  vpc_id = module.network.vpc["main"].id
  lb_subnets = [
    module.network.subnet["public-a"].id,
    module.network.subnet["public-b"].id
  ]

  lb_target_group_port = local.infra.lt.service_port
  lb_listener_port = local.infra.lb.listener_port
}

module "workload" {
  source = "./modules/workload"

  namespace = local.namespace
  vpc_id = module.network.vpc["main"].id

  asg_vpc_zone_identifier = [module.network.subnet["private-a"].id, module.network.subnet["private-b"].id]
  asg_target_group_arns = [module.platform.lb["main"].target_group.arn]
  asg_deploy_version = local.infra.asg.deploy_version
  asg_max_size = local.infra.asg.max_size
  asg_min_size = local.infra.asg.min_size
  asg_desired_capacity = local.infra.asg.desired_capacity


  lt_iam_instance_profile_name = module.platform.iamprofile["instance"].name
  lt_allow_access_cidr_blocks = [module.network.subnet["public-a"].cidr_block, module.network.subnet["public-b"].cidr_block]
  lt_service_port = local.infra.lt.service_port
  lt_instance_type = local.infra.lt.instance_type
  # instance_subnet_id = module.network.subnet["private-a"].id
  # instance_iam_instance_profile = module.platform.iamprofile["instance"].name
  # instance_allow_access_cidr_blocks = [module.network.subnet["public-a"].cidr_block, module.network.subnet["public-b"].cidr_block]
  # lb_target_group_arn = module.platform.lb["main"].target_group.arn


}