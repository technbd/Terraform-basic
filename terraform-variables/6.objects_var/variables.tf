variable "instance_config" {
  description = "Configuration for the EC2 instance"
  
  type = object({
    instance_type = string
    ami_id        = string
    key_name      = string
  })

  default = {
    instance_type = "t2.micro"
    ami_id        = "ami-0c94855ba95c574c8"
    key_name      = "my_key_pair"
  }
}

