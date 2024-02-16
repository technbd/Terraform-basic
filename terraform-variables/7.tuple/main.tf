resource "aws_instance" "example" {
  instance_type = var.ec2_instance[0]
  ami           = var.ec2_instance[1]

  tags = {
    Name = var.ec2_instance[2]
    ENV = var.ec2_instance[3]
  }

}

