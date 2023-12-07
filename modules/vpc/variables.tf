variable "vpc_name" {
    description = "VPC name"
    type        = string
} 

variable "vpc_cidr_range" {
    description = "cidr range for the VPC"
    type = string
}

variable "pub_subnets_cidr_blocks" {
    description = "cidr range for public subnets"
    type = list(string)
}

variable "pri_subnets_cidr_blocks" {
    description = "cidr range for private subnets"
    type = list(string)
}

variable "availability_zones" {
  description = "Availiability zones"
  type        = list(string)
}