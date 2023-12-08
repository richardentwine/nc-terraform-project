# Get the lighting service hosted and working in your network.

# Lighting service

# The service should be able to be contacted externally and interact with a DynamoDB table in your network.

# To contact DynamoDB you will need to create a user with polices to access DynamoDB. Give this user CLI access 
# and use these credentials to authenticate your services in the env files.

# You will also have to set up a User for this service in IAM with a policy to be able to contact DynamoDB. 
# We recommend creating this in the AWS console rather than creating this information using Terraform so as 
# to not expose these keys in your state file.

# To complete this ticket, submit the link to your lighting service via nchelp pr

data "aws_ami" "ubuntu" {
  // Gets the latest ubuntu AMI ID
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical's ID - creators of the Ubuntu AMI
}

resource "aws_instance" "lighting_server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnets[0]
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = true
  key_name                    = "portkey"

  tags = {
    Name = "lighting-server"
  }
}