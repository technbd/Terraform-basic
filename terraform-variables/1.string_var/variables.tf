variable "instance_type" {
  type        = string
  description = "Instance type for EC2"
  default     = "t2.micro"

}

variable "ami_id" {
  type        = string
  description = "Ubuntu AMI ID"
  default     = "ami-0d26eb3972b7f8c96"
}

