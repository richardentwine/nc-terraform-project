module "vpc" {
  source = "./modules/vpc"

  vpc_name                = var.vpc_name
  vpc_cidr_range          = var.vpc_cidr_range
  availability_zones      = var.availability_zones
  pub_subnets_cidr_blocks = var.pub_subnets_cidr_blocks
  pri_subnets_cidr_blocks = var.pri_subnets_cidr_blocks
}

module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.vpc_id
}

module "lighting" {
  source = "./modules/lighting"

  vpc_security_group_ids = [module.security.app_server_security_group_id]
  public_subnets         = module.vpc.public_subnets_ids
}