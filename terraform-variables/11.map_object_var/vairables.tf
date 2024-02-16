variable "instance_sizes" {
  description = "Configuration for different instance types"

  type = map(object({
    instance_type = string
    ami           = string
    subnet_id     = string
    key_name      = string
    tag_name      = string
  }))

  default = {
    "t2.micro" = {
      instance_type = "t2.micro"
      ami           = "ami-12345678"
      subnet_id     = "subnet-12345678"
      key_name      = "my-keypair-01"
      tag_name      = "dev"
    }

    "t2.small" = {
      instance_type = "t2.small"
      ami           = "ami-23456789"
      subnet_id     = "subnet-23456789"
      key_name      = "my-keypair-02"
      tag_name      = "prod"

    }

  }
}


