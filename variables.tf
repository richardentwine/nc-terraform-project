variable "vpc_name" {
  description = "VPC name with a default value if none provided"
  type        = string
  default     = "main"
}

variable "vpc_cidr_range" {
  description = "cidr range with a default value if none is provided"
  type        = string
  default     = "10.0.0.0/16"
}

variable "pub_subnets_cidr_blocks" {
  description = "cidr range for public subnets with defaults if none are provided"
  type        = list(string)
  default     = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
}

variable "pri_subnets_cidr_blocks" {
  description = "cidr range for public subnets with defaults if none are provided"
  type        = list(string)
  default     = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
}

variable "availability_zones" {
  description = "Availiability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}  
