variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default = "t2.micro"
}

variable "ami" {
  type        = string
  description = "cidr for web_vpc"
  default = "EC2 instance machine image"
}

