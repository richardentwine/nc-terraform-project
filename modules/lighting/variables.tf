variable "vpc_security_group_ids" {
  type = list(string)
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets to launch your EC2 instances in"
}
