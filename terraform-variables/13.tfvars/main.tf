resource "aws_vpc" "web_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    name = "web_vpc"
  }
}


