## EC2 variables

#variable "instance_type" {
#  type        = string
#  description = "Instance type for the EC2 instance"
#  #default     = "t2.micro"
#}

variable "ami_id" {
  type        = string
  description = "EC2 Machine image or AMI ID."
  #default     = "ami-123456"
}

variable "subnet_id" {
  description = "Subnet ID"
}




# variable "instance_tags" {
#   description = "Additional tags for the instance"
#   type        = string
# }


