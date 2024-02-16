variable "sandboxes" {
  description = "Different type of sanbox instance"
  
  type = list(object({
    instance_type = string
    ami           = string
    name          = string
  }))

  default = [
    {
      instance_type = "t2.small"
      ami           = "ami-123456"
      name          = "sandbox_1"
    },

    {
      instance_type = "t2.micro"
      ami           = "ami-1234567"
      name          = "sandbox_2"
    },

    {
      instance_type = "t2.nano"
      ami           = "ami-12345678"
      name          = "sandbox_3"
    }
  ]

}

