resource "aws_instance" "example" {
  count         = length(var.instance_types)
  instance_type = var.instance_types[count.index]
  # instance_type = var.instance_types[0]
  ami           = "ami-12345678"
  
  # Other configuration for instances...
}

