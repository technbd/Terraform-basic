variable "web_instance" {
  type = map

  default 	= {
    dev = "t2.micro"
    prod = "t2.small"
    ami_id = "ami-12345678"
  }
}

