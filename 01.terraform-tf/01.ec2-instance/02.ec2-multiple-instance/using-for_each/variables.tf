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


## Variable-Based Instances
## For MAP: e.g. {map_key: “map_value” }
variable "instances" {
  description = "Configuration for different instance types"

  type = map(object({
    instance_type = string
    tag_name      = string
    
  }))
}





