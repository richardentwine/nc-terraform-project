#VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_range

  tags = {
    Name = var.vpc_name
  }
}

#subnets 

resource "aws_subnet" "public_subnets" {
  count             = length(var.pub_subnets_cidr_blocks)

  vpc_id            = aws_vpc.main.id
  #allows up to two subnets per availabilty zone
  availability_zone = count.index < length(var.availability_zones) ? var.availability_zones[count.index] : var.availability_zones[count.index - length(var.availability_zones)]
  cidr_block        = var.pub_subnets_cidr_blocks[count.index]

  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.pri_subnets_cidr_blocks)

  vpc_id            = aws_vpc.main.id
  #allows up to two subnets per availabilty zone
  availability_zone = count.index < length(var.availability_zones) ? var.availability_zones[count.index] : var.availability_zones[count.index - length(var.availability_zones)]
  cidr_block        = var.pri_subnets_cidr_blocks[count.index]

  tags = {
    Name = "private-subnet-${count.index}"
  }
}

#internet gateway
resource "aws_internet_gateway" "portfolio_gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

#route tables
resource "aws_route" "public_internet_gateway" {

  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.portfolio_gw.id
}

resource "aws_route_table" "public" {
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "public-portfolio-routetable"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public_subnets)

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "private-portfolio-routetable"
  }
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private_subnets)

  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private.id
}