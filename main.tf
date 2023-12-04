module "vpc" {
  source = "./modules/vpc"

  vpc_name           = var.vpc_name
  vpc_cidr_range         = var.vpc_cidr_range
#   availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
    pub_subnets_cidr_blocks     = var.pub_subnets_cidr_blocks
    pri_subnets_cidr_blocks    = var.pri_subnets_cidr_blocks
}