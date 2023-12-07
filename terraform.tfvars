region                  ="eu-west-2"

vpc_name                = "portfolio-vpc"

vpc_cidr_range          = "10.0.0.0/16"

pub_subnets_cidr_blocks = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]

pri_subnets_cidr_blocks = ["10.0.8.0/24", "10.0.9.0/24", "10.0.10.0/24"]

availability_zones      = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]