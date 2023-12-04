# Be in the correct region
# Have 3 Availability Zones
# Have a Public subnet in each AZ
# Have a Private subnet in each AZ
# Have an Internet Gateway
# A route table that can deal with local traffic as well as route to the IGW for any other traffic

#VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_range

  tags = {
    Name = var.vpc_name
  }
}

#subnets 

resource "aws_subnet" "public_subnets" {
  count = length(var.pub_subnets_cidr_blocks)

  vpc_id             = aws_vpc.main.id
  availability_zone  = var.availability_zones[count.index]
  cidr_block         = var.pub_subnets_cidr_blocks[count.index]

  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private_subnets" {
  count = length(var.pri_subnets_cidr_blocks)

  vpc_id                 = aws_vpc.main.id
  availability_zone  = var.availability_zones[count.index]
  cidr_block             = var.pri_subnets_cidr_blocks[count.index]

  tags = {
    Name = "private-subnet-${count.index}"
  }
}

#internet gateway